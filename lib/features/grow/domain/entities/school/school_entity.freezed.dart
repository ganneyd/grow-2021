// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'school_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SchoolEntityTearOff {
  const _$SchoolEntityTearOff();

  _SchoolEntity call(
      {String name = 'school-name',
      String address = 'school-address',
      int maxGradeLevel = 0,
      int minGradeLevel = 0,
      SchoolLevel schoolLevel = SchoolLevel.primary,
      bool isPublic = true}) {
    return _SchoolEntity(
      name: name,
      address: address,
      maxGradeLevel: maxGradeLevel,
      minGradeLevel: minGradeLevel,
      schoolLevel: schoolLevel,
      isPublic: isPublic,
    );
  }
}

/// @nodoc
const $SchoolEntity = _$SchoolEntityTearOff();

/// @nodoc
mixin _$SchoolEntity {
  String get name => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  int get maxGradeLevel => throw _privateConstructorUsedError;
  int get minGradeLevel => throw _privateConstructorUsedError;
  SchoolLevel get schoolLevel => throw _privateConstructorUsedError;
  bool get isPublic => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SchoolEntityCopyWith<SchoolEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SchoolEntityCopyWith<$Res> {
  factory $SchoolEntityCopyWith(
          SchoolEntity value, $Res Function(SchoolEntity) then) =
      _$SchoolEntityCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String address,
      int maxGradeLevel,
      int minGradeLevel,
      SchoolLevel schoolLevel,
      bool isPublic});
}

/// @nodoc
class _$SchoolEntityCopyWithImpl<$Res> implements $SchoolEntityCopyWith<$Res> {
  _$SchoolEntityCopyWithImpl(this._value, this._then);

  final SchoolEntity _value;
  // ignore: unused_field
  final $Res Function(SchoolEntity) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? address = freezed,
    Object? maxGradeLevel = freezed,
    Object? minGradeLevel = freezed,
    Object? schoolLevel = freezed,
    Object? isPublic = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      maxGradeLevel: maxGradeLevel == freezed
          ? _value.maxGradeLevel
          : maxGradeLevel // ignore: cast_nullable_to_non_nullable
              as int,
      minGradeLevel: minGradeLevel == freezed
          ? _value.minGradeLevel
          : minGradeLevel // ignore: cast_nullable_to_non_nullable
              as int,
      schoolLevel: schoolLevel == freezed
          ? _value.schoolLevel
          : schoolLevel // ignore: cast_nullable_to_non_nullable
              as SchoolLevel,
      isPublic: isPublic == freezed
          ? _value.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$SchoolEntityCopyWith<$Res>
    implements $SchoolEntityCopyWith<$Res> {
  factory _$SchoolEntityCopyWith(
          _SchoolEntity value, $Res Function(_SchoolEntity) then) =
      __$SchoolEntityCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String address,
      int maxGradeLevel,
      int minGradeLevel,
      SchoolLevel schoolLevel,
      bool isPublic});
}

/// @nodoc
class __$SchoolEntityCopyWithImpl<$Res> extends _$SchoolEntityCopyWithImpl<$Res>
    implements _$SchoolEntityCopyWith<$Res> {
  __$SchoolEntityCopyWithImpl(
      _SchoolEntity _value, $Res Function(_SchoolEntity) _then)
      : super(_value, (v) => _then(v as _SchoolEntity));

  @override
  _SchoolEntity get _value => super._value as _SchoolEntity;

  @override
  $Res call({
    Object? name = freezed,
    Object? address = freezed,
    Object? maxGradeLevel = freezed,
    Object? minGradeLevel = freezed,
    Object? schoolLevel = freezed,
    Object? isPublic = freezed,
  }) {
    return _then(_SchoolEntity(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      maxGradeLevel: maxGradeLevel == freezed
          ? _value.maxGradeLevel
          : maxGradeLevel // ignore: cast_nullable_to_non_nullable
              as int,
      minGradeLevel: minGradeLevel == freezed
          ? _value.minGradeLevel
          : minGradeLevel // ignore: cast_nullable_to_non_nullable
              as int,
      schoolLevel: schoolLevel == freezed
          ? _value.schoolLevel
          : schoolLevel // ignore: cast_nullable_to_non_nullable
              as SchoolLevel,
      isPublic: isPublic == freezed
          ? _value.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
class _$_SchoolEntity with DiagnosticableTreeMixin implements _SchoolEntity {
  _$_SchoolEntity(
      {this.name = 'school-name',
      this.address = 'school-address',
      this.maxGradeLevel = 0,
      this.minGradeLevel = 0,
      this.schoolLevel = SchoolLevel.primary,
      this.isPublic = true});

  @JsonKey(defaultValue: 'school-name')
  @override
  final String name;
  @JsonKey(defaultValue: 'school-address')
  @override
  final String address;
  @JsonKey(defaultValue: 0)
  @override
  final int maxGradeLevel;
  @JsonKey(defaultValue: 0)
  @override
  final int minGradeLevel;
  @JsonKey(defaultValue: SchoolLevel.primary)
  @override
  final SchoolLevel schoolLevel;
  @JsonKey(defaultValue: true)
  @override
  final bool isPublic;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SchoolEntity(name: $name, address: $address, maxGradeLevel: $maxGradeLevel, minGradeLevel: $minGradeLevel, schoolLevel: $schoolLevel, isPublic: $isPublic)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SchoolEntity'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('address', address))
      ..add(DiagnosticsProperty('maxGradeLevel', maxGradeLevel))
      ..add(DiagnosticsProperty('minGradeLevel', minGradeLevel))
      ..add(DiagnosticsProperty('schoolLevel', schoolLevel))
      ..add(DiagnosticsProperty('isPublic', isPublic));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SchoolEntity &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality()
                    .equals(other.address, address)) &&
            (identical(other.maxGradeLevel, maxGradeLevel) ||
                const DeepCollectionEquality()
                    .equals(other.maxGradeLevel, maxGradeLevel)) &&
            (identical(other.minGradeLevel, minGradeLevel) ||
                const DeepCollectionEquality()
                    .equals(other.minGradeLevel, minGradeLevel)) &&
            (identical(other.schoolLevel, schoolLevel) ||
                const DeepCollectionEquality()
                    .equals(other.schoolLevel, schoolLevel)) &&
            (identical(other.isPublic, isPublic) ||
                const DeepCollectionEquality()
                    .equals(other.isPublic, isPublic)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(address) ^
      const DeepCollectionEquality().hash(maxGradeLevel) ^
      const DeepCollectionEquality().hash(minGradeLevel) ^
      const DeepCollectionEquality().hash(schoolLevel) ^
      const DeepCollectionEquality().hash(isPublic);

  @JsonKey(ignore: true)
  @override
  _$SchoolEntityCopyWith<_SchoolEntity> get copyWith =>
      __$SchoolEntityCopyWithImpl<_SchoolEntity>(this, _$identity);
}

abstract class _SchoolEntity implements SchoolEntity {
  factory _SchoolEntity(
      {String name,
      String address,
      int maxGradeLevel,
      int minGradeLevel,
      SchoolLevel schoolLevel,
      bool isPublic}) = _$_SchoolEntity;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get address => throw _privateConstructorUsedError;
  @override
  int get maxGradeLevel => throw _privateConstructorUsedError;
  @override
  int get minGradeLevel => throw _privateConstructorUsedError;
  @override
  SchoolLevel get schoolLevel => throw _privateConstructorUsedError;
  @override
  bool get isPublic => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SchoolEntityCopyWith<_SchoolEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
