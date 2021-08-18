// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'run_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RunDetailsModelTearOff {
  const _$RunDetailsModelTearOff();

  _RunDetails call(
      {double latitude = 0,
      double longitude = 0,
      double pace = 0,
      double distance = 0,
      int steps = 0,
      RunStatus status = RunStatus.unknown}) {
    return _RunDetails(
      latitude: latitude,
      longitude: longitude,
      pace: pace,
      distance: distance,
      steps: steps,
      status: status,
    );
  }
}

/// @nodoc
const $RunDetailsModel = _$RunDetailsModelTearOff();

/// @nodoc
mixin _$RunDetailsModel {
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  double get pace => throw _privateConstructorUsedError;
  double get distance => throw _privateConstructorUsedError;
  int get steps => throw _privateConstructorUsedError;
  RunStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RunDetailsModelCopyWith<RunDetailsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RunDetailsModelCopyWith<$Res> {
  factory $RunDetailsModelCopyWith(
          RunDetailsModel value, $Res Function(RunDetailsModel) then) =
      _$RunDetailsModelCopyWithImpl<$Res>;
  $Res call(
      {double latitude,
      double longitude,
      double pace,
      double distance,
      int steps,
      RunStatus status});
}

/// @nodoc
class _$RunDetailsModelCopyWithImpl<$Res>
    implements $RunDetailsModelCopyWith<$Res> {
  _$RunDetailsModelCopyWithImpl(this._value, this._then);

  final RunDetailsModel _value;
  // ignore: unused_field
  final $Res Function(RunDetailsModel) _then;

  @override
  $Res call({
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? pace = freezed,
    Object? distance = freezed,
    Object? steps = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      pace: pace == freezed
          ? _value.pace
          : pace // ignore: cast_nullable_to_non_nullable
              as double,
      distance: distance == freezed
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      steps: steps == freezed
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as int,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RunStatus,
    ));
  }
}

/// @nodoc
abstract class _$RunDetailsCopyWith<$Res>
    implements $RunDetailsModelCopyWith<$Res> {
  factory _$RunDetailsCopyWith(
          _RunDetails value, $Res Function(_RunDetails) then) =
      __$RunDetailsCopyWithImpl<$Res>;
  @override
  $Res call(
      {double latitude,
      double longitude,
      double pace,
      double distance,
      int steps,
      RunStatus status});
}

/// @nodoc
class __$RunDetailsCopyWithImpl<$Res>
    extends _$RunDetailsModelCopyWithImpl<$Res>
    implements _$RunDetailsCopyWith<$Res> {
  __$RunDetailsCopyWithImpl(
      _RunDetails _value, $Res Function(_RunDetails) _then)
      : super(_value, (v) => _then(v as _RunDetails));

  @override
  _RunDetails get _value => super._value as _RunDetails;

  @override
  $Res call({
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? pace = freezed,
    Object? distance = freezed,
    Object? steps = freezed,
    Object? status = freezed,
  }) {
    return _then(_RunDetails(
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      pace: pace == freezed
          ? _value.pace
          : pace // ignore: cast_nullable_to_non_nullable
              as double,
      distance: distance == freezed
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      steps: steps == freezed
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as int,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RunStatus,
    ));
  }
}

/// @nodoc

class _$_RunDetails implements _RunDetails {
  _$_RunDetails(
      {this.latitude = 0,
      this.longitude = 0,
      this.pace = 0,
      this.distance = 0,
      this.steps = 0,
      this.status = RunStatus.unknown});

  @JsonKey(defaultValue: 0)
  @override
  final double latitude;
  @JsonKey(defaultValue: 0)
  @override
  final double longitude;
  @JsonKey(defaultValue: 0)
  @override
  final double pace;
  @JsonKey(defaultValue: 0)
  @override
  final double distance;
  @JsonKey(defaultValue: 0)
  @override
  final int steps;
  @JsonKey(defaultValue: RunStatus.unknown)
  @override
  final RunStatus status;

  @override
  String toString() {
    return 'RunDetailsModel(latitude: $latitude, longitude: $longitude, pace: $pace, distance: $distance, steps: $steps, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RunDetails &&
            (identical(other.latitude, latitude) ||
                const DeepCollectionEquality()
                    .equals(other.latitude, latitude)) &&
            (identical(other.longitude, longitude) ||
                const DeepCollectionEquality()
                    .equals(other.longitude, longitude)) &&
            (identical(other.pace, pace) ||
                const DeepCollectionEquality().equals(other.pace, pace)) &&
            (identical(other.distance, distance) ||
                const DeepCollectionEquality()
                    .equals(other.distance, distance)) &&
            (identical(other.steps, steps) ||
                const DeepCollectionEquality().equals(other.steps, steps)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(latitude) ^
      const DeepCollectionEquality().hash(longitude) ^
      const DeepCollectionEquality().hash(pace) ^
      const DeepCollectionEquality().hash(distance) ^
      const DeepCollectionEquality().hash(steps) ^
      const DeepCollectionEquality().hash(status);

  @JsonKey(ignore: true)
  @override
  _$RunDetailsCopyWith<_RunDetails> get copyWith =>
      __$RunDetailsCopyWithImpl<_RunDetails>(this, _$identity);
}

abstract class _RunDetails implements RunDetailsModel {
  factory _RunDetails(
      {double latitude,
      double longitude,
      double pace,
      double distance,
      int steps,
      RunStatus status}) = _$_RunDetails;

  @override
  double get latitude => throw _privateConstructorUsedError;
  @override
  double get longitude => throw _privateConstructorUsedError;
  @override
  double get pace => throw _privateConstructorUsedError;
  @override
  double get distance => throw _privateConstructorUsedError;
  @override
  int get steps => throw _privateConstructorUsedError;
  @override
  RunStatus get status => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RunDetailsCopyWith<_RunDetails> get copyWith =>
      throw _privateConstructorUsedError;
}
