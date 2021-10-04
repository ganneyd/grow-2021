///Represents the child's level based on the distance they have ran in meters for
// ignore: eol_at_end_of_file
///for every [2,500] meters they have ran.
class LevelDataEntity {
  ///Takes in the remaining  [distance] to complete the current  [level]
  LevelDataEntity({
    required this.distance,
    required this.level,
  });

  ///the remaining distance in meters
  final double distance;

  ///the current level
  final int level;
}
