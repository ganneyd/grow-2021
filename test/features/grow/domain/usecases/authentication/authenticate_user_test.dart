import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grow_run_v1/core/error/failures.dart';
import 'package:grow_run_v1/features/grow/domain/entities/user/user_entity.dart';
import 'package:grow_run_v1/features/grow/domain/usecases/authentication/authenticate_user.dart';
import 'package:mockito/mockito.dart';

import '../child/register_new_child_user_test.mocks.dart';

void main() {
  const String email1 = 'ganneyd@gmail.com';
  const String acceptablePassword = '1234456';
  const UserEntity expectedUserEntity =
      UserEntity(userEmail: 'expected@email.com', userID: 'expected-id');
  final MockAuthenticationRepository mockAuthenticationRepository =
      MockAuthenticationRepository();
  final AuthenticateUser usecase =
      AuthenticateUser(authenticationRepository: mockAuthenticationRepository);
  group('Tests that should pass', () {
    test(
      'should return a UserEntity containing the currently authenticated user',
      () async {
        // arrange
        when(mockAuthenticationRepository.authenticateUser(any, any))
            .thenAnswer((_) async =>
                const Right<Failure, UserEntity>(expectedUserEntity));

        // act
        final Either<Failure, UserEntity> result = await usecase
            .call(const Params(email: email1, password: acceptablePassword));
        // assert
        verify(mockAuthenticationRepository.authenticateUser(
                email1, acceptablePassword))
            .called(1);

        final UserEntity resultUserEntity = result.getOrElse(
            () => const UserEntity(userID: 'userID', userEmail: 'userEmail'));

        expect(resultUserEntity, expectedUserEntity);
      },
    );
  });

  group('Tests that should return a failure, ', () {
    test('should return a AuthenticationFailure when an error occurs',
        () async {
      // arrange
      when(mockAuthenticationRepository.authenticateUser(any, any)).thenAnswer(
          (_) async => Left<Failure, UserEntity>(AuthenticationFailure()));

      // act
      final Either<Failure, UserEntity> result = await usecase
          .call(const Params(email: email1, password: acceptablePassword));
      // assert
      verify(mockAuthenticationRepository.authenticateUser(
              email1, acceptablePassword))
          .called(1);

      final Failure resultUserEntity =
          result.swap().getOrElse(() => SignUpFailure());

      expect(resultUserEntity, AuthenticationFailure());
    });
  });
}
