import 'package:dartz/dartz.dart';
import 'package:grow_run_v1/core/error/failures.dart';
import 'package:grow_run_v1/features/grow/domain/entities/child/child_entity.dart';

///Deals with all [Child] related calls to apis and external services
abstract class ChildRepository {
  ///Populates the children collection with an new entry belonging to the
  ///[childUser], the id of the collection will be the [childID] passed
  Future<Either<Failure, void>> createChildData(
      ChildEntity childUser, String childID);

  ///Edits a [Child] account by using the [userID] passed
  ///and using the changed [childEntity] to make the  necessary changes.
  ///returns void  if successful and [Failure] if unsuccessful
  Future<Either<Failure, void>> editChildUser(
      ChildEntity child, String childID);

  ///Returns a particular chid entity as defined by the [childID]
  Future<Either<Failure, ChildEntity>> getChild(String childID);

  ///Returns a stream of [ChildEntity] by searching through the database
  ///and returning all the [ChildModel] in the children
  ///collection. It takes no parameter and simply returns all in a stream
  Future<Either<Failure, List<ChildEntity>>> getChildren(String requestedBy);

  ///Returns a stream of [ChildEntity] by searching through the database
  ///and returning all the [ChildModel] that matches the list of IDs
  ///passed to the method

  Future<Either<Failure, List<ChildEntity>>> getChildrenByID(
      List<String> childrenIDs, String requestedBy);

  ///Returns a stream of [ChildEntity] by searching through the children
  ///collection and returning all the [ChildModel] that has the same school
  ///passed to the me
  Future<Either<Failure, List<ChildEntity>>> getChildrenBySchool(
      String schoolID, String requestedBy);
}
