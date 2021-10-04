// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'level_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LevelDataModelTearOff {
  const _$LevelDataModelTearOff();

  _LevelDataModel call({double distance = 0, int level = 0}) {
    return _LevelDataModel(
      distance: distance,
      level: level,
    );
  }
}

/// @nodoc
const $LevelDataModel = _$LevelDataModelTearOff();

/// @nodoc
mixin _$LevelDataModel {
  double get distance => throw _privateConstructorUsedError;
  int get level => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LevelDataModelCopyWith<LevelDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LevelDataModelCopyWith<$Res> {
  factory $LevelDataModelCopyWith(
          LevelDataModel value, $Res Function(LevelDataModel) then) =
      _$LevelDataModelCopyWithImpl<$Res>;
  $Res call({double distance, int level});
}

/// @nodoc
class _$LevelDataModelCopyWithImpl<$Res>
    implements $LevelDataModelCopyWith<$Res> {
  _$LevelDataModelCopyWithImpl(this._value, this._then);

  final LevelDataModel _value;
  // ignore: unused_field
  final $Res Function(LevelDataModel) _then;

  @override
  $Res call({
    Object? distance = freezed,
    Object? level = freezed,
  }) {
    return _then(_value.copyWith(
      distance: distance == freezed
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      level: level == freezed
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$LevelDataModelCopyWith<$Res>
    implements $LevelDataModelCopyWith<$Res> {
  factory _$LevelDataModelCopyWith(
          _LevelDataModel value, $Res Function(_LevelDataModel) then) =
      __$LevelDataModelCopyWithImpl<$Res>;
  @override
  $Res call({double distance, int level});
}

/// @nodoc
class __$LevelDataModelCopyWithImpl<$Res>
    extends _$LevelDataModelCopyWithImpl<$Res>
    implements _$LevelDataModelCopyWith<$Res> {
  __$LevelDataModelCopyWithImpl(
      _LevelDataModel _value, $Res Function(_LevelDataModel) _then)
      : super(_value, (v) => _then(v as _LevelDataModel));

  @override
  _LevelDataModel get _value => super._value as _LevelDataModel;

  @override
  $Res call({
    Object? distance = freezed,
    Object? level = freezed,
  }) {
    return _then(_LevelDataModel(
      distance: distance == freezed
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      level: level == freezed
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_LevelDataModel implements _LevelDataModel {
  const _$_LevelDataModel({this.distance = 0, this.level = 0});

  @JsonKey(defaultValue: 0)
  @override
  final double distance;
  @JsonKey(defaultValue: 0)
  @override
  final int level;

  @override
  String toString() {
    return 'LevelDataModel(distance: $distance, level: $level)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LevelDataModel &&
            (identical(other.distance, distance) ||
                const DeepCollectionEquality()
                    .equals(other.distance, distance)) &&
            (identical(other.level, level) ||
                const DeepCollectionEquality().equals(other.level, level)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(distance) ^
      const DeepCollectionEquality().hash(level);

  @JsonKey(ignore: true)
  @override
  _$LevelDataModelCopyWith<_LevelDataModel> get copyWith =>
      __$LevelDataModelCopyWithImpl<_LevelDataModel>(this, _$identity);
}

abstract class _LevelDataModel implements LevelDataModel {
  const factory _LevelDataModel({double distance, int level}) =
      _$_LevelDataModel;

  @override
  double get distance => throw _privateConstructorUsedError;
  @override
  int get level => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LevelDataModelCopyWith<_LevelDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}
