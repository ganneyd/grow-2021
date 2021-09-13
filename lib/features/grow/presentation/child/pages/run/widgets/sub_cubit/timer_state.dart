import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grow_run_v1/features/grow/data/models/previous/previous_model.dart';
import 'package:grow_run_v1/features/grow/data/models/run_details_model.dart';
import 'package:grow_run_v1/features/grow/data/models/stop_watch/stop_watch_model.dart';
import 'package:grow_run_v1/features/grow/domain/entities/run_details_entity.dart';
part 'timer_state.freezed.dart';

enum TimerStatus {
  ///Not yet begun
  fresh,

  ///The run has been initialized
  running,

  ///the running session has been paused
  runPaused,

  ///the running session has been resumed
  runResumed,

  ///The running session has been ended
  runEnded,

  ///The run session is being  added
  runSessionAdding,

  ///The run session was added successfully
  runSessionAddedSuccessfully,

  ///The run session was added unsuccessfully
  runSessionAddedUnsuccessfully,
}

///Exposes methods to determine which status is currently
extension RunPageStatusExtensions on TimerStatus {
  ///if the timer has not yet begun
  bool isFresh() => this == TimerStatus.fresh;

  ///If the timer is currently running
  bool isRunning() => this == TimerStatus.running;

  ///if the timer is paused
  bool isRunningPaused() => this == TimerStatus.runPaused;

  ///if the timer is resumed
  bool isRunningResumed() => this == TimerStatus.runResumed;

  ///if the timer has ended
  bool isRunningEnded() => this == TimerStatus.runEnded;

  /// if the run session is being added
  bool isSessionBeingAdded() => this == TimerStatus.runSessionAdding;

  /// if the run session was added successfully
  bool isSessionAddedSuccessfully() =>
      this == TimerStatus.runSessionAddedSuccessfully;

  /// if the run session was not added successfully
  bool isSessionAddedUnsuccessfully() =>
      this == TimerStatus.runSessionAddedUnsuccessfully;
}

@freezed

///
class TimerState with _$TimerState {
  ///
  factory TimerState({
    @Default(TimerStatus.fresh) TimerStatus status,
    @Default(false) bool isTimerRunning,
    required ElapsedTimeModel elapsedTimeModel,
    required RunSessionModel runDetailsModel,
  }) = _TimerState;
}
