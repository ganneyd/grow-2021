import 'package:grow_run_v1/core/util/util.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'clothing_entity.freezed.dart';

@freezed
class ClothingEntity with _$ClothingEntity {
  factory ClothingEntity(
      //TODO fix image  varibale to actually store an image
      {@Default('image') String image,
      @Default('clothing-description') String description,
      @Default(CLOTHING_TYPE.NOT_SPECIFIED) CLOTHING_TYPE type,
      @Default(1) double xpBoostFactor,
      @Default(0) double price}) = _ClothingEntity;
}
