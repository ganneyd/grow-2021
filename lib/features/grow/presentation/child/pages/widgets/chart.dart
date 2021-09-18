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
      primaryXAxis: CategoryAxis(
        arrangeByIndex: true,
        // majorGridLines: const MajorGridLines(color: Colors.transparent),
        edgeLabelPlacement: EdgeLabelPlacement.shift,
        title: AxisTitle(text: dataList[0].chartName),
      ),
      primaryYAxis: NumericAxis(

          ///isVisible: false,
          axisLine: const AxisLine(width: 5, color: Colors.grey),
          majorGridLines: const MajorGridLines(color: Colors.grey),
          minorGridLines: const MinorGridLines(color: Colors.grey)),
      series: <SplineAreaSeries<T, String>>[
        SplineAreaSeries<T, String>(
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
        return 'Mon';
      case 2:
        return 'Tues';
      case 3:
        return 'Weds';
      case 4:
        return 'Thurs';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';
      default:
        return 'Unknown';
    }
  }

  ///returns the y axis value
  double getYAxisValue() => value;

  ///
  bool isHighlighted() => DateTime.now() == dateTime;
}
