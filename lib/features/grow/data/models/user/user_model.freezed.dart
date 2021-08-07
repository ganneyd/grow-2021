// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UserModelTearOff {
  const _$UserModelTearOff();

  _UserModel call(
      {String userID = 'no-id',
      String userEmail = 'user-email',
      UserType userType = UserType.unknown,
      Map<String, dynamic> claims = const <String, dynamic>{},
      String name = 'user-name'}) {
    return _UserModel(
      userID: userID,
      userEmail: userEmail,
      userType: userType,
      claims: claims,
      name: name,
    );
  }
}

/// @nodoc
const $UserModel = _$UserModelTearOff();

/// @nodoc
mixin _$UserModel {
  String get userID => throw _privateConstructorUsedError;
  String get userEmail => throw _privateConstructorUsedError;
  UserType get userType => throw _privateConstructorUsedError;
  Map<String, dynamic> get claims => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res>;
  $Res call(
      {String userID,
      String userEmail,
      UserType userType,
      Map<String, dynamic> claims,
      String name});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res> implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  final UserModel _value;
  // ignore: unused_field
  final $Res Function(UserModel) _then;

  @override
  $Res call({
    Object? userID = freezed,
    Object? userEmail = freezed,
    Object? userType = freezed,
    Object? claims = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      userID: userID == freezed
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
      userEmail: userEmail == freezed
          ? _value.userEmail
          : userEmail // ignore: cast_nullable_to_non_nullable
              as String,
      userType: userType == freezed
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as UserType,
      claims: claims == freezed
          ? _value.claims
          : claims // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(
          _UserModel value, $Res Function(_UserModel) then) =
      __$UserModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String userID,
      String userEmail,
      UserType userType,
      Map<String, dynamic> claims,
      String name});
}

/// @nodoc
class __$UserModelCopyWithImpl<$Res> extends _$UserModelCopyWithImpl<$Res>
    implements _$UserModelCopyWith<$Res> {
  __$UserModelCopyWithImpl(_UserModel _value, $Res Function(_UserModel) _then)
      : super(_value, (v) => _then(v as _UserModel));

  @override
  _UserModel get _value => super._value as _UserModel;

  @override
  $Res call({
    Object? userID = freezed,
    Object? userEmail = freezed,
    Object? userType = freezed,
    Object? claims = freezed,
    Object? name = freezed,
  }) {
    return _then(_UserModel(
      userID: userID == freezed
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
      userEmail: userEmail == freezed
          ? _value.userEmail
          : userEmail // ignore: cast_nullable_to_non_nullable
              as String,
      userType: userType == freezed
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as UserType,
      claims: claims == freezed
          ? _value.claims
          : claims // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UserModel implements _UserModel {
  const _$_UserModel(
      {this.userID = 'no-id',
      this.userEmail = 'user-email',
      this.userType = UserType.unknown,
      this.claims = const <String, dynamic>{},
      this.name = 'user-name'});

  @JsonKey(defaultValue: 'no-id')
  @override
  final String userID;
  @JsonKey(defaultValue: 'user-email')
  @override
  final String userEmail;
  @JsonKey(defaultValue: UserType.unknown)
  @override
  final UserType userType;
  @JsonKey(defaultValue: const <String, dynamic>{})
  @override
  final Map<String, dynamic> claims;
  @JsonKey(defaultValue: 'user-name')
  @override
  final String name;

  @override
  String toString() {
    return 'UserModel(userID: $userID, userEmail: $userEmail, userType: $userType, claims: $claims, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserModel &&
            (identical(other.userID, userID) ||
                const DeepCollectionEquality().equals(other.userID, userID)) &&
            (identical(other.userEmail, userEmail) ||
                const DeepCollectionEquality()
                    .equals(other.userEmail, userEmail)) &&
            (identical(other.userType, userType) ||
                const DeepCollectionEquality()
                    .equals(other.userType, userType)) &&
            (identical(other.claims, claims) ||
                const DeepCollectionEquality().equals(other.claims, claims)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(userID) ^
      const DeepCollectionEquality().hash(userEmail) ^
      const DeepCollectionEquality().hash(userType) ^
      const DeepCollectionEquality().hash(claims) ^
      const DeepCollectionEquality().hash(name);

  @JsonKey(ignore: true)
  @override
  _$UserModelCopyWith<_UserModel> get copyWith =>
      __$UserModelCopyWithImpl<_UserModel>(this, _$identity);
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
      {String userID,
      String userEmail,
      UserType userType,
      Map<String, dynamic> claims,
      String name}) = _$_UserModel;

  @override
  String get userID => throw _privateConstructorUsedError;
  @override
  String get userEmail => throw _privateConstructorUsedError;
  @override
  UserType get userType => throw _privateConstructorUsedError;
  @override
  Map<String, dynamic> get claims => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UserModelCopyWith<_UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}
