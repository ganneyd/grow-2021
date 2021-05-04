import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:grow_run_v1/features/grow/domain/entities/entities_bucket.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/authentication_repository.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecases.dart';

///When a  user is trying to log into thier account
class LoginUser implements UseCase<void, Params> {
  ///Takes an instance of [AuthenticationRepository]
  LoginUser(AuthenticationRepository authRepository)
      : _authRepository = authRepository;

  final AuthenticationRepository _authRepository;

  @override
  Future<Either<Failure, void>> call(Params params) async {
    return await _authRepository.loginUser(params.email, params.password);
  }
}

///Parameters required by the UseCase
class Params extends Equatable {
  ///Takes the [email] and [password] of the user trying to sign in
  const Params({required this.email, required this.password});

  ///The email of the user trying to signIn
  final String email;

  ///The password of the user trying to sign in
  final String password;

  @override
  List<Object> get props => <Object>[email, password];
}
