import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grow_run_v1/core/error/failures.dart';
import 'package:grow_run_v1/core/util/gender.dart';
import 'package:grow_run_v1/features/grow/data/datasources/remote/firebase/grow_remote_datasoure.dart';
import 'package:grow_run_v1/features/grow/data/models/child/child_model.dart';
import 'package:grow_run_v1/features/grow/data/repositories/child_repository.dart';
import 'package:grow_run_v1/features/grow/domain/entities/user/user_entity.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/authentication_repository.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/child_repository.dart';
import 'package:grow_run_v1/features/grow/domain/usecases/child/sign_up_new_child_user.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import '../../../../../../test/firebase/mock.dart';

import '../child/sign_up_new_child_user_test.mocks.dart';

@GenerateMocks(<Type>[AuthenticationRepository, ChildRepository])
void main() {
  setupFirebaseAuthMocks();
  setUpAll(() async {
    await Firebase.initializeApp(
      name: 'testj',
      options: const FirebaseOptions(
        apiKey: '',
        appId: '',
        messagingSenderId: '',
        projectId: '',
      ),
    );
  });
  const String email1 = 'ganneyd@gmail.com';
  const String acceptablePassword = '123456';
  const String parentEmail = 'parent@email.com';
  const String parentPassword = 'parent-password';
  final MockUser user = MockUser(
    uid: 'userid',
    email: email1,
    displayName: 'Bob',
  );

  final Child childModel = Child(
      username: 'ganneyd15',
      firstname: 'Ganney',
      lastname: 'Dortch',
      gender: Gender.male,
      dateOfBirth: DateTime(1999, 8, 8),
      gradeLevel: 12,
      parentID: 'parent01',
      schoolID: 'school01');
  final UserEntity expectedUserEntity = UserEntity(
      userEmail: email1,
      userID: user.uid,
      name: childModel.username,
      userType: UserType.child);
  final MockChildRepository mockChildRepository = MockChildRepository();

  final MockFirestoreInstance firestoreInstance = MockFirestoreInstance();

  final RemoteDataSource remoteDataSource =
      RemoteDataSourceImplementation(firestoreInstance);

  final ChildRepository repository =
      ChildRepositoryImplementation(remoteDataSource);

  final MockAuthenticationRepository mockAuthenticationRepository =
      MockAuthenticationRepository();

  final SignUpNewChildUser usecase =
      SignUpNewChildUser(mockAuthenticationRepository);

  final SignUpNewChildUser usecaseWithMocks = SignUpNewChildUser(
    mockAuthenticationRepository,
  );

  group('Tests that should return successfully', () {
    test(
      'should return successfully when the usecase,'
      ' SignUpNewChildUser is called',
      () async {
        // arrange
        when(mockAuthenticationRepository.signUpUser(
                dependencyEmail: any, dependencyPassword: any))
            .thenAnswer(
                (_) async => Right<Failure, UserEntity>(expectedUserEntity));
        // act
        final Either<Failure, String> result = await usecase.call(Params(
            childJSON: childModel.toJson(),
            childEmail: email1,
            childPassword: acceptablePassword,
            parentEmail: parentEmail,
            parentPassword: parentPassword));
        // assert
        verify(mockAuthenticationRepository.signUpUser(
            dependentEmail: email1, dependentPassword: acceptablePassword));
        expect(result, isInstanceOf<Right<Failure, UserEntity>>());
      },
    );
  });
  group('Tests that should result in a Failure() being returned', () {
    test(
      'should return a SignUpFailure() when '
      'the Auth service throws an exception',
      () async {
        // arrange
        when(mockAuthenticationRepository.signUpUser()).thenAnswer(
            (_) async => Left<Failure, UserEntity>(AuthenticationFailure()));

        // act
        final Either<Failure, String> result = await usecaseWithMocks.call(
            Params(
                childJSON: childModel.toJson(),
                childEmail: email1,
                childPassword: acceptablePassword,
                parentEmail: parentEmail,
                parentPassword: parentPassword));

        verify(mockAuthenticationRepository.signUpUser(
            dependencyEmail: email1,
            dependencyPassword: parentPassword,
            dependencyUserType: UserType.parent,
            dependentData: childModel.toJson(),
            dependentEmail: email1,
            dependentPassword: acceptablePassword,
            dependentUserType: UserType.child));
        final Failure resultFailure =
            result.swap().getOrElse(() => FetchDataFailure());
        // assert
        expect(resultFailure, isInstanceOf<SignUpFailure>());
      },
    );

    test(
      'should return a SignUpFailure() when the childRepository  returns a '
      'failure',
      () async {
        // arrange
        when(mockAuthenticationRepository.authenticateUser(any, any))
            .thenAnswer(
                (_) async => Right<Failure, UserEntity>(expectedUserEntity));
        when(mockAuthenticationRepository.signUpUser()).thenAnswer(
            (_) async => Right<Failure, UserEntity>(expectedUserEntity));
        when(mockChildRepository.createChildData(any))
            .thenAnswer((_) async => Left<Failure, void>(CreateDataFailure()));
        // act
        final Either<Failure, String> result = await usecaseWithMocks.call(
            Params(
                childJSON: childModel.toJson(),
                childEmail: email1,
                parentEmail: parentEmail,
                parentPassword: parentPassword,
                childPassword: acceptablePassword));
        final Failure resultFailure =
            result.swap().getOrElse(() => FetchDataFailure());

        //verify that the mockAuth was called with the expected params
        // it only should be called once

        verify(mockAuthenticationRepository.signUpUser(
            dependencyEmail: email1,
            dependencyPassword: parentPassword,
            dependencyUserType: UserType.parent,
            dependentData: childModel.toJson(),
            dependentEmail: email1,
            dependentPassword: acceptablePassword,
            dependentUserType: UserType.child));

        // assert
        expect(resultFailure, isInstanceOf<SignUpFailure>());
      },
    );
  });
}
