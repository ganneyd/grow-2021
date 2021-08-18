import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grow_run_v1/features/grow/data/models/run_details_model.dart';
import 'package:grow_run_v1/features/grow/data/models/stop_watch/stop_watch_model.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/grow_repository.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/location_repository.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/run/cubit/run_page_cubit.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/run/cubit/run_state.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/run/widgets/sub_cubit/timer_cubit.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/run/widgets/sub_cubit/timer_state.dart';

///When the run page has successfully loaded this is shown
class RunLoadedPage extends StatefulWidget {
  ///
  const RunLoadedPage({required RunPageState runPageState})
      : _runPageState = runPageState,
        super(key: const Key('run-loaded-page'));
  final RunPageState _runPageState;
  @override
  _RunLoadedPageState createState() => _RunLoadedPageState();
}

class _RunLoadedPageState extends State<RunLoadedPage> {
  bool _isUnlocked = true;
  late StreamSubscription<ElapsedTimeModel> streamSubscription;
  late StreamSubscription<RunDetailsModel> runDetsStreamSubscription;
  ElapsedTimeModel elapsedTimeModel = ElapsedTimeModel();
  RunDetailsModel runDetailsModel = RunDetailsModel();
  void lockToggle() {
    setState(() {
      _isUnlocked = !_isUnlocked;
    });
  }

  @override
  void dispose() {
    streamSubscription.cancel();
    runDetsStreamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TimerCubit>(
      create: (_) => TimerCubit(
        locationRepository: context.read<LocationRepository>(),
        growRepository: context.read<GROWRepository>(),
      )..init(context),
      child: BlocConsumer<TimerCubit, TimerState>(
        listener: (BuildContext context, TimerState state) {
          if (state.status.isRunning()) {
            RunDetailsModel runDetailsModels = RunDetailsModel(distance: 46);
            runDetsStreamSubscription =
                state.runDetailsStream!.listen((RunDetailsModel eModel) {
              runDetailsModels = eModel;
            });
            streamSubscription =
                state.timerStream!.listen((ElapsedTimeModel model) {
              setState(() {
                elapsedTimeModel = model;
                runDetailsModel = runDetailsModels;
              });
            });
          }
          if (state.status.isRunningPaused()) {
            streamSubscription.pause();
            runDetsStreamSubscription.pause();
          }
          if (state.status.isRunningResumed()) {
            streamSubscription.resume();
            runDetsStreamSubscription.resume();
          }
          if (state.status.isRunningEnded()) {
            setState(() {
              elapsedTimeModel = ElapsedTimeModel();
            });
            runDetsStreamSubscription.cancel();
            streamSubscription.cancel();
          }
        },
        builder: (BuildContext context, TimerState state) {
          const TextStyle bodyTextStyle = TextStyle(color: Colors.white);
          final TextStyle bodyTextStyle2 =
              TextStyle(color: Theme.of(context).primaryColor);
          return Scaffold(
              backgroundColor: Colors.black,
              appBar: AppBar(
                  backgroundColor: Colors.black,
                  leadingWidth: 100,
                  leading: _getInfoDisplay(
                    mainText: '${runDetailsModel.steps}',
                    subText: 'steps',
                    textColor: Theme.of(context).primaryColor,
                  ),
                  actions: [
                    _getInfoDisplay(
                        mainText: runDetailsModel.latitude.toStringAsFixed(2),
                        subText: 'lat',
                        textColor: Theme.of(context).primaryColor),
                    _getInfoDisplay(
                        mainText: runDetailsModel.longitude.toStringAsFixed(2),
                        subText: 'long',
                        textColor: Theme.of(context).primaryColor),
                    _getInfoDisplay(
                        mainText: '${runDetailsModel.status}',
                        subText: 'status',
                        textColor: Theme.of(context).primaryColor),
                  ],
                  centerTitle: true,
                  title: Visibility(
                    visible: _isUnlocked,
                    replacement: IconButton(
                      splashColor: widget._runPageState.splashColor,
                      icon: const Icon(
                        FontAwesomeIcons.unlockAlt,
                        color: Colors.white,
                      ),
                      onPressed: lockToggle,
                    ),
                    child: IconButton(
                      splashColor: widget._runPageState.splashColor,
                      icon: const Icon(FontAwesomeIcons.lock,
                          color: Colors.white),
                      onPressed: lockToggle,
                    ),
                  )),
              body: Center(
                child: Column(
                  children: [
                    Expanded(
                        child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: Text(
                              runDetailsModel.distance.toStringAsFixed(2),
                              textScaleFactor: 2,
                              maxLines: 2,
                              textWidthBasis: TextWidthBasis.longestLine,
                              style: bodyTextStyle.copyWith(height: 0),
                            ),
                          ),
                          Flexible(
                              child: Text('meters',
                                  textScaleFactor: 4, style: bodyTextStyle2)),
                        ],
                      ),
                    )),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: MaterialButton(
                              onPressed: () =>
                                  context.read<TimerCubit>().timerStarted(),
                              child: Text(
                                'Start',
                                textScaleFactor: 2,
                                style: bodyTextStyle,
                              ),
                            ),
                          ),
                          Expanded(
                            child: MaterialButton(
                              onPressed: () =>
                                  context.read<TimerCubit>().timerPaused(),
                              child: Text(
                                'Pause',
                                textScaleFactor: 2,
                                style: bodyTextStyle,
                              ),
                            ),
                          ),
                          Expanded(
                            child: MaterialButton(
                              onPressed: () =>
                                  context.read<TimerCubit>().timerResumed(),
                              child: Text(
                                'Resume',
                                textScaleFactor: 2,
                                style: bodyTextStyle,
                              ),
                            ),
                          ),
                          Expanded(
                            child: MaterialButton(
                              onPressed: () =>
                                  context.read<TimerCubit>().timerEnded(),
                              child: Text(
                                'End',
                                textScaleFactor: 2,
                                style: bodyTextStyle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Flexible>[
                                Flexible(
                                    child: RichText(
                                        textScaleFactor: 3,
                                        text: TextSpan(
                                            text: elapsedTimeModel.minutes,
                                            children: <TextSpan>[
                                              const TextSpan(
                                                text: ':',
                                              ),
                                              TextSpan(
                                                  text: elapsedTimeModel.seconds
                                                      .padLeft(2, '0')),
                                              const TextSpan(text: '.'),
                                              TextSpan(
                                                  text: elapsedTimeModel
                                                      .milliseconds
                                                      .padLeft(2, '0')),
                                            ]))),
                                Flexible(
                                    child: Text('passed',
                                        textScaleFactor: 2,
                                        style: bodyTextStyle2)),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Flexible(
                                  child: Text(
                                    runDetailsModel.pace.toStringAsFixed(2),
                                    textScaleFactor: 3,
                                    style: bodyTextStyle,
                                  ),
                                ),
                                Flexible(
                                    child: Text('pace',
                                        textScaleFactor: 2,
                                        style: bodyTextStyle2)),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ));
        },
      ),
    );
  }

  Widget _getInfoDisplay(
      {required String mainText,
      required String subText,
      required Color textColor}) {
    return Column(
      children: <Flexible>[
        Flexible(
            child: Text(
          mainText,
          style: TextStyle(color: Colors.white),
        )),
        Flexible(
            child: Text(
          subText,
          style: TextStyle(color: textColor),
        ))
      ],
    );
  }
}
