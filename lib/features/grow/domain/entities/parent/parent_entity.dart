import 'package:grow_run_v1/core/util/util.dart';

///Represents the parent entity stored in the firestore database
class ParentEntity {
  ///Constructor
  ParentEntity(
      {required this.uid,
      required this.firstname,
      required this.lastname,
      required this.childrenIDs,
      required this.phonenumber,
      required this.dateOfBirth,
      required this.gender});

  ///Parent's user id
  final String? uid;

  ///Parent's firstname
  final String firstname;

  ///Parent's lastname
  final String lastname;

  ///List of the parent's children IDs
  final List<String> childrenIDs;

  ///Parent's phonenumber
  final String phonenumber;

  ///Parent's gender
  final Gender gender;

  ///Parent's birthday
  final DateTime? dateOfBirth;
}
