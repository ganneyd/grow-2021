import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/widgets/sliver_app_bar_with_shape.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/statistics/cubit/stats_cubit.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/statistics/cubit/stats_state.dart';

class StatsPage extends StatelessWidget {
  const StatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController _myScrollController = ScrollController();
    return BlocProvider<StatsCubit>(
      create: (_) => StatsCubit(),
      child: BlocConsumer<StatsCubit, StatsState>(
        listener: (BuildContext context, StatsState state) {},
        builder: (BuildContext context, StatsState state) {
          return Theme(
              data: ThemeData(accentColor: Theme.of(context).primaryColor),
              child: Scaffold(
                body: CustomScrollView(
                  controller: _myScrollController,
                  slivers: <Widget>[
                    SliverAppBarWithShape(
                        pageName: 'Stats',
                        scrollController: _myScrollController,
                        titleName: 'Goals',
                        backgroundColor: Theme.of(context).primaryColor,
                        background: Align(
                          child: Text('Hey'),
                        ))
                  ],
                ),
              ));
        },
      ),
    );
  }
}
