// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'parent_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ParentModel _$ParentModelFromJson(Map<String, dynamic> json) {
  return _ParentModel.fromJson(json);
}

/// @nodoc
class _$ParentModelTearOff {
  const _$ParentModelTearOff();

  _ParentModel call(
      {String uid = 'no-id',
      String firstname = 'firstname',
      String lastname = 'lastname',
      List<String> childrenIDs = const <String>[],
      String phonenumber = '0000000000',
      DateTime? dateOfBirth,
      Gender gender = Gender.unknown}) {
    return _ParentModel(
      uid: uid,
      firstname: firstname,
      lastname: lastname,
      childrenIDs: childrenIDs,
      phonenumber: phonenumber,
      dateOfBirth: dateOfBirth,
      gender: gender,
    );
  }

  ParentModel fromJson(Map<String, Object> json) {
    return ParentModel.fromJson(json);
  }
}

/// @nodoc
const $ParentModel = _$ParentModelTearOff();

/// @nodoc
mixin _$ParentModel {
  String get uid => throw _privateConstructorUsedError;
  String get firstname => throw _privateConstructorUsedError;
  String get lastname => throw _privateConstructorUsedError;
  List<String> get childrenIDs =>
      throw _privateConstructorUsedError; //TODO make a phonenumber class
  String get phonenumber => throw _privateConstructorUsedError;
  DateTime? get dateOfBirth => throw _privateConstructorUsedError;
  Gender get gender => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ParentModelCopyWith<ParentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParentModelCopyWith<$Res> {
  factory $ParentModelCopyWith(
          ParentModel value, $Res Function(ParentModel) then) =
      _$ParentModelCopyWithImpl<$Res>;
  $Res call(
      {String uid,
      String firstname,
      String lastname,
      List<String> childrenIDs,
      String phonenumber,
      DateTime? dateOfBirth,
      Gender gender});
}

/// @nodoc
class _$ParentModelCopyWithImpl<$Res> implements $ParentModelCopyWith<$Res> {
  _$ParentModelCopyWithImpl(this._value, this._then);

  final ParentModel _value;
  // ignore: unused_field
  final $Res Function(ParentModel) _then;

  @override
  $Res call({
    Object? uid = freezed,
    Object? firstname = freezed,
    Object? lastname = freezed,
    Object? childrenIDs = freezed,
    Object? phonenumber = freezed,
    Object? dateOfBirth = freezed,
    Object? gender = freezed,
  }) {
    return _then(_value.copyWith(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      firstname: firstname == freezed
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String,
      lastname: lastname == freezed
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String,
      childrenIDs: childrenIDs == freezed
          ? _value.childrenIDs
          : childrenIDs // ignore: cast_nullable_to_non_nullable
              as List<String>,
      phonenumber: phonenumber == freezed
          ? _value.phonenumber
          : phonenumber // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfBirth: dateOfBirth == freezed
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender,
    ));
  }
}

/// @nodoc
abstract class _$ParentModelCopyWith<$Res>
    implements $ParentModelCopyWith<$Res> {
  factory _$ParentModelCopyWith(
          _ParentModel value, $Res Function(_ParentModel) then) =
      __$ParentModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String uid,
      String firstname,
      String lastname,
      List<String> childrenIDs,
      String phonenumber,
      DateTime? dateOfBirth,
      Gender gender});
}

