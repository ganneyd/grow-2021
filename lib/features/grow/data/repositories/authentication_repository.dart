import 'dart:async';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:dartz/dartz.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_core/firebase_core.dart';
import 'package:grow_run_v1/features/grow/data/repositories/repository_mixins.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/authentication_repository.dart';
import 'package:logging/logging.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/entities_bucket.dart';

///Implementation for the Authentication Repository
///Takes an [FireBaseAuth] instance;
class AuthenticationRepositoryImplementation extends AuthenticationRepository
    with RepoMixins {
  ///Takes an [FirebaseAuth] instance
  AuthenticationRepositoryImplementation(
    firebase_auth.FirebaseAuth firebaseAuth,
  )   : _firebaseAuth = firebaseAuth,
        _signUpUserCallable =
            FirebaseFunctions.instance.httpsCallable('signUpUser'),
        _disableUserCallable =
            FirebaseFunctions.instance.httpsCallable('disableUser'),
        _enableUserCallable =
            FirebaseFunctions.instance.httpsCallable('enableUser');

  final firebase_auth.FirebaseAuth _firebaseAuth;

  final Logger _authLogger = Logger('Auth-Repo');
  //Firebase Function reference
  final HttpsCallable _signUpUserCallable,
      _disableUserCallable,
      _enableUserCallable;

  UserEntity _getUserEntity(firebase_auth.User? user,
      {UserType userType = UserType.unknown,
      Map<String, dynamic> claims = const <String, dynamic>{}}) {
    _authLogger.fine('user type passed to me $userType');
    if (user == null) {
      _authLogger.info('user was empty', user);
      return UserEntity.empty;
    }
    return UserEntity(
        userEmail: user.email ?? '',
        userID: user.uid,
        name: user.displayName ?? ' ',
        userType: userType,
        claims: claims);
  }

  @override
  Future<Either<Failure, void>> disableUserAccount(String userID) async {
    // TODO: implement enableUserAccount
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserEntity>> enableUserAccount(String userID) {
    // TODO: implement enableUserAccount
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> loginUser(String email, String password) async {
    try {
      _authLogger.finer('login user called');
      final firebase_auth.UserCredential user = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      _authLogger.fine('User from firebase auth', user);
      return const Right<Failure, void>(null);
    } on firebase_auth.FirebaseAuthException catch (e) {
      _authLogger.severe('Firebase auth failure:', e, e.stackTrace);
      return Left<Failure, UserEntity>(
          AuthenticationFailure(errMsg: e.message!));
    } catch (e) {
      _authLogger.severe('Firebase auth failure:', e);
      return const Left<Failure, UserEntity>(AuthenticationFailure());
    }
  }

  @override
  Future<Either<Failure, UserEntity>> registerUser(
      String email, String password) async {
    ///variable to hold the newly created user
    firebase_auth.UserCredential userCredential;
    try {
      ///new [FirebaseApp] instance
      final FirebaseApp app = await Firebase.initializeApp(
          name: 'Secondary', options: Firebase.app().options);

      ///create the new user using the email and password provided
      userCredential = await firebase_auth.FirebaseAuth.instanceFor(app: app)
          .createUserWithEmailAndPassword(email: email, password: password);
      await firebase_auth.FirebaseAuth.instanceFor(app: app).signOut();
      //delete the app
      await app.delete();
      //return the UserModel for the newly registered user

      return Right<Failure, UserEntity>(_getUserEntity(userCredential.user));
    } on firebase_auth.FirebaseAuthException catch (e) {
      // Do something with exception. This try/catch is here to make sure
      // that even if the user creation fails, app.delete() runs, if is not,
      // next time Firebase.initializeApp() will fail as the previous one was
      // not deleted.
      return Left<Failure, UserEntity>(
          AuthenticationFailure(errMsg: e.message!));
    } catch (e) {
      return const Left<Failure, UserEntity>(AuthenticationFailure());
    }
  }

  @override
  Future<Either<Failure, void>> signOutUser() async {
    try {
      _authLogger.finer('sign out user called');
      return Right<Failure, void>(_firebaseAuth.signOut());
    } on firebase_auth.FirebaseAuthException catch (e) {
      _authLogger.severe('Firebase auth failure:', e, e.stackTrace);
      return Left<Failure, void>(AuthenticationFailure(errMsg: e.message!));
    } catch (e) {
      _authLogger.severe(
        'failure:',
        e,
      );
      return const Left<Failure, void>(AuthenticationFailure(
          errMsg: 'Unable to sign out, please try again.'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> authenticateUser(
      String email, String password) async {
    _authLogger.severe(
      'Method authenticateUser() called',
    );
    return const Left<Failure, UserEntity>(AuthenticationFailure());
  }

  @override
  Stream<UserEntity> get user {
    //TODO fix this shit, cleaner code

    _authLogger.fine('auth user changed');
    return _firebaseAuth
        .authStateChanges()
        .map<UserEntity>((firebase_auth.User? firebaseUser) {
      return _getUserEntity(firebaseUser);
    });
  }

  @override
  Future<Either<Failure, UserEntity>> getCredentials() async {
    _authLogger.finer('get credentials called');
    if (firebase_auth.FirebaseAuth.instance.currentUser != null) {
      _authLogger.fine('''
 user was not null the user is : ${firebase_auth.FirebaseAuth.instance.currentUser}''',
          firebase_auth.FirebaseAuth.instance.currentUser);
      try {
        final firebase_auth.User user =
            firebase_auth.FirebaseAuth.instance.currentUser!;
        _authLogger.info('Attempting to fetch auth claims');
        final firebase_auth.IdTokenResult results =
            await user.getIdTokenResult();
        final Map<String, dynamic> claims = results.claims!;
        _authLogger.fine('Claims that were received', claims);

        if (claims.containsKey('child')) {
          if (claims['child'] as bool) {
            return Right<Failure, UserEntity>(_getUserEntity(
              user,
              userType: UserType.child,
            ));
          }
        } else if (claims.containsKey('parent')) {
          if (claims['parent'] as bool) {
            return Right<Failure, UserEntity>(
                _getUserEntity(user, userType: UserType.parent));
          }
        }

        return Right<Failure, UserEntity>(_getUserEntity(user));
      } on FirebaseException catch (e) {
        _authLogger.severe('''
Firebase Exception ${e.message} ${e.code} 
${e.plugin} ${e.stackTrace}''', e, e.stackTrace);

        return Left<Failure, UserEntity>(
            AuthenticationFailure(errMsg: e.message ?? ''));
      } catch (e) {
        _authLogger.severe(
          'Unknown Exception ',
          e,
        );

        return Left<Failure, UserEntity>(
            AuthenticationFailure(errMsg: e.toString()));
      }
    }
    _authLogger.severe(
      'User was probably null ',
    );
    return const Left<Failure, UserEntity>(AuthenticationFailure());
  }

  @override
  Future<Either<Failure, UserEntity>> signUpUser(
      {required String dependentEmail,
      required String dependentPassword,
      String? dependencyEmail,
      String? dependencyPassword,
      required UserType dependentUserType,
      UserType? dependencyUserType,
      required Map<String, dynamic> dependentData}) async {
    final Map<String, dynamic> functionJSON = <String, dynamic>{
      'dependent': <String, dynamic>{
        'email': dependentEmail,
        'password': dependentPassword,
        'data': dependentData,
        'user_type': EnumToString.convertToString(dependentUserType)
      }
    };

    if (dependencyEmail != null &&
        dependencyPassword != null &&
        dependencyUserType != null) {
      functionJSON['dependency'] = <String, dynamic>{
        'email': dependencyEmail,
        'password': dependencyPassword,
        'user_type': EnumToString.convertToString(dependencyUserType)
      };
      _authLogger.finest(
          'The json being passed to the firebase functions is : ',
          functionJSON);
    }
    try {
      _authLogger.fine('Calling the function');
      //create user with the email and password passed
      final HttpsCallableResult<Map<String, dynamic>> result =
          await _signUpUserCallable.call<Map<String, dynamic>>(functionJSON);
      //parse the uid of the user from the  results and get the credentials
      //for that user
      _authLogger.fine('Function executed with this result', result);
      //return the credentials of the newly created user
      return Right<Failure, UserEntity>(UserEntity(
        userID: result.data['user'] as String,
        userEmail: ' ',
        name: ' ',
      ));
    } on FirebaseFunctionsException catch (e) {
      _authLogger.severe('FirebaseFunction  exception', e, e.stackTrace);
      return Left<Failure, UserEntity>(
          AuthenticationFailure(errMsg: e.message!));
    } catch (e) {
      return Left<Failure, UserEntity>(
          AuthenticationFailure(errMsg: e.toString()));
    }
  }

  @override
  Either<Failure, String> getCurrentUserID() {
    try {
      return Right<Failure, String>(_firebaseAuth.currentUser!.uid);
    } catch (e) {
      return const Left<Failure, String>(
          AuthenticationFailure(errMsg: "Couldn't get user id"));
    }
  }

  @override
  Future<Either<Failure, void>> resetPassword({
    required String email,
    String? newPassword,
  }) {
    try {
      _authLogger.info('Resetting password... email is $email');
      return Future<Either<Failure, void>>.value(
        Right<Failure, void>(
          _firebaseAuth.sendPasswordResetEmail(email: email),
        ),
      );
    } catch (e) {
      _authLogger.severe('Exception in resetting password encounter $e');

      return Future<Either<Failure, void>>.value(
        const Left<Failure, void>(
          AuthenticationFailure(
            errMsg: 'Unable to reset your password, please try again',
          ),
        ),
      );
    }
  }
}
