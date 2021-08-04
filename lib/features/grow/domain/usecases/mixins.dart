import 'package:grow_run_v1/features/grow/domain/entities/parent/parent_entity.dart';

///Returns a parent entity with id
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
