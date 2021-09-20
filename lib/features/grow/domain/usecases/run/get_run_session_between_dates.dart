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
class GetSessionBetweenDays
    implements UseCase<List<RunDailyStatsEntity>, Params> {
  ///takes an instance of [RunDetailsRepository]
  const GetSessionBetweenDays();

  @override
  Future<Either<Failure, List<RunDailyStatsEntity>>> call(Params params) async {
    List<RunDailyStatsEntity> runDailyStats =
        List<RunDailyStatsEntity>.generate(
            7,
            (index) => RunDailyStatsEntity(
                date: DateTime(
                    DateTime.now().year, params.month, params.minDay + index),
                runSessions: <RunSessionEntity>[]));
    print(
        'This is the minDate ${params.minDay} and the max ${params.maxDay} and the month ${params.month}');
    for (final RunDailyStatsEntity paramsEntity in params.runDailyStatsList) {
      for (int index = 0; index < runDailyStats.length; index++) {
        if (paramsEntity.date.day == runDailyStats[index].date.day &&
            paramsEntity.date.month == runDailyStats[index].date.month) {
          for (final RunSessionEntity runSessionEntity
              in params.runDailyStatsList[index].runSessions) {
            print('Adding this session $runSessionEntity');
            runDailyStats[index].runSessions.add(runSessionEntity);
          }
        }
      }
    }

    return Future.value(
        Right<Failure, List<RunDailyStatsEntity>>(runDailyStats));
  }
}

///Params for [GetDistanceStats]
class Params extends Equatable {
  ///provide the days that the session should fall on or between
  const Params(
      {required this.maxDay,
      required this.minDay,
      required this.runDailyStatsList,
      required this.month});

  ///the max day the session can fall before or on
  final int maxDay;

  ///the max day the session can fall after or on
  final int minDay;

  ///The month the session should be in
  final int month;

  ///the list of daily stats belonging to the user
  final List<RunDailyStatsEntity> runDailyStatsList;

  ///The

  @override
  // TODO: implement props
  List<Object?> get props => <Object>[maxDay, minDay, runDailyStatsList];
}
