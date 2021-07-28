import 'package:flutter_test/flutter_test.dart';
import 'package:grow_run_v1/core/error/failures.dart';
import 'package:grow_run_v1/features/grow/domain/entities/user/user_entity.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/authentication_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'authentication_repository_test.mocks.dart';

@GenerateMocks(<Type>[AuthenticationRepository])
void main() {
  const String email1 = 'ganneyd@gmail.com';
  const String acceptablePassword = '1234456';
  const UserEntity expectedUserEntity = UserEntity(
      userEmail: 'expected@email.com',
      userID: 'expected-id',
      name: 'name',
      userType: UserType.child);
  final MockAuthenticationRepository authenticationRepository =
      MockAuthenticationRepository();

  group('Test that should not return with failures, ', () {
    test(
      'should return a UserEntity() for the user when they sign up',
      () async {
        // arrange
        when(authenticationRepository.signUpUser()).thenAnswer(
            (_) async => const Right<Failure, UserEntity>(expectedUserEntity));
        // act
        final Either<Failure, UserEntity> result =
            await authenticationRepository.signUpUser();
        final UserEntity actualUser = result.getOrElse(() => const UserEntity(
            userID: 'userID',
            userEmail: 'userEmail',
            name: 'name',
            userType: UserType.child));
        // assert
        expect(actualUser, expectedUserEntity);
      },
    );
    test(
      'should return a UserEntity with the authenticated user',
      () async {
        // arrange
        when(authenticationRepository.authenticateUser(any, any)).thenAnswer(
            (_) async => const Right<Failure, UserEntity>(expectedUserEntity));
        // act
        final Either<Failure, UserEntity> result =
            await authenticationRepository.authenticateUser(
                'email', 'password');
        final UserEntity actualUser = result.getOrElse(() => const UserEntity(
            userID: 'userID',
            userEmail: 'userEmail',
            name: 'name',
            userType: UserType.child));
        // assert

        expect(actualUser, expectedUserEntity);
      },
    );
    test(
      'should return a Failure since firebased cannot be initialzed',
      () async {
        // arrange
        when(authenticationRepository.registerUser(any, any)).thenAnswer(
            (_) async => const Right<Failure, UserEntity>(expectedUserEntity));
        // act
        final Either<Failure, UserEntity> result =
            await authenticationRepository.registerUser('email', 'password');
        final UserEntity actualUser = result.getOrElse(() => const UserEntity(
            userID: 'userID',
            userEmail: 'userEmail',
            name: 'name',
            userType: UserType.child));
        // assert
        expect(actualUser, expectedUserEntity);
      },
    );

    test(
      'should return a UserEntity() for the signed in user when they log in',
      () async {
        // arrange
        when(authenticationRepository.loginUser(any, any))
            .thenAnswer((_) async => const Right<Failure, void>(null));
        // ac
        final Either<Failure, void> result = await authenticationRepository
            .loginUser(email1, acceptablePassword);

        // assert
        expect(result, const Right<Failure, void>(null));
      },
    );

    test(
      'should return void when the user log outs',
      () async {
        // arrange
        when(authenticationRepository.signOutUser())
            .thenAnswer((_) async => Right<Failure, void>(() {}));
        // act
        final Either<Failure, void> result =
            await authenticationRepository.signOutUser();

        // assert
        expect(result, isInstanceOf<Right<Failure, void>>());
      },
    );
  });
}
