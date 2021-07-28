import 'package:grow_run_v1/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:grow_run_v1/core/usecases/usecases.dart';
import 'package:grow_run_v1/features/grow/domain/entities/school/school_entity.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/grow_repository.dart';

///Fetch the list of schools from the database
class GetSchools implements UseCase<List<SchoolEntity>, NoParams> {
  ///Takes a [GrowRepository] instance to make neccesary calls
  /// to fetch the data from firestore
  const GetSchools(GROWRepository growRepository)
      : _growRepository = growRepository;

  final GROWRepository _growRepository;

  @override
  Future<Either<Failure, List<SchoolEntity>>> call(NoParams params) {
    return _growRepository.getSchools();
  }
}
