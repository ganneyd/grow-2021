import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grow_run_v1/core/error/failures.dart';
import 'package:grow_run_v1/features/grow/domain/entities/user/user_entity.dart';

///Deals with all generic user interaction with the auth service such as
/// [signOut()]
/// [loginUser()]
/// [disableUserAccount()]
/// [signUpWithEmailAndPassword()]
/// [registerUser()]
abstract class AuthenticationRepository {
  ///Signs up a new user using the [email] and [password] passsed
  Future<Either<Failure, UserEntity>> signUpUser(String email, String password);

  ///Registers a new [User] account up by using the [email] and [password]
  ///along with a second instance of the authentication library.
  ///returns the [UserCredentials] for the new user  if successful and
  ///[Failure] if unsuccessful
  Future<Either<Failure, UserEntity>> registerUser(
      String email, String password);

  ///Logs in the user using thier [email] and [password] then return the
  ///[uid]  for the user
  Future<Either<Failure, UserEntity>> loginUser(String email, String password);

  ///Signs out currently signed in user;
  Future<Either<Failure, void>> signOutUser();

  ///Disables a user  account by using the [userID] and disabling
  ///that account from further use
  Future<Either<Failure, void>> disableUserAccount(String userID);

  ///Enables a user user account  by using the [userID] and thus
  ///permit use on that account again
  Future<Either<Failure, UserEntity>> enableUserAccount(String userID);
}
