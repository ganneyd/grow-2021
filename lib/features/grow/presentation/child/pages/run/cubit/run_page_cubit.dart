import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:grow_run_v1/core/error/failures.dart';
import 'package:grow_run_v1/core/util/build_info.dart';
import 'package:grow_run_v1/features/grow/data/models/stop_watch/stop_watch_model.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/grow_repository.dart';

import 'run_state.dart';

///The leaderboard page cubit
class RunPageCubit extends Cubit<RunPageState> {
  ///
  RunPageCubit({required GROWRepository growRepository})
      : _growRepository = growRepository,
        super(RunPageState());

  //grow repo
  final GROWRepository _growRepository;

  ///Page just got routed tos
  ///necessary data are loaded and provided to the page
  Future<void> init() async {
    emit(state.copyWith(status: RunPageStatus.processing));
    final Either<Failure, BuildInfo> buildInfoResult =
        await _growRepository.getBuildInfo();

    await Future<void>.delayed(const Duration(seconds: 3));
    buildInfoResult.fold(
        (_) => emit(state.copyWith(status: RunPageStatus.loadedUnsuccessfully)),
        (BuildInfo buildInfo) => emit(state.copyWith(
            splashColor: buildInfo.isAndroid ? null : Colors.transparent,
            buildInfo: buildInfo,
            status: RunPageStatus.processSuccessfully)));
  }
}
