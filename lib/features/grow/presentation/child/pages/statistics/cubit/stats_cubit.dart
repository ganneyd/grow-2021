import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:grow_run_v1/core/error/failures.dart';
import 'package:grow_run_v1/features/grow/data/models/run_stats/run_stats_model.dart';
import 'package:grow_run_v1/features/grow/domain/entities/run_daily_stats.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/authentication_repository.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/run_details_repository.dart';
import 'package:grow_run_v1/features/grow/domain/usecases/run/get_run_session_between_dates.dart'
    as between;
import 'package:grow_run_v1/features/grow/domain/usecases/run/get_sessions_daily_stats.dart'
    as date;
import 'package:grow_run_v1/features/grow/presentation/child/pages/widgets/chart.dart';

import 'stats_state.dart';

///The leaderboard page cubit
class StatsCubit extends Cubit<StatsState> {
  ///
  StatsCubit(
      {required RunDetailsRepository runDetailsRepository,
      required AuthenticationRepository authenticationRepository})
      : _getDailyStats = date.GetSessionByDay(
            runDetailsRepository: runDetailsRepository,
            authenticationRepository: authenticationRepository),
        _getSessionBetweenDays = between.GetSessionBetweenDays(),
        super(StatsState());

  final date.GetSessionByDay _getDailyStats;
  final between.GetSessionBetweenDays _getSessionBetweenDays;

  Future<void> init() async {
    final int minDate = DateTime.now().day - DateTime.now().weekday;
    final int maxDate = DateTime.now().day + 6 - DateTime.now().weekday;
    emit(state.copyWith(
      status: StatsStatus.loading,
      minDay: minDate,
      maxDay: maxDate,
      month: DateTime.now().month,
      numberOfDays: DateTime.now()
              .difference(DateTime(
                DateTime.now().year,
              ))
              .inDays +
          (7 - DateTime.now().weekday),
    ));

    final Either<Failure, List<RunDailyStatsEntity>> results =
        await _getDailyStats.call(const date.Params(isWeekly: false));

    emit(results.fold(
        (l) => state.copyWith(
            status: StatsStatus.loadedUnsuccessfully,
            errMsg: l.message), (List<RunDailyStatsEntity> list) {
      return state.copyWith(
        status: StatsStatus.loadedSuccessfully,
        displayList: list,
      );
    }));

    final Either<Failure, List<RunDailyStatsEntity>> thisWeeksStats =
        await _getSessionBetweenDays(between.Params(
            maxDay: maxDate,
            minDay: minDate,
            month: DateTime.now().month,
            runDailyStatsList: state.displayList));

    emit(thisWeeksStats.fold((l) => state.copyWith(),
        (List<RunDailyStatsEntity> r) {
      print('This is how much daily stats they are ${r.length}');
      for (RunDailyStatsEntity entity in r) {
        print('This length of each run sess is ${entity.runSessions.length}');
      }
      return state.copyWith(chartList: getCharts(r));
    }));
  }

  Future<void> dateChanged(int index) async {
    DateTime date = DateTime(DateTime.now().year).add(Duration(days: index));
    final Either<Failure, List<RunDailyStatsEntity>> result =
        await _getSessionBetweenDays(between.Params(
            maxDay: date.day + 6 - date.weekday,
            minDay: date.day - date.weekday,
            month: date.month,
            runDailyStatsList: state.displayList));
    emit(result.fold((l) => state.copyWith(),
        (r) => state.copyWith(chartList: getCharts(r))));
  }

  List<List<DailyChartData>> getCharts(List<RunDailyStatsEntity> list) {
    final List<DailyChartData> distanceChartData = <DailyChartData>[];

    final List<DailyChartData> avgPaceChartData = <DailyChartData>[];
    final List<DailyChartData> maxPaceChartData = <DailyChartData>[];
    final List<DailyChartData> totalRunSessionsChartData = <DailyChartData>[];
    final List<DailyChartData> maxDistanceChartData = <DailyChartData>[];
    if (list.isNotEmpty) {
      for (final RunDailyStatsEntity entity in list) {
        totalRunSessionsChartData.add(DailyChartData(
            dateTime: entity.date,
            value: entity.getNumRunSessions().toDouble(),
            chartName: 'Total Run Sessions'));
        maxDistanceChartData.add(DailyChartData(
            dateTime: entity.date,
            value: entity.getMaxDistance(),
            chartName: 'Max Distance'));
        maxPaceChartData.add(DailyChartData(
            dateTime: entity.date,
            value: entity.getMaxPace(),
            chartName: 'Max Pace'));
        avgPaceChartData.add(DailyChartData(
            dateTime: entity.date,
            value: entity.getAvgPace(),
            chartName: 'Average Pace'));
        distanceChartData.add(DailyChartData(
            chartName: 'Total Distance',
            value: entity.getDistance(),
            dateTime: entity.date));
      }
    }

    return <List<DailyChartData>>[
      distanceChartData,
      maxDistanceChartData,
      avgPaceChartData,
      maxPaceChartData,
      totalRunSessionsChartData,
    ];
  }

  // List<RunDailyStatsEntity> getThisWeekData(
  //     DateTime day, List<RunDailyStatsEntity> list) {
  //   final List<RunDailyStatsEntity> returnList = <RunDailyStatsEntity>[];

  //   if (list.isNotEmpty) {
  //     print('This is the minDate $minDate, this is the maxDate $maxDate');
  //     for (int index = 0; index < list.length; index++) {
  //       print('This is the date of the entity being added ${list[index].date}');
  //       if (list[index].date.day >= minDate &&
  //           list[index].date.day <= maxDate &&
  //           list[index].date.month == day.month) {
  //         print('Adding this data ${list[index].date.day}');
  //         returnList.add(list[index]);
  //       }
  //     }
  //   }

  //   return returnList;
  // }
}
