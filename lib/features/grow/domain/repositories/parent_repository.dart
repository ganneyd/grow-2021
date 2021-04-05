import 'package:dartz/dartz.dart';
import 'package:grow_run_v1/core/error/failures.dart';
import 'package:grow_run_v1/features/grow/domain/entities/parent/parent_entity.dart';

///Deals with all [Child] related calls to apis and external services
abstract class ParentRepository {
  ///Populates the children collection with an new entry belonging to the
  ///[parentUser], the id of the collection will be the [parentID] passed
  Future<Either<Failure, void>> createParentData(ParentEntity parentUser);

  ///Edits a [Parent] account by using the [parentID] passed and the
  ///[ParentEntity] to make the neccessary changes.
  ///returns the [UserCredentials] for the updated parent user if successful and
  ///[Failure] if unsuccessful
  Future<Either<Failure, void>> editParentUser(ParentEntity user);

  ///Returns a stream of [ParentEntity] by searching through the database and
  ///returning all the [ParentModel] in the parent
  ///collection. It takes no parameter and simply returns all in a list
  Future<Either<Failure, List<ParentEntity>>> getParents(String requestedBy);

  ///Returns a list of [ParentEntity] by searching through the database and
  ///returning all the [ParentModel] that matches the list of IDs passed to
  ///the method

  Future<Either<Failure, List<ParentEntity>>> getParentByID(
      List<String> parentIDs, String requestedBy);
}
