import 'package:flutter_test/flutter_test.dart';
import 'package:grow_run_v1/core/error/failures.dart';
import 'package:grow_run_v1/features/grow/data/repositories/authentication_repository.dart';
import 'package:grow_run_v1/features/grow/domain/entities/user/user_entity.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/authentication_repository.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:dartz/dartz.dart';

void main() {
  const String email1 = 'ganneyd@gmail.com';
  const String acceptablePassword = '123456';
  final MockUser user = MockUser(
    uid: 'userid',
    email: email1,
    displayName: 'Bob',
  );
  final MockFirebaseAuth mockFirebaseAuth = MockFirebaseAuth(mockUser: user);
  final AuthenticationRepository authenticationRepository =
      AuthenticationRepositoryImplementation(mockFirebaseAuth);

  group('Test that should not return with failures', () {
    test(
      'should return a UserEntity() for the user when they sign up',
      () async {
        // arrange

        // act
        final Either<Failure, UserEntity> result =
            await authenticationRepository.signUpUser('email', 'password');
        // assert
        expect(result, isInstanceOf<Right<Failure, UserEntity>>());
      },
    );

    test(
      'should return a Failure since firebased cannot be initialzed',
      () async {
        // arrange

        // act
        final Either<Failure, UserEntity> result =
            await authenticationRepository.registerUser('email', 'password');
        // assert
        expect(result, Left<Failure, UserEntity>(AuthenticationFailure()));
      },
    );

    test(
      'should return a UserEntity() for the signed in user when they log in',
      () async {
        // arrange

        // ac
        final Either<Failure, UserEntity> result =
            await authenticationRepository.loginUser(
                email1, acceptablePassword);
        // assert
        expect(result, isInstanceOf<Right<Failure, UserEntity>>());
      },
    );

    test(
      'should return void when the user log outs',
      () async {
        // arrange

        // act
        final Either<Failure, void> result =
            await authenticationRepository.signOutUser();

        // assert
        expect(result, isInstanceOf<Right<Failure, void>>());
      },
    );
  });
}
