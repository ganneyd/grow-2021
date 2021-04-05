import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:grow_run_v1/features/grow/domain/entities/entities_bucket.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/authentication_repository.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecases.dart';

///When a  user is trying to sign out of  thier account
class SignOutUser implements UseCase<void, Params> {
  ///Takes an instance of [AuthenticationRepository]
  SignOutUser(AuthenticationRepository authRepository)
      : _authRepository = authRepository;

  final AuthenticationRepository _authRepository;

  @override
  Future<Either<Failure, void>> call(Params params) async {
    return _authRepository.signOutUser();
  }
}

///Parameters required by the UseCase
///in the case their is no parameters needed by the usecase to log the user out
class Params extends Equatable {
  @override
  List<Object> get props => <Object>[];
}
