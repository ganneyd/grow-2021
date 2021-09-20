import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

///Chart to display [ChartData]
class Chart<T extends DailyChartData> extends StatelessWidget {
  ///provide the chart with the chart data
  const Chart(
      {Color primaryColor = const Color.fromRGBO(144, 223, 43, 1),
      Color complimentaryColor = Colors.black,
      required this.dataList})
      : _primaryColor = primaryColor,
        _complimentaryColor = complimentaryColor;

  final List<T> dataList;
  final Color _primaryColor;
  final Color _complimentaryColor;
  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      plotAreaBorderColor: Colors.transparent,
      borderColor: Colors.transparent,
      borderWidth: 0,
      primaryXAxis: CategoryAxis(
        labelStyle: Theme.of(context).textTheme.headline6,
        arrangeByIndex: true,
        majorGridLines: const MajorGridLines(color: Colors.transparent),
        edgeLabelPlacement: EdgeLabelPlacement.shift,
        title: AxisTitle(text: dataList[0].chartName),
      ),
      primaryYAxis: NumericAxis(
          labelStyle: Theme.of(context).textTheme.headline6,
          minimum: 0,
          decimalPlaces: 0,
          anchorRangeToVisiblePoints: true,
          desiredIntervals: 5,
          rangePadding: ChartRangePadding.additional,
          isVisible: false,
          axisLine: const AxisLine(width: 0, color: Colors.transparent),
          majorGridLines: const MajorGridLines(color: Colors.transparent),
          minorGridLines: const MinorGridLines(color: Colors.transparent)),
      series: <SplineAreaSeries<T, String>>[
        SplineAreaSeries<T, String>(
            enableTooltip: true,
            onPointTap: (ChartPointDetails details) {
              print(
                  'This is the point series index ${details.seriesIndex}, and its point index: ${details.pointIndex} ');
            },
            borderColor: _complimentaryColor.withOpacity(0.65),
            borderWidth: 3,
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  _primaryColor
                    ..withOpacity(0.5)
                    ..withAlpha(150),
                  Colors.white
                ]),
            markerSettings: MarkerSettings(
                color: _complimentaryColor,
                isVisible: true,
                height: 15,
                width: 15,
                shape: DataMarkerType.circle,
                borderWidth: 3,
                borderColor: _complimentaryColor),
            dataSource: dataList,
            xValueMapper: (T data, _) => data.getXAxisValueName(),
            yValueMapper: (T data, _) => data.getYAxisValue())
      ],
    );
  }
}

///Override this class to provide the chart with data
class DailyChartData {
  ///[dateTime] is used to determine the day of the week the caculated stat
  ///belongs to
  ///[value] is the quantitative value for the statistic
  ///[chartName] is the name given to chart being displayed
  DailyChartData(
      {required this.dateTime, required this.value, required this.chartName});

  ///Date time for the stat
  final DateTime dateTime;

  ///qunatitative value for the stat
  final double value;

  ///the chart's name
  final String chartName;

  ///returns the x axis name
  String getXAxisValueName() {
    switch (dateTime.weekday) {
      case 1:
        return 'M';
      case 2:
        return 'T';
      case 3:
        return 'W';
      case 4:
        return 'T';
      case 5:
        return 'F';
      case 6:
        return 'S';
      case 7:
        return 'S';
      default:
        return 'Unknown';
    }
  }

  ///returns the y axis value
  double getYAxisValue() => value;

  ///
  bool isHighlighted() => DateTime.now() == dateTime;
}
