// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'school_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SchoolModel _$SchoolModelFromJson(Map<String, dynamic> json) {
  return _SchoolModel.fromJson(json);
}

/// @nodoc
class _$SchoolModelTearOff {
  const _$SchoolModelTearOff();

  _SchoolModel call(
      {String uid = 'no-id',
      String name = 'name',
      String address = 'address',
      int minGradeLevel = 0,
      int maxGradeLevel = 8,
      bool isPublic = true,
      SchoolLevel schoolLevel = SchoolLevel.primary}) {
    return _SchoolModel(
      uid: uid,
      name: name,
      address: address,
      minGradeLevel: minGradeLevel,
      maxGradeLevel: maxGradeLevel,
      isPublic: isPublic,
      schoolLevel: schoolLevel,
    );
  }

  SchoolModel fromJson(Map<String, Object> json) {
    return SchoolModel.fromJson(json);
  }
}

/// @nodoc
const $SchoolModel = _$SchoolModelTearOff();

/// @nodoc
mixin _$SchoolModel {
  String get uid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  int get minGradeLevel => throw _privateConstructorUsedError;
  int get maxGradeLevel => throw _privateConstructorUsedError;
  bool get isPublic => throw _privateConstructorUsedError;
  SchoolLevel get schoolLevel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SchoolModelCopyWith<SchoolModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SchoolModelCopyWith<$Res> {
  factory $SchoolModelCopyWith(
          SchoolModel value, $Res Function(SchoolModel) then) =
      _$SchoolModelCopyWithImpl<$Res>;
  $Res call(
      {String uid,
      String name,
      String address,
      int minGradeLevel,
      int maxGradeLevel,
      bool isPublic,
      SchoolLevel schoolLevel});
}

/// @nodoc
class _$SchoolModelCopyWithImpl<$Res> implements $SchoolModelCopyWith<$Res> {
  _$SchoolModelCopyWithImpl(this._value, this._then);

  final SchoolModel _value;
  // ignore: unused_field
  final $Res Function(SchoolModel) _then;

  @override
  $Res call({
    Object? uid = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? minGradeLevel = freezed,
    Object? maxGradeLevel = freezed,
    Object? isPublic = freezed,
    Object? schoolLevel = freezed,
  }) {
    return _then(_value.copyWith(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      minGradeLevel: minGradeLevel == freezed
          ? _value.minGradeLevel
          : minGradeLevel // ignore: cast_nullable_to_non_nullable
              as int,
      maxGradeLevel: maxGradeLevel == freezed
          ? _value.maxGradeLevel
          : maxGradeLevel // ignore: cast_nullable_to_non_nullable
              as int,
      isPublic: isPublic == freezed
          ? _value.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool,
      schoolLevel: schoolLevel == freezed
          ? _value.schoolLevel
          : schoolLevel // ignore: cast_nullable_to_non_nullable
              as SchoolLevel,
    ));
  }
}

/// @nodoc
abstract class _$SchoolModelCopyWith<$Res>
    implements $SchoolModelCopyWith<$Res> {
  factory _$SchoolModelCopyWith(
          _SchoolModel value, $Res Function(_SchoolModel) then) =
      __$SchoolModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String uid,
      String name,
      String address,
      int minGradeLevel,
      int maxGradeLevel,
      bool isPublic,
      SchoolLevel schoolLevel});
}

