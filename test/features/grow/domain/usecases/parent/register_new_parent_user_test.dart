import 'package:dartz/dartz.dart';
import 'package:grow_run_v1/core/error/failures.dart';
import 'package:grow_run_v1/core/util/gender.dart';
import 'package:grow_run_v1/features/grow/data/models/models_bucket.dart';
import 'package:grow_run_v1/features/grow/domain/entities/entities_bucket.dart';
import 'package:grow_run_v1/features/grow/domain/usecases/parent/register_new_parent_user.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'sign_up_new_parent_test.mocks.dart';

void main() {
  const String email1 = 'ganneyd@gmail.com';
  const String acceptablePassword = '123456';

  final ParentModel parent = ParentModel(
      firstname: 'Phillip',
      lastname: 'Dortch',
      childrenIDs: <String>['child01, child00'],
      phonenumber: '407-576-7199',
      dateOfBirth: DateTime.utc(1969, 9, 3),
      gender: Gender.male);
  final UserEntity user = UserEntity(
      userID: 'userID',
      userEmail: 'exampleEmail@gmail.com',
      name: '${parent.firstname} ${parent.lastname}',
      userType: UserType.child);
  final ParentEntity expectedParentEntity = ParentEntity(
      uid: user.userID,
      firstname: parent.firstname,
      lastname: parent.lastname,
      childrenIDs: parent.childrenIDs,
      phonenumber: parent.phonenumber,
      dateOfBirth: parent.dateOfBirth,
      gender: parent.gender);

  final MockParentRepository mockParentRepository = MockParentRepository();
  final MockAuthenticationRepository mockAuthenticationRepository =
      MockAuthenticationRepository();
  final RegisterNewParentUser usecase = RegisterNewParentUser(
      authenticationRepository: mockAuthenticationRepository,
      parentRepository: mockParentRepository);

  group('Tests that should return successfully', () {
    test(
      'should return a userEntity instance after authenticating the user '
      'and populating the database with the data',
      () async {
        // arrange
        when(mockAuthenticationRepository.registerUser(any, any))
            .thenAnswer((_) async => Right<Failure, UserEntity>(user));
        when(mockParentRepository.createParentData(any))
            .thenAnswer((_) async => Right<Failure, void>(() {}));
        // act
        final Either<Failure, UserEntity> result =
            await usecase.call(Params(email: user.userEmail, parent: parent));
        // assert
        verify(mockAuthenticationRepository.registerUser(
                user.userEmail, 'parent12'))
            .called(1);
        verify(mockParentRepository.createParentData(any)).called(1);
        final UserEntity actualEntity = result.getOrElse(() => const UserEntity(
            userID: '', userEmail: '', name: '', userType: UserType.child));
        expect(actualEntity, user);
      },
    );
  });

  group('Tests that should return a Failure', () {
    test(
      'should return a SignUpFailure when a failure is returned from the auth'
      ' repo, no calls should be made to the parent repo as well',
      () async {
        // arrange
        when(mockAuthenticationRepository.registerUser(any, any)).thenAnswer(
            (_) async => Left<Failure, UserEntity>(AuthenticationFailure()));
        when(mockParentRepository.createParentData(any))
            .thenAnswer((_) async => Right<Failure, void>(() {}));
        // act
        final Either<Failure, UserEntity> result =
            await usecase.call(Params(email: user.userEmail, parent: parent));
        // assert
        verify(mockAuthenticationRepository.registerUser(
                user.userEmail, 'parent12'))
            .called(1);
        verifyNever(mockParentRepository.createParentData(any));
        final Failure actualFailure =
            result.swap().getOrElse(() => FetchDataFailure());
        expect(actualFailure, RegistrationFailure());
      },
    );

    test(
      'should return a SignUpFailure when a failure is returned from the auth'
      ' repo, no calls should be made to the parent repo as well',
      () async {
        // arrange
        when(mockAuthenticationRepository.registerUser(any, any))
            .thenAnswer((_) async => Right<Failure, UserEntity>(user));
        when(mockParentRepository.createParentData(any))
            .thenAnswer((_) async => Left<Failure, void>(CreateDataFailure()));
        // act
        final Either<Failure, UserEntity> result =
            await usecase.call(Params(email: user.userEmail, parent: parent));
        // assert
        verify(mockAuthenticationRepository.registerUser(
                user.userEmail, 'parent12'))
            .called(1);
        verify(mockParentRepository.createParentData(any)).called(1);
        final Failure actualFailure =
            result.swap().getOrElse(() => FetchDataFailure());
        expect(actualFailure, RegistrationFailure());
      },
    );
  });
}
