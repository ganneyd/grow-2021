import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grow_run_v1/features/grow/domain/entities/entities_bucket.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecases.dart';
import '../../repositories/authentication_repository.dart';

///when a user is trying to enable a parent's account
///they just need the parent id
/// this usecase returns the [UserCredential] of the enabled Parent account
class EnableParentAccount implements UseCase<UserEntity, Params> {
  ///Takes an instance of [AuthenticationRepository]
  EnableParentAccount(AuthenticationRepository authenticationRepository)
      : _authenticationRepository = authenticationRepository;

  final AuthenticationRepository _authenticationRepository;

  @override
  Future<Either<Failure, UserEntity>> call(Params params) async {
    return _authenticationRepository.enableUserAccount(params.parentID);
  }
}

///Parameters needed by the usecase
class Params extends Equatable {
  ///Parameteres, takes the id of the parent
  const Params({required this.parentID});

  ///Id of the parent whose account is to be enabled
  final String parentID;

  @override
  List<Object> get props => <Object>[parentID];
}
