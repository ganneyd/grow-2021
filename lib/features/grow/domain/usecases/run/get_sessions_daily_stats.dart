import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:grow_run_v1/core/error/failures.dart';
import 'package:grow_run_v1/core/usecases/usecases.dart';
import 'package:grow_run_v1/features/grow/domain/entities/run_details_entity.dart';
import 'package:grow_run_v1/features/grow/domain/entities/run_daily_stats.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/authentication_repository.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/run_details_repository.dart';

///Retrieves the distance a user ran for a daily bassis or weekly as
///specified by the [Params]
class GetSessionByDay implements UseCase<List<RunDailyStatsEntity>, Params> {
  ///takes an instance of [RunDetailsRepository]
  const GetSessionByDay({
    required RunDetailsRepository runDetailsRepository,
    required AuthenticationRepository authenticationRepository,
  })  : _runDetailsRepository = runDetailsRepository,
        _authenticationRepository = authenticationRepository;
  final RunDetailsRepository _runDetailsRepository;
  final AuthenticationRepository _authenticationRepository;
  @override
  Future<Either<Failure, List<RunDailyStatsEntity>>> call(Params params) async {
    final List<RunDailyStatsEntity> runStatsList = <RunDailyStatsEntity>[];
    Either<Failure, List<RunSessionEntity>> results =
        await _runDetailsRepository.getRunSession();

    return results.fold(
        (_) =>
            const Left<Failure, List<RunDailyStatsEntity>>(FetchDataFailure()),
        (List<RunSessionEntity> runDetsList) {
      if (runDetsList.isNotEmpty) {
        //TODO might not sort sessions according to date, make sure they are
        DateTime dateTime = runDetsList.first.timeStamp;
        runStatsList.add(RunDailyStatsEntity(
            date: dateTime,
            runSessions: <RunSessionEntity>[runDetsList.first]));
        for (final RunSessionEntity runDetailsEntity in runDetsList) {
          print('This is the entity date ${runDetailsEntity.timeStamp}');
          if (dateTime.day == runDetailsEntity.timeStamp.day) {
            if (!runStatsList.last.runSessions.contains(runDetailsEntity)) {
              runStatsList.last.runSessions.add(runDetailsEntity);
            }
          } else {
            dateTime = runDetailsEntity.timeStamp;
            runStatsList.add(RunDailyStatsEntity(
                date: dateTime,
                runSessions: <RunSessionEntity>[runDetailsEntity]));
          }
        }
        return Future<Either<Failure, List<RunDailyStatsEntity>>>.value(
            Right<Failure, List<RunDailyStatsEntity>>(runStatsList));
      } else {
        return const Left<Failure, List<RunDailyStatsEntity>>(
            FetchDataFailure(errMsg: 'Data set is empty'));
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
