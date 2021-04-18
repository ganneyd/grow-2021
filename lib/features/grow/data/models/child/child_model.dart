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
      {@Default('no-id') String? uid,
      @Default('username') String username,
      @Default('firstname') String firstname,
      @Default('lastname') String lastname,
      @Default(Gender.unknown) Gender gender,
      DateTime? dateOfBirth,
      @Default(0) int gradeLevel,
      @Default('no-parentID') String parentID,
      @Default('no-schoolID') String schoolID}) = _ChildModel;

  ///Returns a [Child] from [json] data
  factory Child.fromJson(Map<String, dynamic> json) => _$ChildFromJson(json);

  ///converts the child entity to an child model so that the [toJson]
  ///can be used
  factory Child.toChild(ChildEntity childEntity) => Child(
      uid: childEntity.uid,
      username: childEntity.username,
      firstname: childEntity.firstname,
      lastname: childEntity.lastname,
      gender: childEntity.gender,
      dateOfBirth: childEntity.dateOfBirth,
      gradeLevel: childEntity.gradeLevel,
      parentID: childEntity.parentID,
      schoolID: childEntity.schoolID);

  factory Child.initialChild() => Child();

  factory Child.copyFromJson(Map<String, dynamic> json, Child child) {
    final Child initialJsonChild = Child.fromJson(json);
    return initialJsonChild.copyWith(
      uid: child.uid != initialJsonChild.uid ? child.uid : initialJsonChild.uid,
      username: child.username != initialJsonChild.username
          ? child.username
          : initialJsonChild.username,
      firstname: child.firstname != initialJsonChild.firstname
          ? child.firstname
          : initialJsonChild.firstname,
      lastname: child.lastname != initialJsonChild.lastname
          ? child.lastname
          : initialJsonChild.lastname,
      gender: child.gender != initialJsonChild.gender
          ? child.gender
          : initialJsonChild.gender,
      dateOfBirth: child.dateOfBirth,
      gradeLevel: child.gradeLevel != initialJsonChild.gender
          ? child.gradeLevel
          : initialJsonChild.gradeLevel,
      parentID: child.parentID != initialJsonChild.parentID
          ? child.parentID
          : initialJsonChild.parentID,
      schoolID: child.schoolID != initialJsonChild.schoolID
          ? child.schoolID
          : initialJsonChild.schoolID,
    );
  }
}
