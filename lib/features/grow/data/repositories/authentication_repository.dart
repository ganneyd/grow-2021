import 'dart:async';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:dartz/dartz.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_core/firebase_core.dart';
import 'package:grow_run_v1/features/grow/data/repositories/repository_mixins.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/authentication_repository.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/entities_bucket.dart';

///Implementation for the Authenticaton Repository
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
  //Firebase Function reference
  final HttpsCallable _signUpUserCallable,
      _disableUserCallable,
      _enableUserCallable;

  UserEntity _getUserEntity(firebase_auth.User user,
      {UserType userType = UserType.unknown}) {
    print('user type passed to me $userType');
    return UserEntity(
        userEmail: user.email ?? '',
        userID: user.uid,
        name: user.displayName ?? ' ',
        userType: userType);
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
      print('login in');
      firebase_auth.UserCredential user = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      print(user.user!.email);
      return const Right<Failure, void>(null);
    } on firebase_auth.FirebaseAuthException catch (e) {
      print('FAILURE: ${e.stackTrace}');
      return Left<Failure, UserEntity>(
          AuthenticationFailure(errMsg: e.message!));
    } catch (e) {
      print('FAILURE: ${e.toString()}');
      return Left<Failure, UserEntity>(AuthenticationFailure());
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

      return Right<Failure, UserEntity>(_getUserEntity(userCredential.user!));
    } on firebase_auth.FirebaseAuthException catch (e) {
      // Do something with exception. This try/catch is here to make sure
      // that even if the user creation fails, app.delete() runs, if is not,
      // next time Firebase.initializeApp() will fail as the previous one was
      // not deleted.
      return Left<Failure, UserEntity>(
          AuthenticationFailure(errMsg: e.message!));
    } catch (e) {
      return Left<Failure, UserEntity>(AuthenticationFailure());
    }
  }

  @override
  Future<Either<Failure, void>> signOutUser() async {
    try {
      return Right<Failure, void>(_firebaseAuth.signOut());
    } on firebase_auth.FirebaseAuthException catch (e) {
      return Left<Failure, void>(AuthenticationFailure(errMsg: e.message!));
    } catch (e) {
      return Left<Failure, void>(AuthenticationFailure(
          errMsg: 'Unable to sign out, please try again.'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> authenticateUser(
      String email, String password) async {
    return Left<Failure, UserEntity>(AuthenticationFailure());
  }

  @override
  Future<Either<Failure, UserEntity>> getAuthenticatedUser() async {
    print('why am i being calledd');
    return getCredentials();
  }

  @override
  Stream<UserEntity> get user {
    //TODO fix this shit, cleaner code
    print('user changed');
    return _firebaseAuth
        .authStateChanges()
        .map((firebase_auth.User? firebaseUser) {
      return firebaseUser != null
          ? _getUserEntity(firebaseUser)
          : UserEntity.empty;
    });
  }

  @override
  Future<Either<Failure, UserEntity>> getCredentials() async {
    print('getting credentials');
    if (firebase_auth.FirebaseAuth.instance.currentUser != null) {
      final firebase_auth.User user =
          firebase_auth.FirebaseAuth.instance.currentUser!;

      final firebase_auth.IdTokenResult results =
          await user.getIdTokenResult(true);
      final Map<String, dynamic> claims = results.claims!;

      final bool child = claims['child'] as bool;
      final bool parent = claims['parent'] as bool;
      print('Child is $child \n Parent is $parent');
      if (child) {
        print('child found');
        return Right<Failure, UserEntity>(
            _getUserEntity(user, userType: UserType.child));
      }
      if (parent) {
        print('Parent found! auth repo');
        return Right<Failure, UserEntity>(
            _getUserEntity(user, userType: UserType.parent));
      }
      return Right<Failure, UserEntity>(_getUserEntity(user));
      // } catch (e) {
      //   print(e);
      //   return Left<Failure, UserEntity>(AuthenticationFailure());
      // }
    }
    return Left<Failure, UserEntity>(AuthenticationFailure());
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
    }
    try {
      print(functionJSON);
      //create user with the email and password passed
      final HttpsCallableResult<Map<String, dynamic>> result =
          await _signUpUserCallable.call<Map<String, dynamic>>(functionJSON);
      //parse the uid of the user from the  results and get the credentials
      //for that user

      //return the credentials of the newly created user
      return Right<Failure, UserEntity>(UserEntity(
          userID: result.data['user'] as String, userEmail: ' ', name: ' '));
    } on FirebaseFunctionsException catch (e) {
      return Left<Failure, UserEntity>(
          AuthenticationFailure(errMsg: e.message!));
    } catch (e) {
      return Left<Failure, UserEntity>(
          AuthenticationFailure(errMsg: e.toString()));
    }
  }
}

extension on firebase_auth.User {
  UserEntity get toUser {
    return UserEntity(
        userID: uid,
        userEmail: email ?? UserEntity.empty.userEmail,
        name: displayName ?? UserEntity.empty.name);
  }
}
