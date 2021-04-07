import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grow_run_v1/core/error/failures.dart';
import 'package:grow_run_v1/core/util/gender.dart';
import 'package:grow_run_v1/features/grow/data/datasources/remote/firebase/grow_remote_datasoure.dart';
import 'package:grow_run_v1/features/grow/data/models/child/child_model.dart';
import 'package:grow_run_v1/features/grow/data/repositories/child_repository.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/child_repository.dart';
import 'package:grow_run_v1/features/grow/domain/usecases/child/edit_child.dart';
import 'package:mockito/mockito.dart';
import './sign_up_new_child_user_test.mocks.dart';

void main() {
  final MockFirestoreInstance mockFirestoreInstance = MockFirestoreInstance();
  final RemoteDataSource remoteDataSource =
      RemoteDataSourceImplementation(mockFirestoreInstance);
  final ChildRepository childRepository =
      ChildRepositoryImplementation(remoteDataSource);
  final UpdateChildData usecase = UpdateChildData(childRepository);
  final MockChildRepository mockChildRepository = MockChildRepository();
  final UpdateChildData usecaseWithMock = UpdateChildData(mockChildRepository);
  const String collectionName = 'children';

  final Child child0 = Child(
      uid: 'child00',
      username: 'ganneyd15',
      firstname: 'Ganney',
      lastname: 'Dortch',
      gender: Gender.male,
      dateOfBirth: DateTime(1999, 8, 8),
      gradeLevel: 12,
      parentID: 'parent01',
      schoolID: 'school01');
  final Child child1 = Child(
      uid: 'child01',
      username: 'gannphill',
      firstname: 'Gannphill',
      lastname: 'Ramclam',
      gender: Gender.unknown,
      dateOfBirth: DateTime(2007, 3, 13),
      gradeLevel: 12,
      parentID: 'parent01',
      schoolID: 'school01');
  final Child child2 = Child(
      uid: 'child02',
      username: 'baamon501',
      firstname: 'Ganna',
      lastname: 'Rogers',
      gender: Gender.female,
      dateOfBirth: DateTime(1997, 7, 10),
      gradeLevel: 2,
      parentID: 'parent02',
      schoolID: 'school03');

  final Params typicalParams = Params(child: child0);
  void populateDatabaseWithAllChildren() {
    mockFirestoreInstance
        .collection(collectionName)
        .doc(child0.uid)
        .set(child0.toJson());
    mockFirestoreInstance
        .collection(collectionName)
        .doc(child1.uid)
        .set(child1.toJson());
    mockFirestoreInstance
        .collection(collectionName)
        .doc(child2.uid)
        .set(child2.toJson());
    print('The data in the firestore mock database is :');
    print(mockFirestoreInstance.dump());
    return;
  }

  group('Tests that should return successfully', () {
    test(
      'should return a list of ChildEntities that all matches the childIDs '
      'passed ',
      () async {
        // arrange
        populateDatabaseWithAllChildren();
        // act
        final Either<Failure, void> result = await usecase.call(typicalParams);
        // assert

        expect(result, isInstanceOf<Right<Failure, void>>());
      },
    );
  });

  group('Test that should return Failures', () {
    test(
      'should return a UpdateDataFailure when an exception is thrown in the  '
      'remoteDataSource class',
      () async {
        // arrange
        when(mockChildRepository.editChildUser(any)).thenAnswer(
            (_) async => Left<Failure, List<Child>>(UpdateDataFailure()));
        // act
        final Either<Failure, void> result =
            await usecaseWithMock.call(typicalParams);

        final Failure actualFailure =
            result.swap().getOrElse(() => SignUpFailure());
        // assert
        expect(actualFailure, UpdateDataFailure());
      },
    );
  });
}
