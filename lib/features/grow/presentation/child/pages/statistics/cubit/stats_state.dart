import 'package:freezed_annotation/freezed_annotation.dart';

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

///
@freezed
class StatsState with _$StatsState {
  ///
  factory StatsState({
    @Default(StatsStatus.loading) StatsStatus status,
  }) = _StatsState;
}
