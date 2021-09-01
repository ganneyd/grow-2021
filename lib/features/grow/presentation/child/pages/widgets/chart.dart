import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

///Chart to display [ChartData]
class Chart<T extends ChartData> extends StatelessWidget {
  ///provide the chart with the chart data
  const Chart({required this.dataList});

  final List<T> dataList;
  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(
        majorGridLines: const MajorGridLines(color: Colors.transparent),
        edgeLabelPlacement: EdgeLabelPlacement.shift,
      ),
      primaryYAxis: NumericAxis(
          isVisible: false,
          axisLine: const AxisLine(width: 0, color: Colors.white),
          majorGridLines: const MajorGridLines(color: Colors.transparent),
          minorGridLines: const MinorGridLines(color: Colors.red)),
      series: <SplineAreaSeries<T, String>>[
        SplineAreaSeries<T, String>(
            borderColor: const Color.fromRGBO(230, 33, 75, 1),
            borderWidth: 3,
            gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Color.fromRGBO(255, 31, 75, 0.5),
                  Colors.white
                ]),
            markerSettings: const MarkerSettings(
                color: Colors.red,
                isVisible: true,
                height: 15,
                width: 15,
                shape: DataMarkerType.circle,
                borderWidth: 3,
                borderColor: Colors.red),
            dataSource: dataList,
            xValueMapper: (T data, _) => data.getXAxisValueName(),
            yValueMapper: (T data, _) => data.getYAxisValue())
      ],
    );
  }
}

///Override this class to provide the chart with data
abstract class ChartData {
  ///returns the x axis name
  String getXAxisValueName();

  ///returns the y axis value
  double getYAxisValue();
}

///Distance chart data that
class DistanceChartData extends ChartData {
  ///Provide the [dateTime] and the [distanceForDay] so
  DistanceChartData({
    required this.distanceForDay,
    required DateTime dateTime,
  }) : day = dateTime.weekday;
  final int day;
  final double distanceForDay;

  @override
  String getXAxisValueName() {
    switch (day) {
      case 1:
        return 'Monday';
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

  @override
  double getYAxisValue() => distanceForDay;
}
