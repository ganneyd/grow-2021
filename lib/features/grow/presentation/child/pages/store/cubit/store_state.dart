import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_state.freezed.dart';

///The different states the leaderboard can be in
enum StoreStatus {
  ///The leaderboard page retrieving necessary data
  loading,

  /// The data were retrieved successfully
  loadedSuccessfully,

  /// The data were retrieved with some errors
  loadedUnsuccessfully,
}

///
@freezed
class StoreState with _$StoreState {
  ///
  factory StoreState({
    @Default(StoreStatus.loading) StoreStatus status,
  }) = _StoreState;
}
