import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grow_run_v1/features/grow/domain/entities/entities_bucket.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/authentication_repository.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/parent_repository.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecases.dart';
import '../mixins.dart';

///When a new parent user's account is being made this is the usecase
class SignUpNewParentUser implements UseCase<void, Params> {
  ///Constructor
  SignUpNewParentUser(
      {required AuthenticationRepository authenticationRepository,
      required ParentRepository parentRepository})
      : _authenticationRepository = authenticationRepository,
        _parentRepository = parentRepository;

  final AuthenticationRepository _authenticationRepository;
  final ParentRepository _parentRepository;
  @override
  Future<Either<Failure, void>> call(Params params) async {
    //attemp to authenticate the user and store it in a variable
    final Either<Failure, UserEntity> userCredential =
        await _authenticationRepository.signUpUser(
            params.email, params.password);
    userCredential.fold((Failure l) {
      // if an error occured when trying to authenticate the user
      // an failure is returned with the message
      return Left<Failure, dynamic>(RegistrationFailure());
    }, (UserEntity user) {
      //if successful try to poppulate the children collection with the
      //child's information
      return _parentRepository
          .createParentData(toParentEntityWithID(params.parent, user.userID));
    });
    //if an error occured and was not foreseen then return this
    return Left<Failure, dynamic>(RegistrationFailure());
  }
}

///Parameters required by the UseCase
class Params extends Equatable {
  ///Params needed
  const Params(
      {required this.email, required this.password, required this.parent});

  ///Email of the parent to be signed up
  final String email;

  ///Password of the parent to be signed up
  final String password;

  ///The parent's data that will be used to populate the database
  final ParentEntity parent;

  @override
  List<Object> get props => <Object>[email, password, parent];
}
