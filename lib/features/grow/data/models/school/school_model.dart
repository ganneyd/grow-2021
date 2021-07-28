import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grow_run_v1/core/util/util.dart';
import 'package:grow_run_v1/features/grow/domain/entities/school/school_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'school_model.freezed.dart';
part 'school_model.g.dart';

///
///
@freezed
class SchoolModel extends SchoolEntity with _$SchoolModel {
  ///
  factory SchoolModel({
    @Default('no-id') String uid,
    @Default('name') String name,
    @Default('address') String address,
    @Default(0) int minGradeLevel,
    @Default(8) int maxGradeLevel,
    @Default(true) bool isPublic,
    @Default(SchoolLevel.primary) SchoolLevel schoolLevel,
  }) = _SchoolModel;

  ///Converts json data to a school model
  factory SchoolModel.fromJson(Map<String, dynamic> json) =>
      _$SchoolModelFromJson(json);

  ///Converts a school entity to a school model
  factory SchoolModel.toSchoolModel(SchoolEntity schoolEntity) => SchoolModel(
        uid: schoolEntity.uid!,
        name: schoolEntity.name,
        address: schoolEntity.address,
        minGradeLevel: schoolEntity.minGradeLevel,
        maxGradeLevel: schoolEntity.maxGradeLevel,
        isPublic: schoolEntity.isPublic,
        schoolLevel: schoolEntity.schoolLevel,
      );
}
