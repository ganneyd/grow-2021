import 'package:grow_run_v1/core/util/util.dart';
import 'package:grow_run_v1/features/grow/data/models/child/child_model.dart';
import 'package:grow_run_v1/features/grow/data/models/parent/parent_model.dart';
import 'package:grow_run_v1/features/grow/data/models/school/school_model.dart';
import 'package:grow_run_v1/features/grow/domain/entities/child_user_entity.dart';
import 'package:grow_run_v1/features/grow/domain/entities/entities_bucket.dart';

class ChildUserModel extends ChildUserEntity {
  ///
  ChildUserModel({
    required Child child,
    required String uid,
    required String email,
    required SchoolModel schoolModel,
    required ParentModel parentModel,
  }) : super(
            email: email,
            childEntity: child,
            uid: uid,
            schoolEntity: schoolModel,
            parentEntity: parentModel);

  ChildUserModel copyWith({
    //Child params
    String? childUsername,
    String? childFirstname,
    String? childLastname,
    String? childSchoolId,
    Gender? childGender,
    int? childGradeLevel,
    DateTime? childDateOfBirth,
    //School Model Params
    String? schoolName,
    String? schoolAddress,
    SchoolLevel? schoolLevel,
    bool? schoolIsPublic,
    int? schoolMinGradeLevel,
    int? schoolMaxGradeLevel,
    //Parent's params
    String? parentFirstName,
    String? parentLastName,
    String? phoneNumber,
    DateTime? parentDateOfBirth,
    Gender? parentGender,
    String? childEmail,
  }) =>
      ChildUserModel(
          email: childEmail ?? email,
          child: Child(
            username: childUsername ?? childEntity.username,
            firstname: childFirstname ?? childEntity.firstname,
            lastname: childLastname ?? childEntity.lastname,
            schoolID: childSchoolId ?? childEntity.schoolID,
            gender: childGender ?? childEntity.gender,
            gradeLevel: childGradeLevel ?? childEntity.gradeLevel,
            dateOfBirth: childDateOfBirth ?? childEntity.dateOfBirth,
          ),
          uid: uid,
          schoolModel: SchoolModel(
              address: schoolAddress ?? schoolEntity.address,
              uid: schoolEntity.uid!,
              isPublic: schoolIsPublic ?? schoolEntity.isPublic,
              maxGradeLevel: schoolMaxGradeLevel ?? schoolEntity.maxGradeLevel,
              minGradeLevel: schoolMinGradeLevel ?? schoolEntity.minGradeLevel,
              name: schoolName ?? schoolEntity.name),
          parentModel: ParentModel(
              firstname: parentFirstName ?? parentEntity.firstname,
              lastname: parentLastName ?? parentEntity.lastname,
              phonenumber: phoneNumber ?? parentEntity.phonenumber,
              gender: parentGender ?? parentEntity.gender,
              dateOfBirth: parentDateOfBirth ?? parentEntity.dateOfBirth));
}
