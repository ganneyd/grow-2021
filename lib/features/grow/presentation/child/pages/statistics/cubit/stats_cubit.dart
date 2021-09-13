import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:grow_run_v1/core/error/failures.dart';
import 'package:grow_run_v1/features/grow/data/models/run_stats/run_stats_model.dart';
import 'package:grow_run_v1/features/grow/domain/entities/run_daily_stats.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/run_details_repository.dart';
import 'package:grow_run_v1/features/grow/domain/usecases/run/get_sessions_daily_stats.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/widgets/chart.dart';

import 'stats_state.dart';

///The leaderboard page cubit
class StatsCubit extends Cubit<StatsState> {
  ///
  StatsCubit({
    required RunDetailsRepository runDetailsRepository,
  })  : _getDailyStats =
            GetSessionByDay(runDetailsRepository: runDetailsRepository),
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
      final List<DistanceChartData> distanceChartData = <DistanceChartData>[
        // DistanceChartData(distanceForDay: 120, dateTime: DateTime(2021, 9, 2)),
        // DistanceChartData(distanceForDay: 10, dateTime: DateTime(2021, 9, 3)),
        // DistanceChartData(distanceForDay: 130, dateTime: DateTime(2021, 9, 4)),
        // DistanceChartData(distanceForDay: 20, dateTime: DateTime(2021, 9, 5)),
      ];
      if (list.isEmpty) {}
      for (final RunDailyStatsEntity entity in list) {
        distanceChartData.add(DistanceChartData(
            distanceForDay: entity.getDistance(), dateTime: entity.date));
      }

      return state.copyWith(
          status: StatsStatus.loadedSuccessfully,
          distanceStatsList: distanceChartData);
    }));
  }
}
