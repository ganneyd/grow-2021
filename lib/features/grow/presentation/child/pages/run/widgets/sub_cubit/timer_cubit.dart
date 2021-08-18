import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:grow_run_v1/core/error/failures.dart';
import 'package:grow_run_v1/features/grow/data/models/run_details_model.dart';
import 'package:grow_run_v1/features/grow/domain/entities/run_details_entity.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/grow_repository.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/location_repository.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/run/widgets/sub_cubit/timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  ///
  TimerCubit(
      {required GROWRepository growRepository,
      required LocationRepository locationRepository})
      : _growRepository = growRepository,
        _locationRepository = locationRepository,
        super(TimerState());

  //grow repo
  final GROWRepository _growRepository;
  //location repo
  final LocationRepository _locationRepository;

  Future<void> init(BuildContext context) async {
    Either<Failure, bool> results =
        await _locationRepository.checkPermissions();
    results.fold((l) => Navigator.of(context).pushNamed('/error'), (r) => null);
  }

  ///When the user has indicated that the session has ended
  ///proceed to process the collected data
  Future<void> timerStarted() async {
    if (!state.status.isRunning() && !state.isTimerRunning) {
      emit(state.copyWith(
          status: TimerStatus.running,
          isTimerRunning: true,
          timerStream: _growRepository.stopWatchStream(),
          runDetailsStream: _locationRepository.runDetailsStream.map(
              (RunDetailsEntity runDetailsEntity) => RunDetailsModel(
                  distance: runDetailsEntity.distance,
                  longitude: runDetailsEntity.longitude,
                  latitude: runDetailsEntity.latitude,
                  pace: runDetailsEntity.pace))));
    }
  }

  ///When the user has indicated that the session has ended
  ///proceed to process the collected data
  Future<void> timerPaused() async {
    if (state.status.isRunning() || state.status.isRunningResumed()) {
      emit(state.copyWith(
        status: TimerStatus.runPaused,
      ));
    }
  }

  ///When the user has indicated that the session has ended
  ///proceed to process the collected data
  Future<void> timerResumed() async {
    if (state.status.isRunningPaused()) {
      emit(state.copyWith(status: TimerStatus.runResumed));
    }
  }

  ///When the user has indicated that the session has ended
  ///proceed to process the collected data
  Future<void> timerEnded() async {
    emit(state.copyWith(
      status: TimerStatus.runEnded,
      isTimerRunning: false,
      runDetailsStream: null,
      timerStream: null,
    ));
  }
}
