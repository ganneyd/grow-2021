// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'stop_watch_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ElapsedTimeModelTearOff {
  const _$ElapsedTimeModelTearOff();

  _ElapsedTimeModel call(
      {int hours = 0, int minutes = 0, int seconds = 0, int milliseconds = 0}) {
    return _ElapsedTimeModel(
      hours: hours,
      minutes: minutes,
      seconds: seconds,
      milliseconds: milliseconds,
    );
  }
}

/// @nodoc
const $ElapsedTimeModel = _$ElapsedTimeModelTearOff();

/// @nodoc
mixin _$ElapsedTimeModel {
  int get hours => throw _privateConstructorUsedError;
  int get minutes => throw _privateConstructorUsedError;
  int get seconds => throw _privateConstructorUsedError;
  int get milliseconds => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ElapsedTimeModelCopyWith<ElapsedTimeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ElapsedTimeModelCopyWith<$Res> {
  factory $ElapsedTimeModelCopyWith(
          ElapsedTimeModel value, $Res Function(ElapsedTimeModel) then) =
      _$ElapsedTimeModelCopyWithImpl<$Res>;
  $Res call({int hours, int minutes, int seconds, int milliseconds});
}

/// @nodoc
class _$ElapsedTimeModelCopyWithImpl<$Res>
    implements $ElapsedTimeModelCopyWith<$Res> {
  _$ElapsedTimeModelCopyWithImpl(this._value, this._then);

  final ElapsedTimeModel _value;
  // ignore: unused_field
  final $Res Function(ElapsedTimeModel) _then;

  @override
  $Res call({
    Object? hours = freezed,
    Object? minutes = freezed,
    Object? seconds = freezed,
    Object? milliseconds = freezed,
  }) {
    return _then(_value.copyWith(
      hours: hours == freezed
          ? _value.hours
          : hours // ignore: cast_nullable_to_non_nullable
              as int,
      minutes: minutes == freezed
          ? _value.minutes
          : minutes // ignore: cast_nullable_to_non_nullable
              as int,
      seconds: seconds == freezed
          ? _value.seconds
          : seconds // ignore: cast_nullable_to_non_nullable
              as int,
      milliseconds: milliseconds == freezed
          ? _value.milliseconds
          : milliseconds // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$ElapsedTimeModelCopyWith<$Res>
    implements $ElapsedTimeModelCopyWith<$Res> {
  factory _$ElapsedTimeModelCopyWith(
          _ElapsedTimeModel value, $Res Function(_ElapsedTimeModel) then) =
      __$ElapsedTimeModelCopyWithImpl<$Res>;
  @override
  $Res call({int hours, int minutes, int seconds, int milliseconds});
}

/// @nodoc
class __$ElapsedTimeModelCopyWithImpl<$Res>
    extends _$ElapsedTimeModelCopyWithImpl<$Res>
    implements _$ElapsedTimeModelCopyWith<$Res> {
  __$ElapsedTimeModelCopyWithImpl(
      _ElapsedTimeModel _value, $Res Function(_ElapsedTimeModel) _then)
      : super(_value, (v) => _then(v as _ElapsedTimeModel));

  @override
  _ElapsedTimeModel get _value => super._value as _ElapsedTimeModel;

  @override
  $Res call({
    Object? hours = freezed,
    Object? minutes = freezed,
    Object? seconds = freezed,
    Object? milliseconds = freezed,
  }) {
    return _then(_ElapsedTimeModel(
      hours: hours == freezed
          ? _value.hours
          : hours // ignore: cast_nullable_to_non_nullable
              as int,
      minutes: minutes == freezed
          ? _value.minutes
          : minutes // ignore: cast_nullable_to_non_nullable
              as int,
      seconds: seconds == freezed
          ? _value.seconds
          : seconds // ignore: cast_nullable_to_non_nullable
              as int,
      milliseconds: milliseconds == freezed
          ? _value.milliseconds
          : milliseconds // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ElapsedTimeModel implements _ElapsedTimeModel {
  const _$_ElapsedTimeModel(
      {this.hours = 0,
      this.minutes = 0,
      this.seconds = 0,
      this.milliseconds = 0});

  @JsonKey(defaultValue: 0)
  @override
  final int hours;
  @JsonKey(defaultValue: 0)
  @override
  final int minutes;
  @JsonKey(defaultValue: 0)
  @override
  final int seconds;
  @JsonKey(defaultValue: 0)
  @override
  final int milliseconds;

  @override
  String toString() {
    return 'ElapsedTimeModel(hours: $hours, minutes: $minutes, seconds: $seconds, milliseconds: $milliseconds)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ElapsedTimeModel &&
            (identical(other.hours, hours) ||
                const DeepCollectionEquality().equals(other.hours, hours)) &&
            (identical(other.minutes, minutes) ||
                const DeepCollectionEquality()
                    .equals(other.minutes, minutes)) &&
            (identical(other.seconds, seconds) ||
                const DeepCollectionEquality()
                    .equals(other.seconds, seconds)) &&
            (identical(other.milliseconds, milliseconds) ||
                const DeepCollectionEquality()
                    .equals(other.milliseconds, milliseconds)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(hours) ^
      const DeepCollectionEquality().hash(minutes) ^
      const DeepCollectionEquality().hash(seconds) ^
      const DeepCollectionEquality().hash(milliseconds);

  @JsonKey(ignore: true)
  @override
  _$ElapsedTimeModelCopyWith<_ElapsedTimeModel> get copyWith =>
      __$ElapsedTimeModelCopyWithImpl<_ElapsedTimeModel>(this, _$identity);
}

abstract class _ElapsedTimeModel implements ElapsedTimeModel {
  const factory _ElapsedTimeModel(
      {int hours,
      int minutes,
      int seconds,
      int milliseconds}) = _$_ElapsedTimeModel;

  @override
  int get hours => throw _privateConstructorUsedError;
  @override
  int get minutes => throw _privateConstructorUsedError;
  @override
  int get seconds => throw _privateConstructorUsedError;
  @override
  int get milliseconds => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ElapsedTimeModelCopyWith<_ElapsedTimeModel> get copyWith =>
      throw _privateConstructorUsedError;
}
