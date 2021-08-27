import 'package:grow_run_v1/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:grow_run_v1/core/usecases/usecases.dart';
import 'package:grow_run_v1/features/grow/domain/entities/run_details_entity.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/run_details_repository.dart';

///Retrieves all the run sessions from the datasource
class GetRunSessions implements UseCase<List<RunDetailsEntity>, NoParams> {
  ///Takes an instance of [RunDetailsRepository]
  const GetRunSessions({required RunDetailsRepository runDetailsRepository})
      : _runDetailsRepository = runDetailsRepository;
  final RunDetailsRepository _runDetailsRepository;

  @override
  Future<Either<Failure, List<RunDetailsEntity>>> call(NoParams params) {
    return _runDetailsRepository.getRunSession();
  }
}
