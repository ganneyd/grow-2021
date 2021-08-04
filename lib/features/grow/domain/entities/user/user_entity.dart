///Type of user
enum UserType {
  /// the user entity is a child
  child,

  ///the user entity is a parent
  parent,

  ///if the user type isn't known
  unknown
}

///Extension provides bool methods to determine if the user is of a type
extension UserTypeExtension on UserType {
  ///returns true if the user is a child
  bool isChild() => this == UserType.child;

  ///returns true if the user is a parent
  bool isParent() => this == UserType.parent;

  ///returns true if the user type is  not known
  bool isUnknown() => this == UserType.unknown;
}

///Information that belongs to the currently signed in user,
///such as their [email] and [uid]
class UserEntity {
  ///Constructor takes
  ///the [userID]
  ///and [userEmail]
  ///and [name]
  ///and [claims]
  const UserEntity(
      {required this.userID,
      required this.userEmail,
      required this.name,
      this.claims = const <String, dynamic>{},
      this.userType = UserType.unknown});

  ///The id for the user
  final String userID;

  ///The user's email
  final String userEmail;

  ///The user's display name
  final String name;

  ///The user type
  final UserType userType;

  ///The claims that belong to the user
  final Map<String, dynamic> claims;

  /// Empty user which represents an unauthenticated user.
  static const UserEntity empty = UserEntity(
      userEmail: ' ', userID: ' ', name: ' ', claims: <String, dynamic>{});
}
