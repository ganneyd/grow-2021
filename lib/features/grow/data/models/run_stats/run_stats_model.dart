import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grow_run_v1/features/grow/domain/entities/run_stats.dart';
part 'run_stats_model.freezed.dart';

@freezed
class RunStatsModel extends RunStatsEntity with _$RunStatsModel {
  ///
  factory RunStatsModel({
    required DateTime startDate,
    DateTime? endDate,
    @Default(0.0) double statValue,
    @Default('no-name') String statName,
  }) = _RunStats;
}
