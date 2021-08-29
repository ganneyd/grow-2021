///
enum RunStatus { running, stopped, unknown }

///Provides details about the run, such as the gps coordinates and the pace of
///the user
class RunDetailsEntity {
  ///Takes in [latitude], [longitude] and [pace]
  RunDetailsEntity({
    required this.longitudeList,
    required this.latitudeList,
    required this.distance,
    required this.elapsedSeconds,
    required this.pace,
    required this.status,
    DateTime? timeStamp,
  }) : timeStamp = timeStamp ?? DateTime.now();

  ///List of the GPS longitude points
  final List<double> longitudeList;

  ///List of the GPS longitude points
  final List<double> latitudeList;

  ///the distance ran so far
  final double distance;

  ///the seconds that have elapsed so far
  final double elapsedSeconds;

  ///Pace of the user
  final double pace;

  ///whether the user is walking, stopped or unknown
  final RunStatus status;

  ///when the runsession was recorded
  final DateTime timeStamp;
}
