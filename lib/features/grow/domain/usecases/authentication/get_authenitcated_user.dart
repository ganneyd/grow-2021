import 'package:dartz/dartz.dart';
import 'package:grow_run_v1/core/error/failures.dart';
import 'package:grow_run_v1/core/usecases/usecases.dart';
import 'package:grow_run_v1/features/grow/domain/entities/entities_bucket.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/authentication_repository.dart';

///Usecase that returns an UserEntity instance for the currently signed in user

class GetAuthenticatedUser implements UseCase<UserEntity, NoParams> {
  ///
  GetAuthenticatedUser(
      {required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository;
  final AuthenticationRepository _authenticationRepository;
  @override
  Future<Either<Failure, UserEntity>> call(_) async {
    final Either<Failure, UserEntity> userCredential =
        await _authenticationRepository.getCredentials();
    return userCredential.fold(
        (_) => Left<Failure, UserEntity>(AuthenticationFailure()),
        (UserEntity user) => Right<Failure, UserEntity>(user));
  }
}
