import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/run/cubit/run_state.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/run/widgets/sub_cubit/timer_cubit.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/run/widgets/sub_cubit/timer_state.dart';
import 'package:grow_run_v1/service_locator.dart';

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
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TimerCubit>(
      create: (_) => serviceLocator<TimerCubit>()..init(context),
      child: BlocConsumer<TimerCubit, TimerState>(
        listener: (BuildContext context, TimerState state) {
          if (state.status.isSessionAddedUnsuccessfully()) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(const SnackBar(
                content: Text("Couldn't add run session."),
                backgroundColor: Colors.red,
              ));
          }
          if (state.status.isSessionAddedSuccessfully()) {
            Navigator.of(context).pushNamed('/child/home');
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                  content: const Text('Added add run session.'),
                  backgroundColor: Theme.of(context).primaryColor));
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
                    mainText: '97865',
                    subText: 'time',
                    textColor: Theme.of(context).primaryColor,
                  ),
                  actions: [
                    _getInfoDisplay(
                        mainText: state.runDetailsModel.latitudeList.last
                            .toStringAsFixed(2),
                        subText: 'lat',
                        textColor: Theme.of(context).primaryColor),
                    _getInfoDisplay(
                        mainText: state.runDetailsModel.longitudeList.last
                            .toStringAsFixed(2),
                        subText: 'long',
                        textColor: Theme.of(context).primaryColor),
                  ],
                  centerTitle: true,
                  title: Visibility(
                    visible: false,
                    replacement: IconButton(
                      onPressed: () {},
                      splashColor: widget._runPageState.splashColor,
                      icon: const Icon(
                        FontAwesomeIcons.unlockAlt,
                        color: Colors.white,
                      ),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      splashColor: widget._runPageState.splashColor,
                      icon: const Icon(FontAwesomeIcons.lock,
                          color: Colors.white),
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
                              state.runDetailsModel.distance.toStringAsFixed(2),
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
                              child: const Text(
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
                                            text: state.elapsedTimeModel.minutes
                                                .toString()
                                                .padLeft(2, '0'),
                                            children: <TextSpan>[
                                              const TextSpan(
                                                text: ':',
                                              ),
                                              TextSpan(
                                                text: state
                                                    .elapsedTimeModel.seconds
                                                    .toString()
                                                    .padLeft(2, '0'),
                                              ),
                                              const TextSpan(text: '.'),
                                              TextSpan(
                                                text: state.elapsedTimeModel
                                                    .milliseconds
                                                    .toString()
                                                    .padLeft(2, '0'),
                                              ),
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
                              children: <Flexible>[
                                Flexible(
                                  child: Text(
                                    state.runDetailsModel.pace
                                        .toStringAsFixed(2),
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
          style: const TextStyle(color: Colors.white),
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
