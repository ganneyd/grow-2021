// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'child_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Child _$ChildFromJson(Map<String, dynamic> json) {
  return _ChildModel.fromJson(json);
}

/// @nodoc
class _$ChildTearOff {
  const _$ChildTearOff();

  _ChildModel call(
      {String uid = 'no-id',
      String username = 'username',
      String firstname = 'firstname',
      String lastname = 'lastname',
      Gender gender = Gender.unknown,
      DateTime? dateOfBirth,
      int gradeLevel = 0,
      String parentID = 'no-parentID',
      String schoolID = 'no-schoolID'}) {
    return _ChildModel(
      uid: uid,
      username: username,
      firstname: firstname,
      lastname: lastname,
      gender: gender,
      dateOfBirth: dateOfBirth,
      gradeLevel: gradeLevel,
      parentID: parentID,
      schoolID: schoolID,
    );
  }

  Child fromJson(Map<String, Object> json) {
    return Child.fromJson(json);
  }
}

/// @nodoc
const $Child = _$ChildTearOff();

/// @nodoc
mixin _$Child {
  String get uid => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get firstname => throw _privateConstructorUsedError;
  String get lastname => throw _privateConstructorUsedError;
  Gender get gender => throw _privateConstructorUsedError;
  DateTime? get dateOfBirth => throw _privateConstructorUsedError;
  int get gradeLevel => throw _privateConstructorUsedError;
  String get parentID => throw _privateConstructorUsedError;
  String get schoolID => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChildCopyWith<Child> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChildCopyWith<$Res> {
  factory $ChildCopyWith(Child value, $Res Function(Child) then) =
      _$ChildCopyWithImpl<$Res>;
  $Res call(
      {String uid,
      String username,
      String firstname,
      String lastname,
      Gender gender,
      DateTime? dateOfBirth,
      int gradeLevel,
      String parentID,
      String schoolID});
}

/// @nodoc
class _$ChildCopyWithImpl<$Res> implements $ChildCopyWith<$Res> {
  _$ChildCopyWithImpl(this._value, this._then);

  final Child _value;
  // ignore: unused_field
  final $Res Function(Child) _then;

  @override
  $Res call({
    Object? uid = freezed,
    Object? username = freezed,
    Object? firstname = freezed,
    Object? lastname = freezed,
    Object? gender = freezed,
    Object? dateOfBirth = freezed,
    Object? gradeLevel = freezed,
    Object? parentID = freezed,
    Object? schoolID = freezed,
  }) {
    return _then(_value.copyWith(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      firstname: firstname == freezed
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String,
      lastname: lastname == freezed
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender,
      dateOfBirth: dateOfBirth == freezed
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      gradeLevel: gradeLevel == freezed
          ? _value.gradeLevel
          : gradeLevel // ignore: cast_nullable_to_non_nullable
              as int,
      parentID: parentID == freezed
          ? _value.parentID
          : parentID // ignore: cast_nullable_to_non_nullable
              as String,
      schoolID: schoolID == freezed
          ? _value.schoolID
          : schoolID // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ChildModelCopyWith<$Res> implements $ChildCopyWith<$Res> {
  factory _$ChildModelCopyWith(
          _ChildModel value, $Res Function(_ChildModel) then) =
      __$ChildModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String uid,
      String username,
      String firstname,
      String lastname,
      Gender gender,
      DateTime? dateOfBirth,
      int gradeLevel,
      String parentID,
      String schoolID});
}

/// @nodoc
class __$ChildModelCopyWithImpl<$Res> extends _$ChildCopyWithImpl<$Res>
    implements _$ChildModelCopyWith<$Res> {
  __$ChildModelCopyWithImpl(
      _ChildModel _value, $Res Function(_ChildModel) _then)
      : super(_value, (v) => _then(v as _ChildModel));

  @override
  _ChildModel get _value => super._value as _ChildModel;

  @override
  $Res call({
    Object? uid = freezed,
    Object? username = freezed,
    Object? firstname = freezed,
    Object? lastname = freezed,
    Object? gender = freezed,
    Object? dateOfBirth = freezed,
    Object? gradeLevel = freezed,
    Object? parentID = freezed,
    Object? schoolID = freezed,
  }) {
    return _then(_ChildModel(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      firstname: firstname == freezed
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String,
      lastname: lastname == freezed
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender,
      dateOfBirth: dateOfBirth == freezed
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      gradeLevel: gradeLevel == freezed
          ? _value.gradeLevel
          : gradeLevel // ignore: cast_nullable_to_non_nullable
              as int,
      parentID: parentID == freezed
          ? _value.parentID
          : parentID // ignore: cast_nullable_to_non_nullable
              as String,
      schoolID: schoolID == freezed
          ? _value.schoolID
          : schoolID // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_ChildModel with DiagnosticableTreeMixin implements _ChildModel {
  _$_ChildModel(
      {this.uid = 'no-id',
      this.username = 'username',
      this.firstname = 'firstname',
      this.lastname = 'lastname',
      this.gender = Gender.unknown,
      this.dateOfBirth,
      this.gradeLevel = 0,
      this.parentID = 'no-parentID',
      this.schoolID = 'no-schoolID'});

  factory _$_ChildModel.fromJson(Map<String, dynamic> json) =>
      _$_$_ChildModelFromJson(json);

  @JsonKey(defaultValue: 'no-id')
  @override
  final String uid;
  @JsonKey(defaultValue: 'username')
  @override
  final String username;
  @JsonKey(defaultValue: 'firstname')
  @override
  final String firstname;
  @JsonKey(defaultValue: 'lastname')
  @override
  final String lastname;
  @JsonKey(defaultValue: Gender.unknown)
  @override
  final Gender gender;
  @override
  final DateTime? dateOfBirth;
  @JsonKey(defaultValue: 0)
  @override
  final int gradeLevel;
  @JsonKey(defaultValue: 'no-parentID')
  @override
  final String parentID;
  @JsonKey(defaultValue: 'no-schoolID')
  @override
  final String schoolID;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Child(uid: $uid, username: $username, firstname: $firstname, lastname: $lastname, gender: $gender, dateOfBirth: $dateOfBirth, gradeLevel: $gradeLevel, parentID: $parentID, schoolID: $schoolID)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Child'))
      ..add(DiagnosticsProperty('uid', uid))
      ..add(DiagnosticsProperty('username', username))
      ..add(DiagnosticsProperty('firstname', firstname))
      ..add(DiagnosticsProperty('lastname', lastname))
      ..add(DiagnosticsProperty('gender', gender))
      ..add(DiagnosticsProperty('dateOfBirth', dateOfBirth))
      ..add(DiagnosticsProperty('gradeLevel', gradeLevel))
      ..add(DiagnosticsProperty('parentID', parentID))
      ..add(DiagnosticsProperty('schoolID', schoolID));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ChildModel &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)) &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)) &&
            (identical(other.firstname, firstname) ||
                const DeepCollectionEquality()
                    .equals(other.firstname, firstname)) &&
            (identical(other.lastname, lastname) ||
                const DeepCollectionEquality()
                    .equals(other.lastname, lastname)) &&
            (identical(other.gender, gender) ||
                const DeepCollectionEquality().equals(other.gender, gender)) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                const DeepCollectionEquality()
                    .equals(other.dateOfBirth, dateOfBirth)) &&
            (identical(other.gradeLevel, gradeLevel) ||
                const DeepCollectionEquality()
                    .equals(other.gradeLevel, gradeLevel)) &&
            (identical(other.parentID, parentID) ||
                const DeepCollectionEquality()
                    .equals(other.parentID, parentID)) &&
            (identical(other.schoolID, schoolID) ||
                const DeepCollectionEquality()
                    .equals(other.schoolID, schoolID)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(uid) ^
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(firstname) ^
      const DeepCollectionEquality().hash(lastname) ^
      const DeepCollectionEquality().hash(gender) ^
      const DeepCollectionEquality().hash(dateOfBirth) ^
      const DeepCollectionEquality().hash(gradeLevel) ^
      const DeepCollectionEquality().hash(parentID) ^
      const DeepCollectionEquality().hash(schoolID);

  @JsonKey(ignore: true)
  @override
  _$ChildModelCopyWith<_ChildModel> get copyWith =>
      __$ChildModelCopyWithImpl<_ChildModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ChildModelToJson(this);
  }
}

abstract class _ChildModel implements Child {
  factory _ChildModel(
      {String uid,
      String username,
      String firstname,
      String lastname,
      Gender gender,
      DateTime? dateOfBirth,
      int gradeLevel,
      String parentID,
      String schoolID}) = _$_ChildModel;

  factory _ChildModel.fromJson(Map<String, dynamic> json) =
      _$_ChildModel.fromJson;

  @override
  String get uid => throw _privateConstructorUsedError;
  @override
  String get username => throw _privateConstructorUsedError;
  @override
  String get firstname => throw _privateConstructorUsedError;
  @override
  String get lastname => throw _privateConstructorUsedError;
  @override
  Gender get gender => throw _privateConstructorUsedError;
  @override
  DateTime? get dateOfBirth => throw _privateConstructorUsedError;
  @override
  int get gradeLevel => throw _privateConstructorUsedError;
  @override
  String get parentID => throw _privateConstructorUsedError;
  @override
  String get schoolID => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ChildModelCopyWith<_ChildModel> get copyWith =>
      throw _privateConstructorUsedError;
}
