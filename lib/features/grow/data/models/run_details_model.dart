import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grow_run_v1/features/grow/domain/entities/run_details_entity.dart';

part 'run_details_model.freezed.dart';
part 'run_details_model.g.dart';

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

  ///returns a instance from JSON data
  factory RunDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$RunDetailsModelFromJson(json);

  ///returns a model instance from a entity instance
  factory RunDetailsModel.toRunModel(RunDetailsEntity runDetailsEntity) =>
      RunDetailsModel(
        longitudeList: runDetailsEntity.longitudeList,
        latitudeList: runDetailsEntity.latitudeList,
        distance: runDetailsEntity.distance,
        elapsedSeconds: runDetailsEntity.elapsedSeconds,
        pace: runDetailsEntity.pace,
        status: runDetailsEntity.status,
      );
}
