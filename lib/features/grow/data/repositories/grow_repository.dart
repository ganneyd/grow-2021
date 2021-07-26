import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grow_run_v1/core/error/exceptions.dart';
import 'package:grow_run_v1/core/error/failures.dart';
import 'package:grow_run_v1/features/grow/data/models/school/school_model.dart';
import 'package:grow_run_v1/features/grow/domain/entities/school/school_entity.dart';
import '../../domain/repositories/grow_repository.dart';
import '../datasources/datasources.dart';

///The different collections in firestore that will be interacted with

enum Collections {
  ///The [School] collection that contains all relevant info for the school(s)
  school
}

///Implementation of the grow repository
class GROWRepositoryImplementation extends GROWRepository {
  ///Constrcutor , takes a [FireBaseAuth] instance
  GROWRepositoryImplementation(FirebaseAuth auth,
      {required this.remoteDataSource})
      : _firebaseAuth = auth;
  final FirebaseAuth _firebaseAuth;
  final RemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, List<SchoolEntity>>> getSchools() async {
    final List<SchoolModel> schools = <SchoolModel>[];
    try {
      //Attempt to retrieve the collection in JSON formatt
      final List<Map<String, dynamic>> result =
          await remoteDataSource.getCollection(Collections.school.toString());
      //If no exceptions are thrown then proceed to convert the JSON data
      //to school models, adding them to the [schools] list
      for (final Map<String, dynamic> schoolJSON in result) {
        schools.add(SchoolModel.fromJson(schoolJSON));
      }

      //if successful then this function will return the list of schools
      return Right<Failure, List<SchoolEntity>>(schools);
    } on ReadDataException {
      return Left<Failure, List<SchoolEntity>>(FetchDataFailure());
    } catch (error) {
      //this means we had an unexpected exception
      //todo track this unexpected exception and log it to crashlytics
      return Left<Failure, List<SchoolEntity>>(FetchDataFailure());
    }
  }
}
