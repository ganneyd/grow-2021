import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:grow_run_v1/core/error/failures.dart';
import 'package:grow_run_v1/core/usecases/usecases.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/authentication_repository.dart';

///If the user wants to reset their  password
class ResetPassword implements UseCase<void, Params> {
  ///Provide an instance of [AuthenticationRepository]
  ResetPassword({required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository;

  final AuthenticationRepository _authenticationRepository;

  @override
  Future<Either<Failure, void>> call(Params params) {
    return _authenticationRepository.resetPassword(email: params.email);
  }
}

///Provide the [email] of the user so a password reset link can be sent to them
class Params extends Equatable {
  ///Takes in the [email] of the user the reset password link should be sent to
  const Params({required this.email});

  ///The email belonging to the user's acc
  final String email;

  @override
  List<Object?> get props => <Object>[email];
}
