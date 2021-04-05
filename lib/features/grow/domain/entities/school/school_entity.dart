//Represents the school entity stored in the firestore database
import 'package:grow_run_v1/core/util/util.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
part 'school_entity.freezed.dart';

@freezed
class SchoolEntity with _$SchoolEntity {
  factory SchoolEntity(
      {@Default('school-name') String name,
      @Default('school-address') String address,
      @Default(0) int maxGradeLevel,
      @Default(0) int minGradeLevel,
      @Default(SchoolLevel.primary) SchoolLevel schoolLevel,
      @Default(true) bool isPublic}) = _SchoolEntity;
}
