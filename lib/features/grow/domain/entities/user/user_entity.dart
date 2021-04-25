///Information that belongs to the currently signed in user,
///such as their [email] and [uid]
class UserEntity {
  ///Constructor takes
  ///the [userid]
  ///and [userEmail]
  ///and [name]
  const UserEntity({
    required this.userID,
    required this.userEmail,
    required this.name,
  });

  ///The id for the user
  final String userID;

  ///The user's email
  final String userEmail;

  ///The user's display name
  final String name;

  /// Empty user which represents an unauthenticated user.
  static const UserEntity empty = UserEntity(
    userEmail: '',
    userID: '',
    name: ' ',
  );
}
