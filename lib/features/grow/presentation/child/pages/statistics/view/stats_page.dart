import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/widgets/chart.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/widgets/sliver_app_bar_with_shape.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/statistics/cubit/stats_cubit.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/statistics/cubit/stats_state.dart';
import 'package:grow_run_v1/features/grow/presentation/pages/splash_page.dart';

import '../../../../../../../service_locator.dart';

class StatsPage extends StatelessWidget {
  const StatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController _myScrollController = ScrollController();
    return BlocProvider<StatsCubit>(
      create: (_) => serviceLocator<StatsCubit>()..init(),
      child: BlocConsumer<StatsCubit, StatsState>(
        listener: (BuildContext context, StatsState state) {},
        builder: (BuildContext context, StatsState state) {
          if (state.status.isLoading()) {
            return SplashPage();
          } else if (state.status.loadedUnsuccessfully()) {
            return Text(state.errMsg);
          } else if (state.status.loadedSuccessfully() &&
              state.distanceStatsList.isNotEmpty) {
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
                            child: Text(state.status.toString()),
                          )),
                      SliverList(delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                        return Chart<DistanceChartData>(
                          dataList: state.distanceStatsList,
                        );
                      }))
                    ],
                  ),
                ));
          }
          return Text(state.status.toString());
        },
      ),
    );
  }
}
