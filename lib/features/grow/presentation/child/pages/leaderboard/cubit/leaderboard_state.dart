import 'package:freezed_annotation/freezed_annotation.dart';

part 'leaderboard_state.freezed.dart';

///The different states the leaderboard can be in
enum LeaderboardStatus {
  ///The leaderboard page retrieving necessary data
  loading,

  /// The data were retrieved successfully
  loadedSuccessfully,

  /// The data were retrieved with some errors
  loadedUnsuccessfully,
}

///
@freezed
class LeaderboardState with _$LeaderboardState {
  ///
  factory LeaderboardState({
    @Default(LeaderboardStatus.loading) LeaderboardStatus status,
  }) = _LeaderboardState;
}
