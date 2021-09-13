import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grow_run_v1/features/grow/data/models/run_stats/run_stats_model.dart';
import 'package:grow_run_v1/features/grow/domain/entities/run_daily_stats.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/widgets/chart.dart';

part 'stats_state.freezed.dart';

///The different states the leaderboard can be in
enum StatsStatus {
  ///The leaderboard page retrieving necessary data
  loading,

  /// The data were retrieved successfully
  loadedSuccessfully,

  /// The data were retrieved with some errors
  loadedUnsuccessfully,
}

///Extension on the stats Status to check if the status is true to a conditions
extension StatsStatusExtension on StatsStatus {
  /// if the stats are being loading
  bool isLoading() => this == StatsStatus.loading;

  ///if the stats were loaded successfully
  bool loadedSuccessfully() => this == StatsStatus.loadedSuccessfully;

  ///if the stars were not loaded successfully
  bool loadedUnsuccessfully() => this == StatsStatus.loadedUnsuccessfully;
}

///
@freezed
class StatsState with _$StatsState {
  ///
  factory StatsState({
    @Default('') String errMsg,
    @Default(StatsStatus.loading) StatsStatus status,
    @Default(<DistanceChartData>[]) List<DistanceChartData> distanceStatsList,
  }) = _StatsState;
}
