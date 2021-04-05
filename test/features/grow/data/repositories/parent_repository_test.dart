import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grow_run_v1/core/error/failures.dart';
import 'package:grow_run_v1/core/util/gender.dart';
import 'package:grow_run_v1/features/grow/data/datasources/datasources.dart';
import 'package:grow_run_v1/features/grow/data/models/parent/parent_model.dart';
import 'package:grow_run_v1/features/grow/data/repositories/parent_repository.dart';
import 'package:grow_run_v1/features/grow/domain/entities/parent/parent_entity.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/parent_repository.dart';
import 'package:mockito/mockito.dart';

//mocking the database
class MockRemoteDataSource extends Mock implements RemoteDataSource {}

void main() {
  final MockFirestoreInstance firestoreInstance = MockFirestoreInstance();
  final RemoteDataSource remoteDataSource =
      RemoteDataSourceImplementation(firestoreInstance);
  final ParentRepository repository =
      ParentRepositoryImplementation(remoteDataSource);

  final MockRemoteDataSource mockRemoteDataSource = MockRemoteDataSource();
  final ParentRepository mockRepository =
      ParentRepositoryImplementation(mockRemoteDataSource);

  const String collectionName = 'parents';
  final ParentModel parent0 = ParentModel(
    uid: 'parent0',
    firstname: 'Suzette',
    lastname: 'Rhaburn',
    childrenIDs: <String>[],
    phonenumber: '4075767199',
    dateOfBirth: DateTime(1986, 09, 09),
    gender: Gender.female,
  );
  final ParentModel parent1 = ParentModel(
    uid: 'parent01',
    firstname: 'Gary',
    lastname: 'Burns',
    childrenIDs: <String>[],
    phonenumber: '4070009489',
    dateOfBirth: DateTime(1976, 11, 19),
    gender: Gender.male,
  );
  final ParentModel parent2 = ParentModel(
    uid: 'parent02',
    firstname: 'Dawn',
    lastname: 'Wade',
    childrenIDs: <String>[],
    phonenumber: '4179060076',
    dateOfBirth: DateTime(1966, 5, 21),
    gender: Gender.female,
  );

//this is a list of all the parent models
  final List<ParentModel> allParentModels = <ParentModel>[
    parent0,
    parent1,
    parent2
  ];
  //function to popluate the database with all the parent models in
  //a list
  void populateDatabseWithParentModels(List<ParentModel> parentModels) {
    for (final ParentModel parentModel in parentModels) {
      firestoreInstance
          .collection(collectionName)
          .doc(parentModel.uid)
          .set(parentModel.toJson());
    }
  }

  group('Test that should return successfully', () {
    test(
      'should return void when createParentData() is called',
      () async {
        // arrange
        // act
        final Either<Failure, void> result =
            await repository.createParentData(parent0);

        // assert
        expect(result, isInstanceOf<Right<Failure, void>>());
      },
    );
  });

  test(
    'should return void when editParentUser() is called',
    () async {
      // arrange
      populateDatabseWithParentModels(allParentModels);
      // act
      final Either<Failure, void> result = await repository
          .createParentData(parent0.copyWith(lastname: 'changed lastname'));

      // assert
      expect(result, isInstanceOf<Right<Failure, void>>());
    },
  );
  test(
    'should return a List<ParentModel> of all parents, when getParents() '
    'is called',
    () async {
      // arrange
      final List<ParentModel> parentModelResult = <ParentModel>[];
      populateDatabseWithParentModels(allParentModels);
      // act
      final Either<Failure, List<ParentEntity>> result =
          await repository.getParents('requestedBy');
      result.fold((l) {}, (List<ParentEntity> list) {
        for (final ParentModel parentEntity in list.cast()) {
          parentModelResult.add(parentEntity);
        }
      });
      // assert
      expect(parentModelResult, allParentModels);
    },
  );

  test(
    "should return a List<ParentModel> of all the parents who's id matches"
    ' those passed to getParentById()',
    () async {
      // arrange
      final List<ParentModel> expectedResult = <ParentModel>[parent0, parent2];
      final List<ParentModel> resultList = <ParentModel>[];
      populateDatabseWithParentModels(allParentModels);
      // act
      final Either<Failure, List<ParentEntity>> result = await repository
          .getParentByID(<String>[parent0.uid, parent2.uid], 'requestedBy');
      result.fold((Failure l) => null, (List<ParentEntity> list) {
        for (final ParentModel parentModel in list.cast()) {
          resultList.add(parentModel);
        }
      });
      // assert'
      expect(resultList, expectedResult);
    },
  );

  group(
      'These tests should return a Failure when any exception is thrown '
      'by the remoteDataSource', () {
    test(
      'should return a CreateDataFailure() when an exception is thrown '
      'when createParentData() is called',
      () async {
        // arrange
        // act
        final Either<Failure, void> result =
            await mockRepository.createParentData(parent0);
        // assert
        expect(result, Left<Failure, void>(CreateDataFailure()));
      },
    );
    test(
      'should return UpdateDataFailure() when an exception is thrown',
      () async {
        // arrange

        // act
        final Either<Failure, void> result =
            await mockRepository.editParentUser(parent0);
        // assert
        expect(result, Left<Failure, void>(UpdateDataFailure()));
      },
    );
  });

  test(
    'should return FetchDataFailure() when an exception is thrown '
    'when getParents() is called',
    () async {
      // arrange

      // act
      final Either<Failure, List<ParentEntity>> result =
          await mockRepository.getParents('requestedBy');
      // assert
      expect(result, Left<Failure, List<ParentModel>>(FetchDataFailure()));
    },
  );

  test(
    'should return FetchDataFailure() when an exception is thrown '
    'when getParentByID() is called',
    () async {
      // arrange

      // act
      final Either<Failure, List<ParentEntity>> result =
          await mockRepository.getParentByID(<String>[], 'requestedBy');
      // assert
      expect(result, Left<Failure, List<ParentModel>>(FetchDataFailure()));
    },
  );
}
