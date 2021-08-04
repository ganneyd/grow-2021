import 'package:grow_run_v1/core/error/failures.dart';

import 'package:dartz/dartz.dart';
import 'package:grow_run_v1/core/usecases/usecases.dart';
import 'package:grow_run_v1/features/grow/domain/entities/school/school_entity.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/school_repository.dart';

///Fetch the list of schools from the database
class GetListOfSchools implements UseCase<List<SchoolEntity>, NoParams> {
  ///Takes a [SchoolRepository] instance to make necessary calls
  /// to fetch the data from firestore
  const GetListOfSchools(SchoolRepository schoolRepository)
      : _schoolRepository = schoolRepository;

  final SchoolRepository _schoolRepository;

  @override
  Future<Either<Failure, List<SchoolEntity>>> call(NoParams params) {
    return _schoolRepository.getListOfSchools();
  }
}
