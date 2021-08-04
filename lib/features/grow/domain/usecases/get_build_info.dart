import 'package:grow_run_v1/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:grow_run_v1/core/usecases/usecases.dart';
import 'package:grow_run_v1/core/util/build_info.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/grow_repository.dart';

///When the build info is needed this usecase returns it
class GetBuildInfo implements UseCase<BuildInfo, NoParams> {
  ///Takes a instance of [GROWRepository]
  GetBuildInfo({required GROWRepository growRepository})
      : _growRepository = growRepository;

  final GROWRepository _growRepository;
  @override
  Future<Either<Failure, BuildInfo>> call(NoParams params) {
    return _growRepository.getBuildInfo();
  }
}
