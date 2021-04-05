import 'package:equatable/equatable.dart';

///Information that belongs to the currently signed in user,
///such as their [email] and [uid]
class UserEntity {
  ///Constructor takes
  ///the [userid]
  ///and [userEmail]
  const UserEntity({
    required this.userID,
    required this.userEmail,
  });

  ///The id for the user
  final String userID;

  ///the type of  user;
  final String userEmail;
}
