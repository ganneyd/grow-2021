import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.freezed.dart';

///The different states the leaderboard can be in
enum ProfileStatus {
  ///The leaderboard page retrieving necessary data
  loading,

  /// The data were retrieved successfully
  loadedSuccessfully,

  /// The data were retrieved with some errors
  loadedUnsuccessfully,
}

///
@freezed
class ProfileState with _$ProfileState {
  ///
  factory ProfileState({
    @Default(ProfileStatus.loading) ProfileStatus status,
  }) = _ProfileState;
}
