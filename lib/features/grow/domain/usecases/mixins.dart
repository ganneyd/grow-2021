import 'package:grow_run_v1/features/grow/domain/entities/child/child_entity.dart';
import 'package:grow_run_v1/features/grow/domain/entities/parent/parent_entity.dart';

ChildEntity toChilEntityWithID(ChildEntity child, String id) {
  return ChildEntity(
      uid: id,
      username: child.username,
      firstname: child.firstname,
      lastname: child.lastname,
      gender: child.gender,
      dateOfBirth: child.dateOfBirth,
      gradeLevel: child.gradeLevel,
      parentID: child.parentID,
      schoolID: child.schoolID);
}

ParentEntity toParentEntityWithID(ParentEntity parent, String id) {
  return ParentEntity(
      uid: id,
      firstname: parent.firstname,
      lastname: parent.lastname,
      childrenIDs: parent.childrenIDs,
      phonenumber: parent.phonenumber,
      dateOfBirth: parent.dateOfBirth,
      gender: parent.gender);
}
