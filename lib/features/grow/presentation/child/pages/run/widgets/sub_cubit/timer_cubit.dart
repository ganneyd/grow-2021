import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:grow_run_v1/core/error/failures.dart';
import 'package:grow_run_v1/features/grow/data/models/previous/previous_model.dart';
import 'package:grow_run_v1/features/grow/data/models/run_details_model.dart';
import 'package:grow_run_v1/features/grow/data/models/stop_watch/stop_watch_model.dart';
import 'package:grow_run_v1/features/grow/data/repositories/location_repositor_implementation.dart';
import 'package:grow_run_v1/features/grow/domain/entities/previous/previous_entity.dart';
import 'package:grow_run_v1/features/grow/domain/entities/run_details_entity.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/grow_repository.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/location_repository.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/run/widgets/sub_cubit/timer_state.dart';

///
class TimerCubit extends Cubit<TimerState> {
  ///
  TimerCubit(
      {required LocationRepository locationRepository,
      required GROWRepository growRepository})
      : _growRepository = growRepository,
        _locationRepository = locationRepository,
        super(TimerState());

  //grow repo
  final GROWRepository _growRepository;
  //location repo
  final LocationRepository _locationRepository;

  ///
  late StreamSubscription<ElapsedTimeModel> streamSubscription;

  ///
  late StreamSubscription<Previous> previousModelStreamSubscription;

  ///The initializer for the cubit
  Future<void> init(BuildContext context) async {
    final Either<Failure, bool> results =
        await _locationRepository.checkPermissions();
    results.fold((l) => Navigator.of(context).pushNamed('/error'), (r) => null);
  }

  ///When the user has indicated that the session has ended
  ///proceed to process the collected data
  Future<void> timerStarted() async {
    if (!state.status.isRunning() && !state.isTimerRunning) {
      final List<double> latList = <double>[-10];
      final List<double> longList = <double>[-10];
      emit(state.copyWith(
        status: TimerStatus.running,
        isTimerRunning: true,
      ));
      streamSubscription =
          _growRepository.stopWatchStream().listen((ElapsedTimeModel event) {
        emit(state.copyWith(elapsedTimeModel: event));
      });
      previousModelStreamSubscription =
          _locationRepository.runDetailsStream.listen((Previous event) {
        if (event.latitude != 0 && event.longitude != 0) {
          longList.add(event.longitude);
          latList.add(event.latitude);
        }
        emit(state.copyWith(
            runDetailsModel: state.runDetailsModel.copyWith(
                distance: event.distance,
                longitudeList: longList,
                latitudeList: latList,
                pace: event.pace)));
      });
    }
  }

  ///When the user has indicated that the session has ended
  ///proceed to process the collected data
  Future<void> timerPaused() async {
    if (state.status.isRunning() || state.status.isRunningResumed()) {
      emit(state.copyWith(
        status: TimerStatus.runPaused,
      ));
      previousModelStreamSubscription.pause();
      streamSubscription.pause();
    }
  }

  ///When the user has indicated that the session has ended
  ///proceed to process the collected data
  Future<void> timerResumed() async {
    if (state.status.isRunningPaused()) {
      emit(state.copyWith(status: TimerStatus.runResumed));
      previousModelStreamSubscription.resume();
      streamSubscription.resume();
    }
  }

  ///When the user has indicated that the session has ended
  ///proceed to process the collected data
  Future<void> timerEnded() async {
    emit(state.copyWith(
      status: TimerStatus.runEnded,
      isTimerRunning: false,
      runDetailsModel: const RunDetailsModel(),
      elapsedTimeModel: const ElapsedTimeModel(),
    ));
    previousModelStreamSubscription.cancel();
    streamSubscription.cancel();
  }
}
