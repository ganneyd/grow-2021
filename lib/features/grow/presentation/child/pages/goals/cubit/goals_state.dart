import 'package:freezed_annotation/freezed_annotation.dart';

part 'goals_state.freezed.dart';

///The different states the leaderboard can be in
enum GoalsStatus {
  ///The leaderboard page retrieving necessary data
  loading,

  /// The data were retrieved successfully
  loadedSuccessfully,

  /// The data were retrieved with some errors
  loadedUnsuccessfully,
}

///
@freezed
class GoalsState with _$GoalsState {
  ///
  factory GoalsState({
    @Default(GoalsStatus.loading) GoalsStatus status,
  }) = _GoalsState;
}
