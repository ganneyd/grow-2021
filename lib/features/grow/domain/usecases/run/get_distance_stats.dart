import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:grow_run_v1/core/error/failures.dart';
import 'package:grow_run_v1/core/usecases/usecases.dart';
import 'package:grow_run_v1/features/grow/domain/entities/run_details_entity.dart';
import 'package:grow_run_v1/features/grow/domain/entities/run_stats.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/run_details_repository.dart';

///Retrieves the distance a user ran for a daily bassis or weekly as
///specified by the [Params]
class GetDistanceStats implements UseCase<RunStatsEntity, Params> {
  ///takes an instance of [RunDetailsRepository]
  const GetDistanceStats({
    required RunDetailsRepository runDetailsRepository,
  }) : _runDetailsRepository = runDetailsRepository;
  final RunDetailsRepository _runDetailsRepository;
  @override
  Future<Either<Failure, RunStatsEntity>> call(Params params) async {
    Either<Failure, List<RunDetailsEntity>> results =
        await _runDetailsRepository.getRunSession();

    return results
        .fold((_) => const Left<Failure, RunStatsEntity>(FetchDataFailure()),
            (List<RunDetailsEntity> runDetsList) {
      if (runDetsList.isNotEmpty) {
        double distance = 0;
        //TODO might not sort sessions according to date, make sure they are
        DateTime dateTime = runDetsList.first.timeStamp;
        for (final RunDetailsEntity runDetailsEntity in runDetsList) {
          if (dateTime.day == runDetailsEntity.timeStamp.day) {
            distance += runDetailsEntity.distance;
          } else {
            dateTime = runDetailsEntity.timeStamp;
          }
        }
        return Future.value(Right<Failure, RunStatsEntity>(RunStatsEntity(
            startDate: DateTime.now(),
            statName: 'Distance',
            statValue: distance)));
      }
    });
  }
}

///Params for [GetDistanceStats]
class Params extends Equatable {
  ///[isWeekly] true if the stats should be calculated for the week
  ///or for a day to day basis [false]
  const Params({required this.isWeekly});

  ///whether the stats if for the week[true] or for a day [false]
  final bool isWeekly;

  @override
  // TODO: implement props
  List<Object?> get props => <Object>[isWeekly];
}
