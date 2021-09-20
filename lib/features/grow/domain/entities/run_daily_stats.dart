import 'package:grow_run_v1/features/grow/domain/entities/run_details_entity.dart';

///Represents a user's stats
class RunDailyStatsEntity {
  ///The [date] shouldn't be null
  ///[RunStatsEntity] stats might be empty as represented by the [runSessions]
  ///being empty

  const RunDailyStatsEntity({
    required this.date,
    required this.runSessions,
  });

  ///The  date the run sessions were taken
  final DateTime date;

  ///List of run sessions for the specified [date]
  final List<RunSessionEntity> runSessions;

  ///returns the total distance covered by the sessions
  double getDistance() {
    double distance = 0;
    if (runSessions.isNotEmpty) {
      for (final RunSessionEntity runSessionEntity in runSessions) {
        distance += runSessionEntity.distance;
      }
    }
    return distance;
  }

  double getMaxDistance() {
    double max = 0;
    for (final RunSessionEntity runSessionEntity in runSessions) {
      if (runSessionEntity.distance > max) {
        max = runSessionEntity.distance;
      }
    }
    return max;
  }

  double getAvgPace() {
    double avgPace = 0;
    if (runSessions.isNotEmpty) {
      for (final RunSessionEntity runSessionEntity in runSessions) {
        avgPace += runSessionEntity.pace;
      }
      avgPace /= runSessions.length;
    }
    return avgPace;
  }

  double getMaxPace() {
    double maxPace = 0;
    for (final RunSessionEntity runSessionEntity in runSessions) {
      if (runSessionEntity.pace > maxPace) {
        maxPace = runSessionEntity.pace;
      }
    }
    return maxPace;
  }

  int getNumRunSessions() {
    return runSessions.length;
  }

  double getDuration() {
    return 0;
  }
}
