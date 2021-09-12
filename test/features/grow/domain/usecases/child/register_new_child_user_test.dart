import 'package:dartz/dartz.dart';
import 'package:grow_run_v1/core/error/failures.dart';
import 'package:grow_run_v1/core/util/gender.dart';
import 'package:grow_run_v1/features/grow/data/models/child/child_model.dart';
import 'package:grow_run_v1/features/grow/domain/entities/user/user_entity.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/authentication_repository.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/child_repository.dart';
import 'package:grow_run_v1/features/grow/domain/usecases/child/register_new_child_user.dart';
import 'package:grow_run_v1/features/grow/domain/usecases/child/sign_up_new_child_user.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'register_new_child_user_test.mocks.dart';

@GenerateMocks(<Type>[AuthenticationRepository, ChildRepository])
void main() {
  const String email1 = 'ganneyd@gmail.com';

  final Child childModel = Child(
      username: 'ganneyd15',
      firstname: 'Ganney',
      lastname: 'Dortch',
      gender: Gender.male,
      dateOfBirth: DateTime(1999, 8, 8),
      gradeLevel: 12,
      schoolID: 'school01');

  final UserEntity expectedUserEntity = UserEntity(
      userEmail: email1,
      userID: 'child_01',
      name: childModel.username,
      userType: UserType.child);

  final MockChildRepository mockChildRepository = MockChildRepository();

  final MockAuthenticationRepository mockAuthenticationRepository =
      MockAuthenticationRepository();

  final SignUpNewChildUser usecase =
      SignUpNewChildUser(mockAuthenticationRepository);

  group('Tests that should run without errors', () {
    test(
      'should return a UserEntity insatance when call() is evoked',
      () async {
        // arrange
        when(mockAuthenticationRepository.getCredentials()).thenAnswer(
            (_) async => Right<Failure, UserEntity>(expectedUserEntity));
        when(mockAuthenticationRepository.registerUser(any, any)).thenAnswer(
            (_) async => Right<Failure, UserEntity>(expectedUserEntity));
        when(mockChildRepository.createChildData(any, any))
            .thenAnswer((_) async => Right<Failure, void>(() {}));
        // act
        final Either<Failure, String> result =
            await usecase.call(Params(child: childModel, email: email1, parentEmail:));
        // assert
        verify(mockAuthenticationRepository.registerUser(email1, 'password12'))
            .called(1);
        verify(mockChildRepository.createChildData(any)).called(1);

        final UserEntity resultUserEntity = result.getOrElse(() =>
            const UserEntity(
                userID: 'userID',
                userEmail: 'userEmail',
                name: 'name',
                userType: UserType.child));

        expect(resultUserEntity, expectedUserEntity);
      },
    );
  });
  group('Tests that should run with Failures being returned', () {
    test(
      'should return a RegistrationFailure when a AuthenticationFailure is'
      ' returned from the AuthenticationRepository',
      () async {
        // arrange
        when(mockAuthenticationRepository.getAuthenticatedUser()).thenAnswer(
            (_) async => Right<Failure, UserEntity>(expectedUserEntity));
        when(mockAuthenticationRepository.registerUser(any, any)).thenAnswer(
            (_) async => Left<Failure, UserEntity>(AuthenticationFailure()));
        // act
        final Either<Failure, UserEntity> result =
            await usecase.call(Params(child: childModel, email: email1));
        final Failure resultFailure =
            result.swap().getOrElse(() => FetchDataFailure());
        // assert
        verify(mockAuthenticationRepository.registerUser(email1, 'password12'))
            .called(1);
        verifyNever(mockChildRepository.createChildData(any));

        expect(resultFailure, isInstanceOf<AuthenticationFailure>());
      },
    );
    test(
      'should return a RegistrationFailure when a CreateDataFailure is '
      ' returned from the ChildRepository',
      () async {
        // arrange
        when(mockAuthenticationRepository.getAuthenticatedUser()).thenAnswer(
            (_) async => Right<Failure, UserEntity>(expectedUserEntity));
        when(mockAuthenticationRepository.registerUser(any, any)).thenAnswer(
            (_) async => Right<Failure, UserEntity>(expectedUserEntity));
        when(mockChildRepository.createChildData(any))
            .thenAnswer((_) async => Left<Failure, void>(CreateDataFailure()));
        // act
        final Either<Failure, UserEntity> result =
            await usecase.call(Params(child: childModel, email: email1));
        final Failure resultFailure =
            result.swap().getOrElse(() => FetchDataFailure());
        // assert
        verify(mockAuthenticationRepository.registerUser(email1, 'password12'))
            .called(1);
        verify(mockChildRepository.createChildData(any)).called(1);

        expect(resultFailure, isInstanceOf<CreateDataFailure>());
      },
    );
  });
}
