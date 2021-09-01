import 'package:grow_run_v1/features/grow/data/datasources/remote/firebase/grow_remote_datasource.dart';
import 'package:grow_run_v1/features/grow/data/models/run_details_model.dart';
import 'package:grow_run_v1/features/grow/domain/entities/goal/goal_entity.dart';
import 'package:grow_run_v1/features/grow/domain/entities/run_details_entity.dart';
import 'package:grow_run_v1/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/run_details_repository.dart';

///Implements the Run Repo
class RunRepositoryImplementation extends RunDetailsRepository {
  ///Takes an instance of [RemoteDataSource]
  RunRepositoryImplementation({
    required RemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  final RemoteDataSource _remoteDataSource;

  Map<String, dynamic> runSessionJSON(
      {required RunDetailsEntity runDetailsEntity}) {
    return RunDetailsModel.toRunModel(runDetailsEntity).toJson();
  }

  @override
  Future<Either<Failure, void>> addRunSession(
      {required String uid,
      required RunDetailsEntity runSession,
      required DateTime sessionDate}) async {
    try {
      await _remoteDataSource.createData(
          docID: uid,
          collectionName: 'run-sessions',
          jsonData: runSessionJSON(runDetailsEntity: runSession));
      return Future<Either<Failure, void>>.value(
          const Right<Failure, void>(null));
    } catch (e) {
      return Future<Either<Failure, void>>.value(
          const Left<Failure, void>(CreateDataFailure()));
    }
  }

  @override
  Future<Either<Failure, List<RunDetailsEntity>>> getRunSession() async {
    try {
      final List<RunDetailsModel> models = <RunDetailsModel>[];

      final List<Map<String, dynamic>> results =
          await _remoteDataSource.getCollection('run-sessions');
      for (final Map<String, dynamic> element in results) {
        models.add(RunDetailsModel.fromJson(element));
      }

      return Future<Either<Failure, List<RunDetailsEntity>>>.value(
          Right<Failure, List<RunDetailsModel>>(models));
    } catch (e) {
      return Future<Either<Failure, List<RunDetailsEntity>>>.value(
          const Left<Failure, List<RunDetailsEntity>>(FetchDataFailure()));
    }
  }

  @override
  Future<Either<Failure, void>> setGoal({required GoalEntity goal}) {
    // TODO: implement setGoal
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<RunDetailsEntity>>> queryRunSessions({required}) {
    // TODO: implement queryRunSessions
    throw UnimplementedError();
  }
}
