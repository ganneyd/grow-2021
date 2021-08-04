import 'package:dartz/dartz.dart';
import 'package:grow_run_v1/core/error/failures.dart';
import 'package:grow_run_v1/features/grow/domain/entities/school/school_entity.dart';

///Schools' repo
abstract class SchoolRepository {
  ///Gets the SchoolEntities from the datasources and return them or return a
  ///failure as to why it failed
  Future<Either<Failure, List<SchoolEntity>>> getListOfSchools();

  ///searches the database and returns a specific school that matches the
  ///[schoolID] passed
  Future<Either<Failure, SchoolEntity>> getSchool({required String schoolID});
}
