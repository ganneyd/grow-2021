import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grow_run_v1/features/grow/domain/entities/previous/previous_entity.dart';

part 'previous_model.freezed.dart';

///
@freezed
class PreviousModel extends Previous with _$PreviousModel {
  ///
  const factory PreviousModel({
    @Default(0) double longitude,
    @Default(0) double latitude,
    @Default(0) double distance,
    @Default(0) double pace,
  }) = _PreviousModel;
}
