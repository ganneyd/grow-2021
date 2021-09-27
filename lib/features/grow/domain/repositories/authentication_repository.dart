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
  /// Stream of [UserEntity] which will emit the current user when
  /// the authentication state changes.
  ///
  /// Emits [User.empty] if the user is not authenticated.
  Stream<UserEntity> get user;

  ///Authenticates a user's account using a second instance of firebase auth
  Future<Either<Failure, UserEntity>> authenticateUser(
      String email, String password);

  ///Signs up a new user using the [dependentEmail] and [dependentPassword]
  ///populates the database with the [dependentData]
  ///if a [dependency] is specified, such as the person who is creating the
  ///account for the dependent ex parent or admin users;
  ///then the [dependencyEmail] [dependencyPassword] and [dependencyUserType]
  ///should be provided
  Future<Either<Failure, UserEntity>> signUpUser(
      {required String dependentEmail,
      required String dependentPassword,
      String? dependencyEmail,
      String? dependencyPassword,
      required UserType dependentUserType,
      UserType? dependencyUserType,
      required Map<String, dynamic> dependentData});

  ///Registers a new [User] account up by using the [email] and [password]
  ///along with a second instance of the authentication library.
  ///returns the [UserCredentials] for the new user  if successful and
  ///[Failure] if unsuccessful
  Future<Either<Failure, UserEntity>> registerUser(
      String email, String password);

  ///Logs in the user using thier [email] and [password] then return the
  ///[uid]  for the user
  Future<Either<Failure, void>> loginUser(String email, String password);

  ///Signs out currently signed in user;
  Future<Either<Failure, void>> signOutUser();

  ///Disables a user  account by using the [userID] and disabling
  ///that account from further use
  Future<Either<Failure, void>> disableUserAccount(String userID);

  ///Enables a user user account  by using the [userID] and thus
  ///permit use on that account again
  Future<Either<Failure, UserEntity>> enableUserAccount(String userID);

  ///Gets the credentials for the user and return a [UserEntity()] with the
  ///corresponding [user_type]
  ///user types such as [child] [parent]
  Future<Either<Failure, UserEntity>> getCredentials();

  ///get the current user id
  Either<Failure, String> getCurrentUserID();

  ///resets the user's password
  ///if provided the [newPassword] then that becomes the new
  ///if not a reset link is sent to the [email]
  Future<Either<Failure, void>> resetPassword(
      {required String email, String? newPassword});
}
