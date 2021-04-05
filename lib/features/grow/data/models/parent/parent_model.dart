import 'package:grow_run_v1/features/grow/data/models/models_bucket.dart';
import 'package:grow_run_v1/features/grow/domain/entities/child/child_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grow_run_v1/features/grow/domain/entities/parent/parent_entity.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:grow_run_v1/core/util/util.dart';
part 'parent_model.freezed.dart';
part 'parent_model.g.dart';

///ParentModel
///The app will be interacting with this
@freezed
class ParentModel extends ParentEntity with _$ParentModel {
  ///Constructor
  ///accepts a
  ///          [firstname]
  ///          [lastname]
  ///          [childrenIDs]
  ///          [phoneNumber]
  ///          [dateOfBirth]
  ///          [gender]
  factory ParentModel({
    @Default('no-id') String uid,
    @Default('firstname') String firstname,
    @Default('lastname') String lastname,
    @Default(<String>[]) List<String> childrenIDs,
    //TODO make a phonenumber class
    @Default('0000000000') String phonenumber,
    DateTime? dateOfBirth,
    @Default(Gender.unknown) Gender gender,
  }) = _ParentModel;

  ///Returns a [ParentModel] from [json] data
  factory ParentModel.fromJson(Map<String, dynamic> json) =>
      _$ParentModelFromJson(json);

  ///converts the [ParentEntity] to an [ParentModel] so that the
  ///[toJson()] can be used
  factory ParentModel.toParentModel(ParentEntity parentEntity) => ParentModel(
      firstname: parentEntity.firstname,
      lastname: parentEntity.lastname,
      childrenIDs: parentEntity.childrenIDs,
      phonenumber: parentEntity.phonenumber,
      dateOfBirth: parentEntity.dateOfBirth,
      gender: parentEntity.gender);
}
