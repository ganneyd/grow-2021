import 'package:flutter/cupertino.dart';
import 'package:grow_run_v1/features/grow/domain/entities/entities_bucket.dart';
import 'package:rive/rive.dart';
import 'package:grow_run_v1/core/util/util.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'background_entity.freezed.dart';

//TODO fix up from json method for image and rivefile
@freezed
class BackgroundEntity with _$BackgroundEntity {
  factory BackgroundEntity(
      {@Default('image') String image,
      @Default('image-description') String description,
      @Default('image-location-poi') String locationPOI,
      @Default('animation-file') String animationFile,
      @Default(0.0) double price}) = _BackgroundEntity;
}
