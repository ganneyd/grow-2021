import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grow_run_v1/core/util/util.dart';
import 'package:grow_run_v1/features/grow/domain/entities/user/user_entity.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/authentication_repository.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecases.dart';
import '../../entities/child/child_entity.dart';
import '../../repositories/grow_repository.dart';

///when a user is trying to enable a child's account
///they just need the child id
/// this usecase returns void
class EnableChildAccount implements UseCase<UserEntity, Params> {
  ///Takes a  [AuthenticationRepository] instance
  EnableChildAccount(AuthenticationRepository authenticationRepository)
      : _authenticationRepository = authenticationRepository;

  final AuthenticationRepository _authenticationRepository;

  @override
  Future<Either<Failure, UserEntity>> call(Params params) async {
    return _authenticationRepository.enableUserAccount(params.childID);
  }
}

///Pramaeters required by the [EnableChildAccount] UseCase
class Params extends Equatable {
  ///Params needed to enable a child's account, only takes the [childID] as a
  ///param
  const Params({required this.childID});

  ///Child's id
  final String childID;

  @override
  List<Object> get props => [childID];
}
