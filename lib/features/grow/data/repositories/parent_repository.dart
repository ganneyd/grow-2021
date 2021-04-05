import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grow_run_v1/features/grow/data/repositories/repository_mixins.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/child_repository.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/parent_repository.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/entities_bucket.dart';
import '../datasources/datasources.dart';
import '../models/models_bucket.dart';

///Implementation of the parent repository
class ParentRepositoryImplementation extends ParentRepository {
  ///Constructor, takes a [RemoteDataSource] instance
  ParentRepositoryImplementation(RemoteDataSource remoteDataSource)
      : _remoteDataSource = remoteDataSource;
  //Reference to the remote datasource
  final RemoteDataSource _remoteDataSource;

  ///the collection name for the parent document collection
  static const String collectionName = 'parents';

  ///Converts the [ParentEntity] to an [ParentModel] then to a Json Map
  ///finally it returns the json map
  Map<String, dynamic> _convertEntityToJson(ParentEntity parentEntity) {
    return ParentModel.toParentModel(parentEntity).toJson();
  }

  ///Converts the [List<Map<String,dynamic>>] to a [List<ParentModel>]
  List<ParentModel> _convertJsonToParentList(
      List<Map<String, dynamic>> childrenJsonList) {
    final List<ParentModel> parentList = <ParentModel>[];
    for (final Map<String, dynamic> parentJson in childrenJsonList) {
      //add the parent model to the list
      parentList.add(ParentModel.fromJson(parentJson));
    }
    return parentList;
  }

  @override
  Future<Either<Failure, void>> createParentData(
      ParentEntity parentUser) async {
    try {
      return Right<Failure, void>(await _remoteDataSource.createData(
          collectionName, _convertEntityToJson(parentUser), parentUser.uid!));
    } on CreateDataException {
      return Left<Failure, void>(CreateDataFailure());
    } catch (e) {
      //TODO properly log the unexpected error
      return Left<Failure, void>(CreateDataFailure());
    }
  }

  @override
  Future<Either<Failure, void>> editParentUser(ParentEntity user) async {
    try {
      return Right<Failure, void>(await _remoteDataSource.updateData(
          collectionName, _convertEntityToJson(user), user.uid!));
    } on UpdateDataException {
      return Left<Failure, void>(UpdateDataFailure());
    } catch (e) {
      return Left<Failure, void>(UpdateDataFailure());
    }
  }

  @override
  Future<Either<Failure, List<ParentModel>>> getParentByID(
      List<String> parentIDs, String requestedBy) async {
    final List<ParentModel> parentList = <ParentModel>[];
    try {
      //check to see if list is empty, if it is return a failure
      if (parentIDs.isEmpty) {
        return Left<Failure, List<ParentModel>>(FetchDataFailure());
      }
      for (final String parentID in parentIDs) {
//retrive the document snapshot
        final Map<String, dynamic> parentJson =
            await _remoteDataSource.getData(collectionName, parentID);
        //add the child.fromJSon to the list
        parentList.add(ParentModel.fromJson(parentJson));
      }
      return Right<Failure, List<ParentModel>>(parentList);
    } on ReadDataException {
      return Left<Failure, List<ParentModel>>(FetchDataFailure());
    } catch (e) {
      return Left<Failure, List<ParentModel>>(FetchDataFailure());
    }
  }

  @override
  Future<Either<Failure, List<ParentModel>>> getParents(
      String requestedBy) async {
    ///List of all the children returned from the datasource
    try {
      //retrieve the Map<String,dynamic> [JSON] for the parent's collection
      final List<Map<String, dynamic>> parentJsonList =
          await _remoteDataSource.getCollection(collectionName);

      //return the list
      //worst case would be that the list is empty
      return Right<Failure, List<ParentModel>>(
          _convertJsonToParentList(parentJsonList));
    } on ReadDataException {
      return Left<Failure, List<ParentModel>>(FetchDataFailure());
    } catch (e) {
      //TODO: log unexpected error
      return Left<Failure, List<ParentModel>>(FetchDataFailure());
    }
  }
}
