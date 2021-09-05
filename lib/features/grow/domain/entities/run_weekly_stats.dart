import 'package:flutter/material.dart';
import 'package:grow_run_v1/features/grow/domain/entities/run_daily_stats.dart';

///Contains the run sessions for any given (7) days week
///[weekDateSpan] represents the date for the first  day and last day
///included in the weekly stat
///[weeklyRunSessions] contains the [RunDailyStats] instances
class RunWeeklyStatsEntity {
  ///Provide the date range the week covers [weekDateSpan]
  ///and the list of [weeklyRunSessions]
  const RunWeeklyStatsEntity({
    required this.weekDateSpan,
    required this.weeklyRunSessions,
  });

  ///The dates the weekly stat covers
  final DateTimeRange weekDateSpan;

  ///the list of the run sessions during the week
  final List<RunDailyStatsEntity> weeklyRunSessions;
}
