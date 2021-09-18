import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:grow_run_v1/core/error/failures.dart';
import 'package:grow_run_v1/features/grow/data/models/run_stats/run_stats_model.dart';
import 'package:grow_run_v1/features/grow/domain/entities/run_daily_stats.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/authentication_repository.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/run_details_repository.dart';
import 'package:grow_run_v1/features/grow/domain/usecases/run/get_sessions_daily_stats.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/widgets/chart.dart';

import 'stats_state.dart';

///The leaderboard page cubit
class StatsCubit extends Cubit<StatsState> {
  ///
  StatsCubit(
      {required RunDetailsRepository runDetailsRepository,
      required AuthenticationRepository authenticationRepository})
      : _getDailyStats = GetSessionByDay(
            runDetailsRepository: runDetailsRepository,
            authenticationRepository: authenticationRepository),
        super(StatsState());

  final GetSessionByDay _getDailyStats;

  Future<void> init() async {
    emit(state.copyWith(status: StatsStatus.loading));

    final Either<Failure, List<RunDailyStatsEntity>> results =
        await _getDailyStats.call(const Params(isWeekly: false));

    emit(results.fold(
        (l) => state.copyWith(
            status: StatsStatus.loadedUnsuccessfully,
            errMsg: l.message), (List<RunDailyStatsEntity> list) {
      final List<DailyChartData> distanceChartData = <DailyChartData>[];

      final List<DailyChartData> avgPaceChartData = <DailyChartData>[];
      final List<DailyChartData> maxPaceChartData = <DailyChartData>[];
      final List<DailyChartData> totalRunSessionsChartData = <DailyChartData>[];
      final List<DailyChartData> maxDistanceChartData = <DailyChartData>[];
      if (list.isEmpty) {}
      for (final RunDailyStatsEntity entity in list) {
        print('This is the enitty date ${entity.date}');
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
            chartName: 'Avergae Pace'));
        distanceChartData.add(DailyChartData(
            chartName: 'Total Distance',
            value: entity.getDistance(),
            dateTime: entity.date));
      }

      return state.copyWith(
          status: StatsStatus.loadedSuccessfully,
          chartList: <List<DailyChartData>>[
            maxDistanceChartData,
            maxPaceChartData,
            distanceChartData,
            avgPaceChartData,
            totalRunSessionsChartData
          ]);
    }));
  }
}
