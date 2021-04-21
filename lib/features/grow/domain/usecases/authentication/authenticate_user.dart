import 'package:equatable/equatable.dart';
import 'package:grow_run_v1/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:grow_run_v1/core/usecases/usecases.dart';
import 'package:grow_run_v1/features/grow/domain/entities/user/user_entity.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/authentication_repository.dart';

///when a user is signing up and requires that their acc is somehow linked
///to another. Such as a child signing up and their account is linked to their
///parent's acc;
class AuthenticateUser implements UseCase<UserEntity, Params> {
  ///Pass an instance of the auth repo
  AuthenticateUser({
    required AuthenticationRepository authenticationRepository,
  }) : _authenticationRepository = authenticationRepository;
  final AuthenticationRepository _authenticationRepository;

  @override
  Future<Either<Failure, UserEntity>> call(Params params) async {
    final Either<Failure, UserEntity> userCredential =
        await _authenticationRepository.authenticateUser(
            params.email, params.password);

    return await userCredential.fold(
        (_) => Left<Failure, UserEntity>(AuthenticationFailure()),
        (UserEntity user) => Right<Failure, UserEntity>(user));
  }
}

///params
class Params extends Equatable {
  ///Params
  const Params({required this.email, required this.password});

  ///Email of the child being registered
  final String email;

  ///password of the  being registered by default its [password12]
  final String password;

  @override
  List<Object> get props => <Object>[email, password];
}
