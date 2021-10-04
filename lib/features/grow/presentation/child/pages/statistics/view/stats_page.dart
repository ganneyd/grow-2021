import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/widgets/chart.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/widgets/date_slider.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/widgets/sliver_app_bar_with_shape.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/statistics/cubit/stats_cubit.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/statistics/cubit/stats_state.dart';
import 'package:grow_run_v1/features/grow/presentation/pages/splash_page.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
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
            return Scaffold(
                appBar: AppBar(), body: Center(child: Text(state.errMsg)));
          } else if (state.status.loadedSuccessfully() &&
              state.chartList.isNotEmpty) {
            return Theme(
                data: ThemeData(
                    colorScheme: ColorScheme.fromSwatch()
                        .copyWith(secondary: Theme.of(context).primaryColor)),
                child: Scaffold(
                  body: CustomScrollView(
                    controller: _myScrollController,
                    slivers: <Widget>[
                      SliverAppBarWithShape(
                          slider: DateSlider(
                            numberOfDays: state.numberOfDays,
                            dateCallback: (index) =>
                                context.read<StatsCubit>().dateChanged(index),
                          ),
                          pageName: 'Stats',
                          scrollController: _myScrollController,
                          titleName: 'Goals',
                          backgroundColor: Theme.of(context).primaryColor,
                          background: LayoutBuilder(
                            builder: (
                              BuildContext context,
                              BoxConstraints constraints,
                            ) {
                              final double radialWidth =
                                  .4 % constraints.maxHeight;
                              return SizedBox(
                                height: .4 * constraints.maxHeight,
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: SfRadialGauge(
                                        axes: <RadialAxis>[
                                          // Create primary radial axis
                                          RadialAxis(
                                            showLabels: false,
                                            showTicks: false,
                                            startAngle: 270,
                                            endAngle: 270,
                                            radiusFactor: radialWidth,
                                            axisLineStyle: const AxisLineStyle(
                                              thickness: 0.2,
                                              color:
                                                  Color.fromRGBO(41, 55, 62, 1),
                                              thicknessUnit:
                                                  GaugeSizeUnit.factor,
                                            ),
                                            pointers: <GaugePointer>[
                                              RangePointer(
                                                value: state.levelDataModel
                                                        .distance /
                                                    25,
                                                width: 0.05,
                                                pointerOffset: 0.07,
                                                sizeUnit: GaugeSizeUnit.factor,
                                              )
                                            ],
                                          ),
                                          // Create secondary radial axis for segmented line
                                          RadialAxis(
                                            interval: 1,
                                            maximum: 4,
                                            showLabels: false,
                                            showAxisLine: false,
                                            tickOffset: -0.05,
                                            offsetUnit: GaugeSizeUnit.factor,
                                            minorTicksPerInterval: 0,
                                            startAngle: 270,
                                            endAngle: 270,
                                            radiusFactor: radialWidth,
                                            majorTickStyle: MajorTickStyle(
                                              length: 0.3,
                                              thickness: 3,
                                              lengthUnit: GaugeSizeUnit.factor,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Column(children: [
                                        Flexible(
                                          child: Text(
                                            state.levelDataModel.level
                                                .toString(),
                                          ),
                                        ),
                                        Flexible(
                                          child: Text(state
                                              .levelDataModel.distance
                                              .toString()),
                                        ),
                                        Flexible(
                                          child: Text((state
                                                      .levelDataModel.distance *
                                                  state.levelDataModel.level)
                                              .toString()),
                                        ),
                                      ]),
                                    ),
                                  ],
                                ),
                              );
                            },
                          )),
                      SliverList(delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                        if (index < state.chartList.length) {
                          return Chart<DailyChartData>(
                              dataList: state.chartList[index]);
                        }
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
