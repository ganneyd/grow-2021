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
class RegisterNewParentUser implements UseCase<UserEntity, Params> {
  ///Constructor
  RegisterNewParentUser(
      {required AuthenticationRepository authenticationRepository,
      required ParentRepository parentRepository})
      : _authenticationRepository = authenticationRepository,
        _parentRepository = parentRepository;

  final AuthenticationRepository _authenticationRepository;
  final ParentRepository _parentRepository;
  @override
  Future<Either<Failure, UserEntity>> call(Params params) async {
    //attemp to authenticate the user and store it in a variable
    final Either<Failure, UserEntity> userCredential =
        await _authenticationRepository.registerUser(
            params.email, Params.defaultPassword);
    if (userCredential.isRight()) {
      final UserEntity user = userCredential.getOrElse(() => const UserEntity(
          userEmail: '', userID: '', name: '', userType: UserType.parent));
      final ParentEntity parentWithID =
          toParentEntityWithID(params.parent, user.userID);
      final Either<Failure, void> createData =
          await _parentRepository.createParentData(parentWithID);
      if (createData.isRight()) {
        return Right<Failure, UserEntity>(user);
      }
    }
    //if an error occured and was not foreseen then return this
    return Left<Failure, UserEntity>(RegistrationFailure());
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
