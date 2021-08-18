import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/grow_repository.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/run/cubit/run_page_cubit.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/run/cubit/run_state.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/run/widgets/run_page_loaded_body.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/run/widgets/stop_watch.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/run/widgets/test_watch.dart';

///The page that shows when the user is actively running
class RunPage extends StatefulWidget {
  ///
  RunPage() : super(key: const Key('child-run-page'));

  @override
  _RunPageState createState() => _RunPageState();
}

class _RunPageState extends State<RunPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RunPageCubit>(
        create: (_) =>
            RunPageCubit(growRepository: context.read<GROWRepository>())
              ..init(),
        child: BlocConsumer<RunPageCubit, RunPageState>(
          listener: (BuildContext context, RunPageState state) {},
          builder: (BuildContext context, RunPageState state) {
            return RunLoadedPage(runPageState: state);
            // if (state.timerStarted) {
            //   return RunPage();
            // }
            // if (state.buildInfo.isAndroid) {
            //   return const CircularProgressIndicator();
            // }

            // return const CupertinoActivityIndicator();
          },
        ));
  }
}
