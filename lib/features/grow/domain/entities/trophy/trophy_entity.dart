///This represents a trophy stored in the firestore database

import 'package:grow_run_v1/core/util/util.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'trophy_entity.freezed.dart';
part 'trophy_entity.g.dart';

///TODO implement rive animation and image;
@freezed
class TrophyEntity with _$TrophyEntity {
  const TrophyEntity._();

  factory TrophyEntity(
      {@Default(TROPHY_CATEGORY.UNKNOWN) TROPHY_CATEGORY trophyCategory,
      @Default('trophy-image') String image,
      @Default('trophy-name') String name,
      @Default('trophy-animation') String animation,
      @Default('trophy-description') String description}) = _TrophyEntity;

  factory TrophyEntity.fromJson(Map<String, Object> json) =>
      _$TrophyEntityFromJson(json);
}
