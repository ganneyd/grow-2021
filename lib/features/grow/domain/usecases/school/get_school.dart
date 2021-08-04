import 'package:equatable/equatable.dart';
import 'package:grow_run_v1/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:grow_run_v1/core/usecases/usecases.dart';
import 'package:grow_run_v1/features/grow/domain/entities/entities_bucket.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/school_repository.dart';

///Returns a single school entity based on the
///[Params.schoolID]
class GetSchool implements UseCase<SchoolEntity, Params> {
  ///Takes a [SchoolRepository] instance to make necessary calls
  /// to fetch the data from remoteDatasource
  const GetSchool({required SchoolRepository schoolRepository})
      : _schoolRepository = schoolRepository;

  final SchoolRepository _schoolRepository;

  @override
  Future<Either<Failure, SchoolEntity>> call(Params params) {
    return _schoolRepository.getSchool(schoolID: params.schoolID);
  }
}

///The Params necessary to retrieve the data from the data source
class Params extends Equatable {
  ///Constructor, takes a string [schoolID]
  const Params({required this.schoolID});

  ///The id of the school wanted
  final String schoolID;

  @override
  List<Object?> get props => <Object>[schoolID];
}
