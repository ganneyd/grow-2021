import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grow_run_v1/features/grow/domain/entities/run_details_entity.dart';

part 'run_details_model.freezed.dart';
part 'run_details_model.g.dart';

///
@freezed
class RunSessionModel extends RunSessionEntity with _$RunSessionModel {
  ///
  const factory RunSessionModel(
      {@Default(<double>[0]) List<double> longitudeList,
      @Default(<double>[0]) List<double> latitudeList,
      @Default(0) double distance,
      @Default(0) double duration,
      @Default(0) double pace,
      @Default('') String uid,
      required DateTime timeStamp,
      @Default(RunStatus.unknown) RunStatus status}) = _RunSession;

  ///returns a instance from JSON data
  factory RunSessionModel.fromJson(Map<String, dynamic> json) =>
      _$RunSessionModelFromJson(json);

  ///returns a model instance from a entity instance
  factory RunSessionModel.toRunModel(RunSessionEntity runDetailsEntity) =>
      RunSessionModel(
        uid: runDetailsEntity.uid,
        timeStamp: runDetailsEntity.timeStamp,
        longitudeList: runDetailsEntity.longitudeList,
        latitudeList: runDetailsEntity.latitudeList,
        distance: runDetailsEntity.distance,
        duration: runDetailsEntity.duration,
        pace: runDetailsEntity.pace,
        status: runDetailsEntity.status,
      );
}
