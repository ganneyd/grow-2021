import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grow_run_v1/features/grow/domain/entities/run_details_entity.dart';

part 'run_details_model.freezed.dart';

///
@freezed
class RunDetailsModel extends RunDetailsEntity with _$RunDetailsModel {
  ///
  factory RunDetailsModel(
      {@Default(0) double latitude,
      @Default(0) double longitude,
      @Default(0) double pace,
      @Default(0) double distance,
      @Default(0) int steps,
      @Default(RunStatus.unknown) RunStatus status}) = _RunDetails;
}
