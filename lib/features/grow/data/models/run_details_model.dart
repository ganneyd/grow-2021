import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grow_run_v1/features/grow/data/models/previous/previous_model.dart';
import 'package:grow_run_v1/features/grow/data/models/stop_watch/stop_watch_model.dart';
import 'package:grow_run_v1/features/grow/domain/entities/run_details_entity.dart';

part 'run_details_model.freezed.dart';

///
@freezed
class RunDetailsModel extends RunDetailsEntity with _$RunDetailsModel {
  ///
  const factory RunDetailsModel(
      {@Default(<double>[0]) List<double> longitudeList,
      @Default(<double>[0]) List<double> latitudeList,
      @Default(0) double distance,
      @Default(0) double elapsedSeconds,
      @Default(0) double pace,
      @Default(RunStatus.unknown) RunStatus status}) = _RunDetails;
}
