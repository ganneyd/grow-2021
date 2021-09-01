import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:grow_run_v1/core/error/failures.dart';
import 'package:grow_run_v1/features/grow/data/models/run_stats/run_stats_model.dart';
import 'package:grow_run_v1/features/grow/domain/entities/run_stats.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/run_details_repository.dart';
import 'package:grow_run_v1/features/grow/domain/usecases/run/get_distance_stats.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/widgets/chart.dart';

import 'stats_state.dart';

///The leaderboard page cubit
class StatsCubit extends Cubit<StatsState> {
  ///
  StatsCubit({
    required RunDetailsRepository runDetailsRepository,
  })  : _getDistanceStats =
            GetDistanceStats(runDetailsRepository: runDetailsRepository),
        super(StatsState());

  final GetDistanceStats _getDistanceStats;

  Future<void> init() async {
    emit(state.copyWith(status: StatsStatus.loading));

    final Either<Failure, List<RunStatsEntity>> results =
        await _getDistanceStats.call(const Params(isWeekly: false));

    emit(results.fold(
        (l) => state.copyWith(
            status: StatsStatus.loadedUnsuccessfully,
            errMsg: l.message), (List<RunStatsEntity> list) {
      final List<DistanceChartData> distanceChartData = <DistanceChartData>[];
      if (list.isEmpty) {}
      for (final RunStatsEntity entity in list) {
        distanceChartData.add(DistanceChartData(
            distanceForDay: entity.statValue, dateTime: entity.startDate));
      }

      return state.copyWith(
          status: StatsStatus.loadedSuccessfully,
          distanceStatsList: distanceChartData);
    }));
  }
}
