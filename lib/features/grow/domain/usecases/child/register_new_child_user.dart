import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grow_run_v1/features/grow/domain/entities/user/user_entity.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/authentication_repository.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/child_repository.dart';
import 'package:grow_run_v1/features/grow/domain/usecases/mixins.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecases.dart';
import '../../entities/child/child_entity.dart';

///When a new child user's account is being made this is the usecase
///It uses the [registerUser()] from the [AuthenticationRepository] and then
///uses the returned [UserCredential] to populate the database using
///the [createChildUserData()] mehtod from the [ChildRepository]
class RegisterNewChildUser implements UseCase<UserEntity, Params> {
  ///Constructor
  RegisterNewChildUser(
      {required AuthenticationRepository authenticationRepository,
      required ChildRepository childRepository})
      : _authenticationRepository = authenticationRepository,
        _childRepository = childRepository;

  final AuthenticationRepository _authenticationRepository;
  final ChildRepository _childRepository;

  @override
  Future<Either<Failure, UserEntity>> call(Params params) async {
    //attemp to authenticate the user and store it in a variable

    //call the registerUser() method and then wait for the
    //UserEntity that contains the  user's uid and email
    final Either<Failure, UserEntity> userCredential =
        await _authenticationRepository.registerUser(
            params.email, Params.defaultPassword);

    //check to see if the userCredential returns successfully, which is right
    // and then create the user data in the db
    if (userCredential.isRight()) {
      final UserEntity user = userCredential.getOrElse(
          () => const UserEntity(userEmail: 'test-email', userID: 'test-id '));
      final ChildEntity childWithID =
          toChilEntityWithID(params.child, user.userID);

      //if successful try to poppulate the children collection with the
      //child's information
      final Either<Failure, void> createData =
          await _childRepository.createChildData(childWithID);

      //if the user data was created successfully then
      //return the UserEntity object
      if (createData.isRight()) {
        return Right<Failure, UserEntity>(user);
      } else {
        //if an error occured and was not foreseen then return this
        return Left<Failure, UserEntity>(RegistrationFailure());
      }
    } else {
      //if userCredential isn't an instance of Right then it must be left
      //so we return a failure
      return Left<Failure, UserEntity>(RegistrationFailure());
    }
  }
}

///params
class Params extends Equatable {
  ///Params
  const Params({required this.email, required this.child});

  ///Email of the child being registered
  final String email;

  ///password of the child being registered by default its [password12]
  static const String defaultPassword = 'password12';

  ///the child entity containing the child's info
  final ChildEntity child;
  @override
  List<Object> get props => <Object>[email, defaultPassword, child];
}
