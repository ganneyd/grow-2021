import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:grow_run_v1/core/error/failures.dart';
import 'package:grow_run_v1/features/grow/data/datasources/datasources.dart';
import 'package:grow_run_v1/features/grow/data/models/child/child_model.dart';
import 'package:grow_run_v1/features/grow/data/repositories/child_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:grow_run_v1/features/grow/domain/entities/child/child_entity.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/child_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grow_run_v1/core/util/util.dart';

//mocking the database
class MockRemoteDataSource extends Mock implements RemoteDataSource {}

//mock authentication repo
//class MockChildRepo extends Mock implements ChildRepository {}

void main() {
  final MockFirestoreInstance firestoreInstance = MockFirestoreInstance();
  final RemoteDataSource remoteDataSource =
      RemoteDataSourceImplementation(firestoreInstance);
  final MockRemoteDataSource mockRemotedataSource = MockRemoteDataSource();
  final ChildRepository repository =
      ChildRepositoryImplementation(remoteDataSource);
  final ChildRepository repositoryWithMockDS =
      ChildRepositoryImplementation(mockRemotedataSource);

  ///Children collection
  const String collectionName = 'children';
  final Child child0 = Child(
      username: 'ganneyd15',
      firstname: 'Ganney',
      lastname: 'Dortch',
      gender: Gender.male,
      dateOfBirth: DateTime(1999, 8, 8),
      gradeLevel: 12,
      schoolID: 'school01');
  final Child child1 = Child(
      username: 'gannphill',
      firstname: 'Gannphill',
      lastname: 'Ramclam',
      gender: Gender.unknown,
      dateOfBirth: DateTime(2007, 3, 13),
      gradeLevel: 12,
      schoolID: 'school01');
  final Child child2 = Child(
      username: 'baamon501',
      firstname: 'Ganna',
      lastname: 'Rogers',
      gender: Gender.female,
      dateOfBirth: DateTime(1997, 7, 10),
      gradeLevel: 2,
      schoolID: 'school03');

//List of children
  final List<Child> childrenList = <Child>[
    Child.toChild(child0),
    Child.toChild(child1),
    Child.toChild(child2)
  ];

  //Sample querysnapshot of children

//test Varibales
  setUp(() {});
  void populateDatabaseWithAllChildren() {
    firestoreInstance.collection(collectionName).doc().set(child0.toJson());
    firestoreInstance.collection(collectionName).doc().set(child1.toJson());
    firestoreInstance.collection(collectionName).doc().set(child2.toJson());
    print('The data in the firestore mock database is :');
    print(firestoreInstance.dump());
    return;
  }

  group('Tests that should occur successfully, using [repository]', () {
    test(
      'should return void when a child data is being created in the database',
      () async {
        final Either<Failure, void> result =
            await repository.createChildData(child0, 'child_01');
        // assert

        //verify(repository.createChildData(child0.uid!, child0));
        expect(result, isInstanceOf<Right<Failure, void>>());
      },
    );

    test('should return void/null when a child data has been updated ',
        () async {
      // arrange
      firestoreInstance.collection(collectionName).doc().set(child0.toJson());
      print('This is before the update');
      print(firestoreInstance.dump());
      print('---------------------------');
      final Either<Failure, void> result = await repository.editChildUser(
          child0.copyWith(username: 'updated username'), 'child_01');
      // assert
      print('This is after the update');
      print(firestoreInstance.dump());
      expect(result, isInstanceOf<Right<Failure, void>>());
    });

    test('should return a list of child objects when getChildren() is called',
        () async {
      //arrange
      populateDatabaseWithAllChildren();
      final List<Child> actualList = <Child>[];
      //act
      final Either<Failure, List<ChildEntity>> result =
          await repository.getChildren('ganney');

      result.fold((l) => null, (List<ChildEntity> list) {
        for (ChildEntity childEntity in list) {
          actualList.add(Child.toChild(childEntity));
        }
      });
      // assert
      //verify(repository.getChildren('ganney'));

      expect(actualList, childrenList);
    });

    test(
      'should return a list of children that matches the id or ids passed',
      () async {
        // arrange
        populateDatabaseWithAllChildren();
        final List<Child> actualList = <Child>[];
        final List<Child> expectedList = <Child>[child0, child1];
        // act
        final Either<Failure, List<ChildEntity>> result = await repository
            .getChildrenByID(<String>['child_01', 'child_02'], 'requestedBy');
        result.fold((Failure l) => null, (List<ChildEntity> list) {
          for (final ChildEntity childEntity in list) {
            actualList.add(Child.toChild(childEntity));
          }
        });
        // assert

        expect(actualList, expectedList);
      },
    );
    test(
      'should return all the children that go to a particular school',
      () async {
        // arrange
        populateDatabaseWithAllChildren();
        final List<Child> actualList = <Child>[];
        final List<Child> expectedList = <Child>[child0, child1];
        // act
        final Either<Failure, List<ChildEntity>> result =
            await repository.getChildrenBySchool('school01', 'requestedBy');
        result.fold((Failure l) => null, (List<ChildEntity> list) {
          for (final ChildEntity childEntity in list) {
            actualList.add(Child.toChild(childEntity));
          }
        });
        // assert
        expect(actualList, expectedList);
      },
    );
  });

  group('Test that should return Failures, using [repositoryWithMockDS]', () {
    group('Various inputs that can cause createChildData() to return a failure',
        () {
      test(
        'should return a CreateDataFailure(), '
        'when a CreateDataException is thrown.',
        () async {
          // arrange
          // act
          final Either<Failure, void> result =
              await repositoryWithMockDS.createChildData(child0, 'child_01');

          // assert

          expect(result, Left<Failure, void>(CreateDataFailure()));
        },
      );
    });
  });
  group('Various inputs that can cause editChildUser() to return a failure',
      () {
    test(
      'should return an UpdateDataFailure() when any exception is throwns',
      () async {
        // arrange

        // act
        final Either<Failure, void> result =
            await repositoryWithMockDS.editChildUser(child0, 'child_01');
        // assert
        expect(result, Left<Failure, void>(UpdateDataFailure()));
      },
    );
  });
  group('Various inputs that can cause getChildren() to return a failure', () {
    test(
      'should return FetchDataFailure when any exception thrown',
      () async {
        // arrange

        // act
        final Either<Failure, List<ChildEntity>> result =
            await repositoryWithMockDS.getChildren('requestedBy');

        // assert
        expect(result, Left<Failure, List<ChildEntity>>(FetchDataFailure()));
      },
    );
  });
  group('Various inputs that can cause getChildrenByID() to return a failure',
      () {
    test(
      'should return FetchDataFailure when any exception thrown',
      () async {
        // arrange

        // act
        final Either<Failure, List<ChildEntity>> result =
            await repositoryWithMockDS
                .getChildrenByID(<String>['child_01'], 'requestedBy');

        // assert
        expect(result, Left<Failure, List<ChildEntity>>(FetchDataFailure()));
      },
    );
  });
  group(
      'Various inputs that can cause getChildrenBySchool() to return a failure',
      () {
    test(
      'should return FetchDataFailure when any exception thrown',
      () async {
        // arrange

        // act
        final Either<Failure, List<ChildEntity>> result =
            await repositoryWithMockDS.getChildrenBySchool('', 'requestedBy');

        // assert
        expect(result, Left<Failure, List<ChildEntity>>(FetchDataFailure()));
      },
    );
  });
}
