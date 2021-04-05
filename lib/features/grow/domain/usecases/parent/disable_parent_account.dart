import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/authentication_repository.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecases.dart';

///when a user is trying to disable a parent's account
///they just need the parent id
/// this usecase returns void
class DisableParentAccount implements UseCase<void, Params> {
  ///Takes an instance of [AuthenticationRepository]
  DisableParentAccount(AuthenticationRepository authenticationRepository)
      : _authenticationRepository = authenticationRepository;

  final AuthenticationRepository _authenticationRepository;

  @override
  Future<Either<Failure, void>> call(Params params) async {
    return _authenticationRepository.disableUserAccount(params.parentID);
  }
}

///Parameters needed by the usecase
class Params extends Equatable {
  ///Parameteres, takes the id of the parent
  const Params({required this.parentID});

  ///Id of the parent whose account is to be disabled
  final String parentID;

  @override
  List<Object> get props => <Object>[parentID];
}
