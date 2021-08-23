///The previous values of objects
class Previous {
  ///
  Previous(
      {required this.distance,
      required this.pace,
      required this.latitude,
      required this.longitude});

  ///the previous longitude
  final double longitude;

  /// the previous longitude
  final double latitude;

  ///the previous latitude
  final double distance;

  ///the pace of the user+
  final double pace;
}
