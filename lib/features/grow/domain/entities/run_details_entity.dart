import 'package:pedometer/pedometer.dart';

enum RunStatus { running, stopped, unknown }

///Provides details about the run, such as the gps coordinates and the pace of
///the user
class RunDetailsEntity {
  ///Takes in [latitude], [longitude] and [pace]
  const RunDetailsEntity(
      {required this.latitude,
      required this.longitude,
      required this.pace,
      required this.distance,
      required this.status,
      required this.steps});

  ///GPS LAt
  final double latitude;

  ///GPS LONG
  final double longitude;

  ///Pace of the user
  final double pace;

  ///the distance covered so far
  final double distance;

  ///whether the user is walking, stopped or unknown
  final RunStatus status;

  ///the amount of steps the user has taken
  final int steps;
}
