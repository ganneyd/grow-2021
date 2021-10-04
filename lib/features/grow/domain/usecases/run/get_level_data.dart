import 'package:grow_run_v1/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:grow_run_v1/core/usecases/usecases.dart';
import 'package:grow_run_v1/features/grow/domain/entities/level_data/level_data_entity.dart';
import 'package:grow_run_v1/features/grow/domain/entities/run_daily_stats.dart';
import 'package:grow_run_v1/features/grow/domain/entities/run_details_entity.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/run_details_repository.dart';

///Returns the current user's [LevelDataModel]
class GetLevelData implements UseCase<LevelDataEntity, NoParams> {
  ///Takes an instance of  [RunDetailsRepository]
  const GetLevelData({
    required RunDetailsRepository runDetailsRepository,
  }) : _runDetailsRepository = runDetailsRepository;

  final RunDetailsRepository _runDetailsRepository;

  @override
  Future<Either<Failure, LevelDataEntity>> call(NoParams params) async {
    Either<Failure, List<RunSessionEntity>> results =
        await _runDetailsRepository.getRunSession();
    return results.fold((l) => Future.value(Left<Failure, LevelDataEntity>(l)),
        (r) {
      double distance = 0;
      for (final entity in r) {
        distance += entity.distance;
      }
      final int level = (distance / 2500).floor();
      return Future.value(
        Right<Failure, LevelDataEntity>(
          LevelDataEntity(distance: distance % (level * 2500), level: level),
        ),
      );
    });
  }
}
