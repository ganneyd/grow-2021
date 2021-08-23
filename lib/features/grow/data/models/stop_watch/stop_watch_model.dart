import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grow_run_v1/features/grow/domain/entities/stop_watch_entity.dart';

part 'stop_watch_model.freezed.dart';

///Class that handles elapsed time
@freezed
class ElapsedTimeModel extends ElapsedTimeEntity with _$ElapsedTimeModel {
  ///Constructor
  ///accepts
  ///
  ///[hours],
  ///[minutes],
  ///[seconds],
  ///[milliseconds]
  const factory ElapsedTimeModel({
    @Default(0) int hours,
    @Default(0) int minutes,
    @Default(0) int seconds,
    @Default(0) int milliseconds,
  }) = _ElapsedTimeModel;
}
