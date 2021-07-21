/// Gender types [Gender.male] is for males [Gender.female]  is for females
/// [unkown] if the user has gender isn't know as yet and [not_specified]  if
/// the user opt of out specifying their gender
enum Gender { male, female, unknown, not_specified }

///provides methods to return whether or not the gender is of a certain type
extension GenderExtension on Gender {
  ///returns true if the gender type is [male]
  bool isMale() => this == Gender.male;

  ///returns true of the gender type is [femlae]
  bool isFemale() => this == Gender.female;
}
