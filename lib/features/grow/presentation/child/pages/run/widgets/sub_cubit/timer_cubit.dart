import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:grow_run_v1/core/error/failures.dart';
import 'package:grow_run_v1/features/grow/data/models/previous/previous_model.dart';
import 'package:grow_run_v1/features/grow/data/models/run_details_model.dart';
import 'package:grow_run_v1/features/grow/data/models/stop_watch/stop_watch_model.dart';
import 'package:grow_run_v1/features/grow/domain/entities/previous/previous_entity.dart';
import 'package:grow_run_v1/features/grow/domain/entities/run_details_entity.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/grow_repository.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/location_repository.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/run/widgets/sub_cubit/timer_state.dart';

///
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

  ///
  late StreamSubscription<ElapsedTimeModel> streamSubscription;

  ///
  late StreamSubscription<RunDetailsModel> runDetailsStreamSubscription;

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
      final List<PreviousModel> previousModels = <PreviousModel>[];
      emit(state.copyWith(
        status: TimerStatus.running,
        isTimerRunning: true,
      ));
      streamSubscription =
          _growRepository.stopWatchStream().listen((ElapsedTimeModel event) {
        emit(state.copyWith(
            runDetailsModel:
                state.runDetailsModel.copyWith(elapsedTime: event)));
      });
      runDetailsStreamSubscription = _locationRepository.runDetailsStream
          .map((RunDetailsEntity runDetailsEntity) => RunDetailsModel(
              previous: PreviousModel(
                  distance: state.runDetailsModel.previous.distance,
                  longitude: runDetailsEntity.previous.longitude,
                  latitude: runDetailsEntity.previous.latitude),
              pace: runDetailsEntity.pace))
          .listen((RunDetailsModel event) {
        if (event.pace > 0.25) {
          previousModels.add(event.previous);
        }
        if (previousModels.length == 5) {
          emit(state.copyWith(
              runDetailsModel: state.runDetailsModel.copyWith(
                  previous: _locationRepository.calculateDistance(
                      lat: state.runDetailsModel.previous.latitude,
                      long: state.runDetailsModel.previous.longitude,
                      previousLatNLong: previousModels))));
          previousModels.clear();
        }
        emit(state.copyWith(runDetailsModel: event));
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
      runDetailsStreamSubscription.pause();
      streamSubscription.pause();
    }
  }

  ///When the user has indicated that the session has ended
  ///proceed to process the collected data
  Future<void> timerResumed() async {
    if (state.status.isRunningPaused()) {
      emit(state.copyWith(status: TimerStatus.runResumed));
      runDetailsStreamSubscription.resume();
      streamSubscription.resume();
    }
  }

  ///When the user has indicated that the session has ended
  ///proceed to process the collected data
  Future<void> timerEnded() async {
    emit(state.copyWith(
      status: TimerStatus.runEnded,
      isTimerRunning: false,
      runDetailsModel: RunDetailsModel(),
    ));
    runDetailsStreamSubscription.cancel();
    streamSubscription.cancel();
  }
}
