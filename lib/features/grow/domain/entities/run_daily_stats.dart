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
}
