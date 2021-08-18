import 'dart:async';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grow_run_v1/core/util/build_info.dart';
import 'package:grow_run_v1/features/grow/data/models/stop_watch/stop_watch_model.dart';

part 'run_state.freezed.dart';

///The different states the leaderboard can be in
enum RunPageStatus {
  ///The leaderboard page retrieving necessary data
  loading,

  /// The data were retrieved successfully
  loadedSuccessfully,

  /// The data were retrieved with some errors
  loadedUnsuccessfully,

  ///Data is being processed
  processing,

  ///Data was processed successfully
  processSuccessfully,

  ///Data was processed with some error(s)
  processUnsuccessfully,
}

///
@freezed
class RunPageState with _$RunPageState {
  ///s
  factory RunPageState({
    @Default(RunPageStatus.loading) RunPageStatus status,
    @Default(BuildInfo()) BuildInfo buildInfo,
    @Default(0.0) double elapsedTime,
    @Default(0.0) double distance,
    @Default(0.0) double pacePerDistance,
    @Default(true) bool isImperial,
    @Default(false) bool timerStarted,
    Color? splashColor,
  }) = _RunPageState;
}
