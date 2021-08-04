import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/authentication_repository.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecases.dart';

///when a user is trying to disable a child's account
///they just need the child id
/// this usecase returns void
class DisableChildAccount implements UseCase<void, Params> {
  ///Takes a  [AuthenticationRepository] instance
  DisableChildAccount(AuthenticationRepository authenticationRepository)
      : _authenticationRepository = authenticationRepository;

  final AuthenticationRepository _authenticationRepository;

  @override
  Future<Either<Failure, void>> call(Params params) async {
    return _authenticationRepository.disableUserAccount(params.childID);
  }
}

///Parameters required by the [DisableChildAccount] UseCase
class Params extends Equatable {
  ///Params needed to disable a child's account, only takes the [childID] as a
  ///param
  const Params({required this.childID});

  ///Child's id
  final String childID;

  @override
  List<Object> get props => <Object>[childID];
}
