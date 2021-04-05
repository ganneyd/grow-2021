import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grow_run_v1/features/grow/domain/entities/entities_bucket.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/authentication_repository.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/parent_repository.dart';
import 'package:grow_run_v1/features/grow/domain/usecases/mixins.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecases.dart';

///When a new parent is being registered by another user, only admin and dev tho
class RegisterNewParentUser implements UseCase<void, Params> {
  ///Constructor
  RegisterNewParentUser(
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
        await _authenticationRepository.registerUser(
            params.email, Params.defaultPassword);
    userCredential.fold((Failure l) {
      // if an error occured when trying to authenticate the user
      // an failure is returned with the message
      return Left<Failure, dynamic>(RegistrationFailure());
    }, (UserEntity user) {
      //if successful try to poppulate the parent collection with the
      //parent's information

      return _parentRepository
          .createParentData(toParentEntityWithID(params.parent, user.userID));
    });
    //if an error occured and was not foreseen then return this
    return Left<Failure, dynamic>(RegistrationFailure());
  }
}

///Parameters required by the UseCase
class Params extends Equatable {
  ///Takes the [email] and [parent ] entity that are needed to register a parent
  ///account
  const Params({required this.email, required this.parent});

  ///Email of the parent to be registered
  final String email;

  /// default Password of the parent to be registered
  static const String defaultPassword = 'parent12';

  ///The parent's data that will be used to populate the database
  final ParentEntity parent;

  @override
  List<Object> get props => <Object>[email, defaultPassword, parent];
}
