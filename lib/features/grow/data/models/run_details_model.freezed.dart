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
      {List<double> longitudeList = const <double>[0],
      List<double> latitudeList = const <double>[0],
      double distance = 0,
      double elapsedSeconds = 0,
      double pace = 0,
      RunStatus status = RunStatus.unknown}) {
    return _RunDetails(
      longitudeList: longitudeList,
      latitudeList: latitudeList,
      distance: distance,
      elapsedSeconds: elapsedSeconds,
      pace: pace,
      status: status,
    );
  }
}

/// @nodoc
const $RunDetailsModel = _$RunDetailsModelTearOff();

/// @nodoc
mixin _$RunDetailsModel {
  List<double> get longitudeList => throw _privateConstructorUsedError;
  List<double> get latitudeList => throw _privateConstructorUsedError;
  double get distance => throw _privateConstructorUsedError;
  double get elapsedSeconds => throw _privateConstructorUsedError;
  double get pace => throw _privateConstructorUsedError;
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
      {List<double> longitudeList,
      List<double> latitudeList,
      double distance,
      double elapsedSeconds,
      double pace,
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
    Object? longitudeList = freezed,
    Object? latitudeList = freezed,
    Object? distance = freezed,
    Object? elapsedSeconds = freezed,
    Object? pace = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      longitudeList: longitudeList == freezed
          ? _value.longitudeList
          : longitudeList // ignore: cast_nullable_to_non_nullable
              as List<double>,
      latitudeList: latitudeList == freezed
          ? _value.latitudeList
          : latitudeList // ignore: cast_nullable_to_non_nullable
              as List<double>,
      distance: distance == freezed
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      elapsedSeconds: elapsedSeconds == freezed
          ? _value.elapsedSeconds
          : elapsedSeconds // ignore: cast_nullable_to_non_nullable
              as double,
      pace: pace == freezed
          ? _value.pace
          : pace // ignore: cast_nullable_to_non_nullable
              as double,
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
      {List<double> longitudeList,
      List<double> latitudeList,
      double distance,
      double elapsedSeconds,
      double pace,
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
    Object? longitudeList = freezed,
    Object? latitudeList = freezed,
    Object? distance = freezed,
    Object? elapsedSeconds = freezed,
    Object? pace = freezed,
    Object? status = freezed,
  }) {
    return _then(_RunDetails(
      longitudeList: longitudeList == freezed
          ? _value.longitudeList
          : longitudeList // ignore: cast_nullable_to_non_nullable
              as List<double>,
      latitudeList: latitudeList == freezed
          ? _value.latitudeList
          : latitudeList // ignore: cast_nullable_to_non_nullable
              as List<double>,
      distance: distance == freezed
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      elapsedSeconds: elapsedSeconds == freezed
          ? _value.elapsedSeconds
          : elapsedSeconds // ignore: cast_nullable_to_non_nullable
              as double,
      pace: pace == freezed
          ? _value.pace
          : pace // ignore: cast_nullable_to_non_nullable
              as double,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RunStatus,
    ));
  }
}

/// @nodoc

class _$_RunDetails implements _RunDetails {
  const _$_RunDetails(
      {this.longitudeList = const <double>[0],
      this.latitudeList = const <double>[0],
      this.distance = 0,
      this.elapsedSeconds = 0,
      this.pace = 0,
      this.status = RunStatus.unknown});

  @JsonKey(defaultValue: const <double>[0])
  @override
  final List<double> longitudeList;
  @JsonKey(defaultValue: const <double>[0])
  @override
  final List<double> latitudeList;
  @JsonKey(defaultValue: 0)
  @override
  final double distance;
  @JsonKey(defaultValue: 0)
  @override
  final double elapsedSeconds;
  @JsonKey(defaultValue: 0)
  @override
  final double pace;
  @JsonKey(defaultValue: RunStatus.unknown)
  @override
  final RunStatus status;

  @override
  String toString() {
    return 'RunDetailsModel(longitudeList: $longitudeList, latitudeList: $latitudeList, distance: $distance, elapsedSeconds: $elapsedSeconds, pace: $pace, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RunDetails &&
            (identical(other.longitudeList, longitudeList) ||
                const DeepCollectionEquality()
                    .equals(other.longitudeList, longitudeList)) &&
            (identical(other.latitudeList, latitudeList) ||
                const DeepCollectionEquality()
                    .equals(other.latitudeList, latitudeList)) &&
            (identical(other.distance, distance) ||
                const DeepCollectionEquality()
                    .equals(other.distance, distance)) &&
            (identical(other.elapsedSeconds, elapsedSeconds) ||
                const DeepCollectionEquality()
                    .equals(other.elapsedSeconds, elapsedSeconds)) &&
            (identical(other.pace, pace) ||
                const DeepCollectionEquality().equals(other.pace, pace)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(longitudeList) ^
      const DeepCollectionEquality().hash(latitudeList) ^
      const DeepCollectionEquality().hash(distance) ^
      const DeepCollectionEquality().hash(elapsedSeconds) ^
      const DeepCollectionEquality().hash(pace) ^
      const DeepCollectionEquality().hash(status);

  @JsonKey(ignore: true)
  @override
  _$RunDetailsCopyWith<_RunDetails> get copyWith =>
      __$RunDetailsCopyWithImpl<_RunDetails>(this, _$identity);
}

abstract class _RunDetails implements RunDetailsModel {
  const factory _RunDetails(
      {List<double> longitudeList,
      List<double> latitudeList,
      double distance,
      double elapsedSeconds,
      double pace,
      RunStatus status}) = _$_RunDetails;

  @override
  List<double> get longitudeList => throw _privateConstructorUsedError;
  @override
  List<double> get latitudeList => throw _privateConstructorUsedError;
  @override
  double get distance => throw _privateConstructorUsedError;
  @override
  double get elapsedSeconds => throw _privateConstructorUsedError;
  @override
  double get pace => throw _privateConstructorUsedError;
  @override
  RunStatus get status => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RunDetailsCopyWith<_RunDetails> get copyWith =>
      throw _privateConstructorUsedError;
}
