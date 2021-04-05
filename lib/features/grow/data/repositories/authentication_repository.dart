import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:grow_run_v1/features/grow/data/models/user/user_model.dart';
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
    FirebaseAuth firebaseAuth,
  ) : _firebaseAuth = firebaseAuth;

  final FirebaseAuth _firebaseAuth;

  UserEntity _getUserEntity(UserCredential userCredential) {
    return UserEntity(
        userEmail: userCredential.user!.email!,
        userID: userCredential.user!.uid);
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
  Future<Either<Failure, UserEntity>> loginUser(
      String email, String password) async {
    try {
      final UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      return Right<Failure, UserEntity>(_getUserEntity(userCredential));
    } on FirebaseAuthException catch (e) {
      return Left<Failure, UserEntity>(
          AuthenticationFailure(errMsg: e.message!));
    } catch (e) {
      return Left<Failure, UserEntity>(AuthenticationFailure());
    }
  }

  @override
  Future<Either<Failure, UserEntity>> registerUser(
      String email, String password) async {
    ///variable to hold the newly created user
    UserCredential userCredential;
    try {
      ///new [FirebaseApp] instance
      final FirebaseApp app = await Firebase.initializeApp(
          name: 'Secondary', options: Firebase.app().options);

      ///create the new user using the email and password provided
      userCredential = await FirebaseAuth.instanceFor(app: app)
          .createUserWithEmailAndPassword(email: email, password: password);
      await FirebaseAuth.instanceFor(app: app).signOut();
      //delete the app
      await app.delete();
      //return the UserModel for the newly registered user

      return Right<Failure, UserEntity>(_getUserEntity(userCredential));
    } on FirebaseAuthException catch (e) {
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
    } on FirebaseAuthException catch (e) {
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
      final UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      //return the credentials of the newly created user
      return Right<Failure, UserEntity>(_getUserEntity(userCredential));
    } on FirebaseAuthException catch (e) {
      return Left<Failure, UserEntity>(
          AuthenticationFailure(errMsg: e.message!));
    } catch (e) {
      return Left<Failure, UserEntity>(
          AuthenticationFailure(errMsg: e.toString()));
    }
  }
}
