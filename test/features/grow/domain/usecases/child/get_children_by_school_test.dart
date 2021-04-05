import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grow_run_v1/features/grow/data/datasources/remote/firebase/grow_remote_datasoure.dart';
import 'package:grow_run_v1/features/grow/data/repositories/child_repository.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/child_repository.dart';

void main() {
  final MockFirestoreInstance mockFirestoreInstance = MockFirestoreInstance();
  final RemoteDataSource remoteDataSource =
      RemoteDataSourceImplementation(mockFirestoreInstance);
  final ChildRepository childRepository =
      ChildRepositoryImplementation(remoteDataSource);

  group('Tests that should return successfully', () {
    test(
      'should return a list of ChildEntities that all matches the schoolID '
      'passed ',
      () async {
        // arrange

        // act

        // assert
      },
    );
  });
}
