import 'package:grow_run_v1/core/error/exceptions.dart';
import 'package:grow_run_v1/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:grow_run_v1/features/grow/data/datasources/remote/firebase/grow_remote_datasource.dart';
import 'package:grow_run_v1/features/grow/data/models/models_bucket.dart';
import 'package:grow_run_v1/features/grow/domain/entities/school/school_entity.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/school_repository.dart';

///Deals with all the backend services necessary for CRUD for schools etc
class SchoolRepositoryImplementation implements SchoolRepository {
  ///Init School Repo, takes an instance of [RemoteDataSource]
  SchoolRepositoryImplementation(RemoteDataSource remoteDataSource)
      : _remoteDataSource = remoteDataSource;

  final RemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, List<SchoolModel>>> getListOfSchools() async {
    final List<SchoolModel> schools = <SchoolModel>[];
    try {
      //Attempt to retrieve the collection in JSON format
      final List<Map<String, dynamic>> result =
          await _remoteDataSource.getCollection('school');
      //If no exceptions are thrown then proceed to convert the JSON data
      //to school models, adding them to the [schools] list
      for (final Map<String, dynamic> schoolJSON in result) {
        schools.add(SchoolModel.fromJson(schoolJSON));
      }

      //if successful then this function will return the list of schools
      return Right<Failure, List<SchoolModel>>(schools);
    } on ReadDataException {
      return const Left<Failure, List<SchoolModel>>(FetchDataFailure());
    } catch (error) {
      //this means we had an unexpected exception
      //todo track this unexpected exception and log it to crashlytics
      print('Error in grow  repo $error');
      return const Left<Failure, List<SchoolModel>>(FetchDataFailure());
    }
  }

  @override
  Future<Either<Failure, SchoolModel>> getSchool(
      {required String schoolID}) async {
    try {
      final Map<String, dynamic> results =
          await _remoteDataSource.getData('school', schoolID);
      if (results.isEmpty) {
        throw Exception('The query yield no data.');
      }
      final SchoolModel schoolModel = SchoolModel.fromJson(results);
      return Right<Failure, SchoolModel>(schoolModel);
    } catch (error) {
      return Left<Failure, SchoolModel>(
          FetchDataFailure(errMsg: error.toString()));
    }
  }
}
