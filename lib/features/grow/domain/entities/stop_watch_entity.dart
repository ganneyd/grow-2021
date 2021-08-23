///Represents how much time has elapsed
class ElapsedTimeEntity {
  ///Takes the [hours] ,[minutes] , [seconds], and [milliseconds]
  const ElapsedTimeEntity(
      {required this.hours,
      required this.minutes,
      required this.seconds,
      required this.milliseconds});

  ///The amount of [hours] ,[minutes] , [seconds], and [milliseconds] that
  ///has elapsed
  final int hours, seconds, minutes, milliseconds;
}
