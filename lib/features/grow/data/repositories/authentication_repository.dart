import 'dart:async';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:dartz/dartz.dart';
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
  ) : _firebaseAuth = firebaseAuth;

  final firebase_auth.FirebaseAuth _firebaseAuth;

  UserEntity _getUserEntity(firebase_auth.UserCredential userCredential) {
    return UserEntity(
        userEmail: userCredential.user!.email ?? '',
        userID: userCredential.user!.uid,
        name: userCredential.user!.displayName ?? ' ');
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

      return Right<Failure, UserEntity>(_getUserEntity(userCredential));
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
  Future<Either<Failure, UserEntity>> signUpUser(
      String email, String password) async {
    try {
      //create user with the email and password passed
      final firebase_auth.UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      //return the credentials of the newly created user
      return Right<Failure, UserEntity>(_getUserEntity(userCredential));
    } on firebase_auth.FirebaseAuthException catch (e) {
      return Left<Failure, UserEntity>(
          AuthenticationFailure(errMsg: e.message!));
    } catch (e) {
      return Left<Failure, UserEntity>(
          AuthenticationFailure(errMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> authenticateUser(
      String email, String password) async {
    print('about to call function');

    final HttpsCallable callable =
        FirebaseFunctions.instance.httpsCallable('getParentCredential');
    print('before the actual call');
    final HttpsCallableResult<Map<String, dynamic>> result = await callable
        .call(<String, dynamic>{'email': email, 'password': password});
    print('The uid is ${result.data['uid']}');

    if (result.data.containsKey('uid')) {
      return Right<Failure, UserEntity>(UserEntity(
          userID: result.data['uid'].toString(),
          name: 'auth',
          userEmail: 'auth',
          userType: UserType.parent));
    } else {
      return Left<Failure, UserEntity>(AuthenticationFailure(
          errMsg: result.data['errorInfo']!['message']!.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getAuthenticatedUser() async {
    if (_firebaseAuth.currentUser != null) {
      return Right<Failure, UserEntity>(UserEntity(
          userEmail: _firebaseAuth.currentUser!.email!,
          userID: _firebaseAuth.currentUser!.uid,
          name: _firebaseAuth.currentUser!.displayName!));
    } else {
      return Left<Failure, UserEntity>(AuthenticationFailure());
    }
  }

  @override
  Stream<UserEntity> get user {
    print('user changed');
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      return firebaseUser == null ? UserEntity.empty : firebaseUser.toUser;
    });
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