/// @nodoc
class __$ParentModelCopyWithImpl<$Res> extends _$ParentModelCopyWithImpl<$Res>
    implements _$ParentModelCopyWith<$Res> {
  __$ParentModelCopyWithImpl(
      _ParentModel _value, $Res Function(_ParentModel) _then)
      : super(_value, (v) => _then(v as _ParentModel));

  @override
  _ParentModel get _value => super._value as _ParentModel;

  @override
  $Res call({
    Object? uid = freezed,
    Object? firstname = freezed,
    Object? lastname = freezed,
    Object? childrenIDs = freezed,
    Object? phonenumber = freezed,
    Object? dateOfBirth = freezed,
    Object? gender = freezed,
  }) {
    return _then(_ParentModel(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      firstname: firstname == freezed
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String,
      lastname: lastname == freezed
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String,
      childrenIDs: childrenIDs == freezed
          ? _value.childrenIDs
          : childrenIDs // ignore: cast_nullable_to_non_nullable
              as List<String>,
      phonenumber: phonenumber == freezed
          ? _value.phonenumber
          : phonenumber // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfBirth: dateOfBirth == freezed
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ParentModel with DiagnosticableTreeMixin implements _ParentModel {
  _$_ParentModel(
      {this.uid = 'no-id',
      this.firstname = 'firstname',
      this.lastname = 'lastname',
      this.childrenIDs = const <String>[],
      this.phonenumber = '0000000000',
      this.dateOfBirth,
      this.gender = Gender.unknown});

  factory _$_ParentModel.fromJson(Map<String, dynamic> json) =>
      _$_$_ParentModelFromJson(json);

  @JsonKey(defaultValue: 'no-id')
  @override
  final String uid;
  @JsonKey(defaultValue: 'firstname')
  @override
  final String firstname;
  @JsonKey(defaultValue: 'lastname')
  @override
  final String lastname;
  @JsonKey(defaultValue: const <String>[])
  @override
  final List<String> childrenIDs;
  @JsonKey(defaultValue: '0000000000')
  @override //TODO make a phonenumber class
  final String phonenumber;
  @override
  final DateTime? dateOfBirth;
  @JsonKey(defaultValue: Gender.unknown)
  @override
  final Gender gender;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ParentModel(uid: $uid, firstname: $firstname, lastname: $lastname, childrenIDs: $childrenIDs, phonenumber: $phonenumber, dateOfBirth: $dateOfBirth, gender: $gender)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ParentModel'))
      ..add(DiagnosticsProperty('uid', uid))
      ..add(DiagnosticsProperty('firstname', firstname))
      ..add(DiagnosticsProperty('lastname', lastname))
      ..add(DiagnosticsProperty('childrenIDs', childrenIDs))
      ..add(DiagnosticsProperty('phonenumber', phonenumber))
      ..add(DiagnosticsProperty('dateOfBirth', dateOfBirth))
      ..add(DiagnosticsProperty('gender', gender));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ParentModel &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)) &&
            (identical(other.firstname, firstname) ||
                const DeepCollectionEquality()
                    .equals(other.firstname, firstname)) &&
            (identical(other.lastname, lastname) ||
                const DeepCollectionEquality()
                    .equals(other.lastname, lastname)) &&
            (identical(other.childrenIDs, childrenIDs) ||
                const DeepCollectionEquality()
                    .equals(other.childrenIDs, childrenIDs)) &&
            (identical(other.phonenumber, phonenumber) ||
                const DeepCollectionEquality()
                    .equals(other.phonenumber, phonenumber)) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                const DeepCollectionEquality()
                    .equals(other.dateOfBirth, dateOfBirth)) &&
            (identical(other.gender, gender) ||
                const DeepCollectionEquality().equals(other.gender, gender)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(uid) ^
      const DeepCollectionEquality().hash(firstname) ^
      const DeepCollectionEquality().hash(lastname) ^
      const DeepCollectionEquality().hash(childrenIDs) ^
      const DeepCollectionEquality().hash(phonenumber) ^
      const DeepCollectionEquality().hash(dateOfBirth) ^
      const DeepCollectionEquality().hash(gender);

  @JsonKey(ignore: true)
  @override
  _$ParentModelCopyWith<_ParentModel> get copyWith =>
      __$ParentModelCopyWithImpl<_ParentModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ParentModelToJson(this);
  }
}

abstract class _ParentModel implements ParentModel {
  factory _ParentModel(
      {String uid,
      String firstname,
      String lastname,
      List<String> childrenIDs,
      String phonenumber,
      DateTime? dateOfBirth,
      Gender gender}) = _$_ParentModel;

  factory _ParentModel.fromJson(Map<String, dynamic> json) =
      _$_ParentModel.fromJson;

  @override
  String get uid => throw _privateConstructorUsedError;
  @override
  String get firstname => throw _privateConstructorUsedError;
  @override
  String get lastname => throw _privateConstructorUsedError;
  @override
  List<String> get childrenIDs => throw _privateConstructorUsedError;
  @override //TODO make a phonenumber class
  String get phonenumber => throw _privateConstructorUsedError;
  @override
  DateTime? get dateOfBirth => throw _privateConstructorUsedError;
  @override
  Gender get gender => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ParentModelCopyWith<_ParentModel> get copyWith =>
      throw _privateConstructorUsedError;
}
