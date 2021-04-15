import 'package:grow_run_v1/core/util/util.dart';

///Represents the school entity stored in the firestore database
class SchoolEntity {
  ///
  SchoolEntity({
    required this.uid,
    required this.name,
    required this.address,
    required this.maxGradeLevel,
    required this.minGradeLevel,
    required this.schoolLevel,
    required this.isPublic,
  });

  /// UID of the school
  final String? uid;

  ///Name and Address of the school
  final String name, address;

  ///The Highest and Lowest grade level of the school
  final int maxGradeLevel, minGradeLevel;

  /// the Level the school is at,
  final SchoolLevel schoolLevel;

  ///Whether or not the school is public or private
  final bool isPublic;
}
