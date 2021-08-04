import 'package:grow_run_v1/features/grow/data/models/school/school_model.dart';
import 'package:grow_run_v1/features/grow/domain/entities/child/child_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:grow_run_v1/core/util/util.dart';
part 'child_model.freezed.dart';
part 'child_model.g.dart';

//Child Model
///Child model that the app will be interacting with
@freezed
class Child extends ChildEntity with _$Child {
  ///Constructor
  ///accepts a [username]
  ///          [firstname]
  ///          [lastname]
  ///          [gender]
  ///          [dateTime]
  ///         [gradeLevel]
  ///         [parentID]
  ///         [schoolID]
  factory Child(
      {@Default('username') String username,
      @Default('firstname') String firstname,
      @Default('lastname') String lastname,
      @Default(Gender.unknown) Gender gender,
      DateTime? dateOfBirth,
      @Default(0) int gradeLevel,
      @Default('no-schoolID') String schoolID}) = _ChildModel;

  ///Returns a [Child] from [json] data
  factory Child.fromJson(Map<String, dynamic> json) => _$ChildFromJson(json);

  ///converts the child entity to an child model so that the [toJson]
  ///can be used
  factory Child.toChild(ChildEntity childEntity) => Child(
      username: childEntity.username,
      firstname: childEntity.firstname,
      lastname: childEntity.lastname,
      gender: childEntity.gender,
      dateOfBirth: childEntity.dateOfBirth,
      gradeLevel: childEntity.gradeLevel,
      schoolID: childEntity.schoolID);

  factory Child.initialChild() => Child();

  factory Child.copyFromJson(Map<String, dynamic> json, Child initChild) {
    final Child formChild = Child.fromJson(json);
    print('Init child username is ${initChild.username}');
    print('form child username is ${formChild.username}');
    final Child newChild = initChild.copyWith(
      username: formChild.username != Child.initialChild().username
          ? formChild.username
          : initChild.username,
      firstname: formChild.firstname != Child.initialChild().firstname
          ? formChild.firstname
          : initChild.firstname,
      lastname: formChild.lastname != Child.initialChild().lastname
          ? formChild.lastname
          : initChild.lastname,
      gender: formChild.gender != Child.initialChild().gender
          ? formChild.gender
          : initChild.gender,
      dateOfBirth: formChild.dateOfBirth != Child.initialChild().dateOfBirth
          ? formChild.dateOfBirth
          : initChild.dateOfBirth,
      gradeLevel: formChild.gradeLevel != Child.initialChild().gradeLevel
          ? formChild.gradeLevel
          : initChild.gradeLevel,
      schoolID: formChild.schoolID != Child.initialChild().schoolID
          ? formChild.schoolID
          : initChild.schoolID,
    );

    return newChild;
  }
}
