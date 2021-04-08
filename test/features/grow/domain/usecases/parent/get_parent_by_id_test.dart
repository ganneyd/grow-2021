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
import 'package:grow_run_v1/features/grow/domain/usecases/parent/get_parent_by_id.dart';

void main() {
  final MockFirestoreInstance mockFirestoreInstance = MockFirestoreInstance();
  final RemoteDataSource remoteDataSource =
      RemoteDataSourceImplementation(mockFirestoreInstance);
  final ParentRepository repository =
      ParentRepositoryImplementation(remoteDataSource);
  final GetParentUserByID usecase = GetParentUserByID(repository);
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

  void populateDatabseWithParentModels(List<ParentModel> parentModels) {
    for (final ParentModel parentModel in parentModels) {
      mockFirestoreInstance
          .collection(collectionName)
          .doc(parentModel.uid)
          .set(parentModel.toJson());
    }
  }

  group('Tests that should pass', () {
    test(
      'should return a List<ParentModel> of all parents, when getParents() '
      'is called',
      () async {
        // arrange
        final List<ParentModel> parentModelResult = <ParentModel>[];
        populateDatabseWithParentModels(allParentModels);
        // act
        final Either<Failure, List<ParentEntity>> result = await usecase.call(
            Params(
                requestedBy: ' ',
                parentID: <String>[parent0.uid, parent1.uid]));
        result.fold((l) {}, (List<ParentEntity> list) {
          for (final ParentModel parentEntity in list.cast()) {
            parentModelResult.add(parentEntity);
          }
        });
        // assert
        expect(parentModelResult, <ParentModel>[parent0, parent1]);
      },
    );
  });

  group('Tests that should return a Failure', () {
    test(
      'should return a FetchDataFailure when an error occurs',
      () async {
        // arrange

        // act

        // assert
      },
    );
  });
}
