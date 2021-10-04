import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grow_run_v1/features/grow/domain/entities/level_data/level_data_entity.dart';

part 'level_data_model.freezed.dart';

///
@freezed
class LevelDataModel extends LevelDataEntity with _$LevelDataModel {
  ///takes in the [level] and remaining [distance]
  const factory LevelDataModel(
      {@Default(0) double distance, @Default(0) int level}) = _LevelDataModel;
}
