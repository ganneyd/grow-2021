import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grow_run_v1/features/grow/data/models/run_details_model.dart';
import 'package:grow_run_v1/features/grow/domain/entities/run_daily_stats.dart';
import 'package:grow_run_v1/features/grow/domain/entities/run_details_entity.dart';
part 'run_stats_model.freezed.dart';

@freezed

///
class RunDailyStatsModel extends RunDailyStatsEntity with _$RunDailyStatsModel {
  ///
  factory RunDailyStatsModel({
    required DateTime date,
    @Default(<RunSessionModel>[]) List<RunSessionModel> runSessions,
  }) = _RunDailyStats;
  RunDailyStatsModel._()
      : super(date: DateTime.now(), runSessions: <RunSessionEntity>[]);
}
