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
    @Default('00') String hours,
    @Default('00') String minutes,
    @Default('00') String seconds,
    @Default('00') String milliseconds,
  }) = _ElapsedTimeModel;
}
