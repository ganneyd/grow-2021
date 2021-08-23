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
  runEnded
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
}

@freezed

///
class TimerState with _$TimerState {
  ///
  factory TimerState({
    @Default(TimerStatus.fresh) TimerStatus status,
    @Default(false) bool isTimerRunning,
    @Default(ElapsedTimeModel) ElapsedTimeModel elapsedTimeModel,
    @Default(RunDetailsModel) RunDetailsModel runDetailsModel,
  }) = _TimerState;
}
