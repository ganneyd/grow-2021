import 'package:grow_run_v1/core/util/util.dart';

///Child entity represents the child collection stored in firestore
class ChildEntity {
  ///Constructor
  ChildEntity({
    required this.uid,
    required this.username,
    required this.firstname,
    required this.lastname,
    required this.gender,
    required this.dateOfBirth,
    required this.gradeLevel,
    required this.parentID,
    required this.schoolID,
  });

  ///Uid of the child
  final String? uid;

  ///Username that the child uses
  final String username;

  ///Firstname of the child
  final String firstname;

  ///Lastname of the child
  final String lastname;

  ///Gender of the child
  final Gender gender;

  ///Birthday of the child
  final DateTime? dateOfBirth;

  ///Current grade level the child is at
  final int gradeLevel;

  ///The id of the child's parent
  final String parentID;

  ///The id of the school the child is attending
  final String schoolID;
}