/// @nodoc
class __$SchoolModelCopyWithImpl<$Res> extends _$SchoolModelCopyWithImpl<$Res>
    implements _$SchoolModelCopyWith<$Res> {
  __$SchoolModelCopyWithImpl(
      _SchoolModel _value, $Res Function(_SchoolModel) _then)
      : super(_value, (v) => _then(v as _SchoolModel));

  @override
  _SchoolModel get _value => super._value as _SchoolModel;

  @override
  $Res call({
    Object? uid = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? minGradeLevel = freezed,
    Object? maxGradeLevel = freezed,
    Object? isPublic = freezed,
    Object? schoolLevel = freezed,
  }) {
    return _then(_SchoolModel(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      minGradeLevel: minGradeLevel == freezed
          ? _value.minGradeLevel
          : minGradeLevel // ignore: cast_nullable_to_non_nullable
              as int,
      maxGradeLevel: maxGradeLevel == freezed
          ? _value.maxGradeLevel
          : maxGradeLevel // ignore: cast_nullable_to_non_nullable
              as int,
      isPublic: isPublic == freezed
          ? _value.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool,
      schoolLevel: schoolLevel == freezed
          ? _value.schoolLevel
          : schoolLevel // ignore: cast_nullable_to_non_nullable
              as SchoolLevel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SchoolModel implements _SchoolModel {
  _$_SchoolModel(
      {this.uid = 'no-id',
      this.name = 'name',
      this.address = 'address',
      this.minGradeLevel = 0,
      this.maxGradeLevel = 8,
      this.isPublic = true,
      this.schoolLevel = SchoolLevel.primary});

  factory _$_SchoolModel.fromJson(Map<String, dynamic> json) =>
      _$_$_SchoolModelFromJson(json);

  @JsonKey(defaultValue: 'no-id')
  @override
  final String uid;
  @JsonKey(defaultValue: 'name')
  @override
  final String name;
  @JsonKey(defaultValue: 'address')
  @override
  final String address;
  @JsonKey(defaultValue: 0)
  @override
  final int minGradeLevel;
  @JsonKey(defaultValue: 8)
  @override
  final int maxGradeLevel;
  @JsonKey(defaultValue: true)
  @override
  final bool isPublic;
  @JsonKey(defaultValue: SchoolLevel.primary)
  @override
  final SchoolLevel schoolLevel;

  @override
  String toString() {
    return 'SchoolModel(uid: $uid, name: $name, address: $address, minGradeLevel: $minGradeLevel, maxGradeLevel: $maxGradeLevel, isPublic: $isPublic, schoolLevel: $schoolLevel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SchoolModel &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality()
                    .equals(other.address, address)) &&
            (identical(other.minGradeLevel, minGradeLevel) ||
                const DeepCollectionEquality()
                    .equals(other.minGradeLevel, minGradeLevel)) &&
            (identical(other.maxGradeLevel, maxGradeLevel) ||
                const DeepCollectionEquality()
                    .equals(other.maxGradeLevel, maxGradeLevel)) &&
            (identical(other.isPublic, isPublic) ||
                const DeepCollectionEquality()
                    .equals(other.isPublic, isPublic)) &&
            (identical(other.schoolLevel, schoolLevel) ||
                const DeepCollectionEquality()
                    .equals(other.schoolLevel, schoolLevel)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(uid) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(address) ^
      const DeepCollectionEquality().hash(minGradeLevel) ^
      const DeepCollectionEquality().hash(maxGradeLevel) ^
      const DeepCollectionEquality().hash(isPublic) ^
      const DeepCollectionEquality().hash(schoolLevel);

  @JsonKey(ignore: true)
  @override
  _$SchoolModelCopyWith<_SchoolModel> get copyWith =>
      __$SchoolModelCopyWithImpl<_SchoolModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SchoolModelToJson(this);
  }
}

abstract class _SchoolModel implements SchoolModel {
  factory _SchoolModel(
      {String uid,
      String name,
      String address,
      int minGradeLevel,
      int maxGradeLevel,
      bool isPublic,
      SchoolLevel schoolLevel}) = _$_SchoolModel;

  factory _SchoolModel.fromJson(Map<String, dynamic> json) =
      _$_SchoolModel.fromJson;

  @override
  String get uid => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get address => throw _privateConstructorUsedError;
  @override
  int get minGradeLevel => throw _privateConstructorUsedError;
  @override
  int get maxGradeLevel => throw _privateConstructorUsedError;
  @override
  bool get isPublic => throw _privateConstructorUsedError;
  @override
  SchoolLevel get schoolLevel => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SchoolModelCopyWith<_SchoolModel> get copyWith =>
      throw _privateConstructorUsedError;
}
