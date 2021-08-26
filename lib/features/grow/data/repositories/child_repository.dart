import 'package:dartz/dartz.dart';
import 'package:grow_run_v1/features/grow/data/repositories/repository_mixins.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/child_repository.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/entities_bucket.dart';
import '../datasources/datasources.dart';
import '../models/models_bucket.dart';

///Implementation of the child repository
class ChildRepositoryImplementation extends ChildRepository with RepoMixins {
  ///final LocalDataSource localDataSource;
  ChildRepositoryImplementation(RemoteDataSource remoteDataSource)
      : _remoteDataSource = remoteDataSource;

  ///the collection name for the child document collection
  static const String collectionName = 'children';

  ///Reference to the remote datasource
  final RemoteDataSource _remoteDataSource;

  //Converts the [ChildEntity] to an [ChildModel] then to a Json Map
//finally it returns the json map
  Map<String, dynamic> _convertEntityToJson(ChildEntity childEntity) {
    return Child.toChild(childEntity).toJson();
  }

  ///Converts the [List<Map<String,dynamic>>] to a [List<Child>]
  List<Child> _convertJsonToChildList(
      List<Map<String, dynamic>> childrenJsonList) {
    final List<Child> childList = <Child>[];
    for (final Map<String, dynamic> childJson in childrenJsonList) {
      //add the child model to the list
      childList.add(Child.fromJson(childJson));
    }
    return childList;
  }

  @override
  Future<Either<Failure, void>> createChildData(
      ChildEntity childUser, String childID) async {
    try {
      return Right<Failure, void>(await _remoteDataSource.createData(
          collectionName: collectionName,
          jsonData: _convertEntityToJson(childUser),
          docID: childID));
    } on CreateDataException {
      return const Left<Failure, void>(CreateDataFailure());
    } catch (e) {
      //TODO properly log the unexpected error
      return const Left<Failure, void>(CreateDataFailure());
    }
  }

  @override
  Future<Either<Failure, void>> editChildUser(
      ChildEntity child, String childID) async {
    try {
      return Right<Failure, void>(await _remoteDataSource.updateData(
          collectionName, _convertEntityToJson(child), childID));
    } on UpdateDataException {
      return const Left<Failure, void>(UpdateDataFailure());
    } catch (e) {
      return const Left<Failure, void>(UpdateDataFailure());
    }
  }

  @override
  Future<Either<Failure, List<ChildEntity>>> getChildren(
      String requestedBy) async {
    try {
      //retrieve the snapshot for the children's collection
      final List<Map<String, dynamic>> childrenJsonList =
          await _remoteDataSource.getCollection(collectionName);
      //iterate through the list and convert the json data to
      //child models

      //return the list
      //worst case would be that the list is empty
      return Right<Failure, List<ChildEntity>>(
          _convertJsonToChildList(childrenJsonList));
    } on ReadDataException {
      return const Left<Failure, List<ChildEntity>>(
          FetchDataFailure(errMsg: 'read data'));
    } catch (e) {
      //TODO: log unexpected error
      return const Left<Failure, List<ChildEntity>>(
          FetchDataFailure(errMsg: 'unforeseen'));
    }
  }

  @override
  Future<Either<Failure, List<ChildEntity>>> getChildrenByID(
      List<String> childrenIDs, String requestedBy) async {
    final List<ChildEntity> childrenList = <ChildEntity>[];
    try {
      for (final String childID in childrenIDs) {
//retrieve the document snapshot
        final Map<String, dynamic> childJson =
            await _remoteDataSource.getData(collectionName, childID);
        //add the child.fromJSon to the list
        childrenList.add(Child.fromJson(childJson));
      }
      return Right<Failure, List<ChildEntity>>(childrenList);
    } on ReadDataException {
      return const Left<Failure, List<ChildEntity>>(FetchDataFailure());
    } catch (e) {
      return const Left<Failure, List<ChildEntity>>(FetchDataFailure());
    }
  }

  @override
  Future<Either<Failure, List<ChildEntity>>> getChildrenBySchool(
      String schoolID, String requestedBy) async {
    final List<Child> childrenList = <Child>[];
    try {
      final List<Map<String, dynamic>> childrenJsonList =
          await _remoteDataSource.queryCollection(collectionName, 'schoolID',
              isEqualTo: schoolID);
      //iterate throughout the querySnapshot and add the child to the children
      //list
      // check to make sure the querySnapshot isn't empty

      return Right<Failure, List<ChildEntity>>(
          _convertJsonToChildList(childrenJsonList));
    } on ReadDataException {
      return const Left<Failure, List<ChildEntity>>(FetchDataFailure());
    } catch (e) {
      return const Left<Failure, List<ChildEntity>>(FetchDataFailure());
    }
  }

  @override
  Future<Either<Failure, ChildEntity>> getChild(String childID) async {
    try {
      final Map<String, dynamic> result =
          await _remoteDataSource.getData('children', childID);
      if (result.isEmpty) {
        throw Exception("Couldn't find child data.");
      }
      final Child child = Child.fromJson(result);
      return Right<Failure, ChildEntity>(child);
    } catch (error) {
      return Left<Failure, ChildEntity>(
          FetchDataFailure(errMsg: error.toString()));
    }
  }
}
