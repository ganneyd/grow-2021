import 'package:grow_run_v1/core/util/util.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'route_entity.freezed.dart';

@freezed
class RouteEntity with _$RouteEntity {
  //TODO implement map varibale
  //final  mapstuff
  factory RouteEntity(
      {DateTime? dateCreated,
      List<DateTime>? datesCompleted,
      @Default(0) int attempts,
      @Default(0) double distance}) = _RouteEntity;
}
