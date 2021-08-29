///Represents a user's stats
class RunStatsEntity {
  ///The [startDate] shoouldn't be null
  ///if the [endDate] is not null then the instance of
  ///[RunStatsEntity] stats spans from [startDate] to [endDate]
  ///the [statValue] is the numerical value of this stat, and
  ///[statName] is the name of the stat
  const RunStatsEntity(
      {required this.startDate,
      this.endDate,
      required this.statValue,
      required this.statName});

  ///The start date of the stats
  final DateTime startDate;

  ///the end date of the state date range
  final DateTime? endDate;

  ///The Sats value
  ///time is always in milliseconds
  ///distance is always in meters
  ///pace is alwasys in meters per second
  ///runs is how many runs the user has done for a given
  ///date range or date
  final double statValue;

  ///Name of the stat
  final String statName;
}
