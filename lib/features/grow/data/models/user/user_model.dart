import 'package:grow_run_v1/features/grow/domain/entities/user/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';

///User Model that the app will be interacting with
///and returned from auth services
@freezed
class UserModel extends UserEntity with _$UserModel {
  ///Constructor
  ///accepts a
  ///       [userId]
  ///       [userEmail]
  const factory UserModel(
      {@Default('no-id') String userID,
      @Default('user-email') String userEmail,
      @Default(UserType.unknown) UserType userType,
      @Default(<String, dynamic>{}) Map<String, dynamic> claims,
      @Default('user-name') String name}) = _UserModel;
}
