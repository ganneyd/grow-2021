import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grow_run_v1/core/error/failures.dart';
import 'package:grow_run_v1/core/usecases/usecases.dart';
import 'package:grow_run_v1/features/grow/domain/entities/user/user_entity.dart';
import 'package:grow_run_v1/features/grow/domain/usecases/authentication/get_authenitcated_user.dart';
import 'package:mockito/mockito.dart';

import '../child/register_new_child_user_test.mocks.dart';

void main() {
  const String email1 = 'ganneyd@gmail.com';
  const String acceptablePassword = '1234456';
  const UserEntity expectedUserEntity = UserEntity(
      userEmail: 'expected@email.com',
      userID: 'expected-id',
      name: 'expected-name');
  final MockAuthenticationRepository mockAuthenticationRepository =
      MockAuthenticationRepository();
  final GetAuthenticatedUser usecase = GetAuthenticatedUser(
      authenticationRepository: mockAuthenticationRepository);
  group('Tests that should pass', () {
    test(
      'should return a UserEntity containing the currently authenticated user',
      () async {
        // arrange
        when(mockAuthenticationRepository.getAuthenticatedUser()).thenAnswer(
            (_) async => const Right<Failure, UserEntity>(expectedUserEntity));

        // act
        final Either<Failure, UserEntity> result =
            await usecase.call(NoParams());
        // assert
        verify(mockAuthenticationRepository.getAuthenticatedUser()).called(1);

        final UserEntity resultUserEntity = result.getOrElse(() =>
            const UserEntity(
                userID: 'userID', userEmail: 'userEmail', name: 'name'));

        expect(resultUserEntity, expectedUserEntity);
      },
    );
  });

  group('Tests that should return a failure, ', () {
    test('should return a AuthenticationFailure when an error occurs',
        () async {
      // arrange
      when(mockAuthenticationRepository.getAuthenticatedUser()).thenAnswer(
          (_) async => Left<Failure, UserEntity>(AuthenticationFailure()));

      // act
      final Either<Failure, UserEntity> result = await usecase.call(NoParams());
      // assert
      verify(mockAuthenticationRepository.getAuthenticatedUser()).called(1);

      final Failure resultUserEntity =
          result.swap().getOrElse(() => SignUpFailure());

      expect(resultUserEntity, AuthenticationFailure());
    });
  });
}
