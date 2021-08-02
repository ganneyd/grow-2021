import 'package:grow_run_v1/core/util/util.dart';
import '../entity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'goal_entity.freezed.dart';

@freezed

///
class GoalEntity with _$GoalEntity {
  ///
  factory GoalEntity(
      {@Default(GOAL_OCCURANCE.unknown) GOAL_OCCURANCE goalOccurance,
      @Default(GOAL_TYPE.unknown) GOAL_TYPE goalType,
      @Default('goal-name') String name,
      @Default('goal-description') String description,
      List<DateTime>? dateCompleted,
      DateTime? dateMade,
      @Default(0) double threshold}) = _GoalEntity;
}
