import 'entities_bucket.dart';

///Represents a child user and all their possible attributes
class ChildUserEntity {
  ///Takes a [childEntity] and [schoolModel]
  ChildUserEntity(
      {required this.childEntity,
      required this.schoolEntity,
      required this.parentEntity,
      required this.email,
      required this.uid});

  final ChildEntity childEntity;
  final SchoolEntity schoolEntity;
  final String uid;
  final String email;
  final ParentEntity parentEntity;
}
