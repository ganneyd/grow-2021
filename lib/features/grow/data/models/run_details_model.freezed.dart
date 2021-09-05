// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'run_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RunSessionModel _$RunSessionModelFromJson(Map<String, dynamic> json) {
  return _RunSession.fromJson(json);
}

/// @nodoc
class _$RunSessionModelTearOff {
  const _$RunSessionModelTearOff();

  _RunSession call(
      {List<double> longitudeList = const <double>[0],
      List<double> latitudeList = const <double>[0],
      double distance = 0,
      double duration = 0,
      double pace = 0,
      String uid = '',
      required DateTime timeStamp,
      RunStatus status = RunStatus.unknown}) {
    return _RunSession(
      longitudeList: longitudeList,
      latitudeList: latitudeList,
      distance: distance,
      duration: duration,
      pace: pace,
      uid: uid,
      timeStamp: timeStamp,
      status: status,
    );
  }

  RunSessionModel fromJson(Map<String, Object> json) {
    return RunSessionModel.fromJson(json);
  }
}

/// @nodoc
const $RunSessionModel = _$RunSessionModelTearOff();

/// @nodoc
mixin _$RunSessionModel {
  List<double> get longitudeList => throw _privateConstructorUsedError;
  List<double> get latitudeList => throw _privateConstructorUsedError;
  double get distance => throw _privateConstructorUsedError;
  double get duration => throw _privateConstructorUsedError;
  double get pace => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  DateTime get timeStamp => throw _privateConstructorUsedError;
  RunStatus get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RunSessionModelCopyWith<RunSessionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RunSessionModelCopyWith<$Res> {
  factory $RunSessionModelCopyWith(
          RunSessionModel value, $Res Function(RunSessionModel) then) =
      _$RunSessionModelCopyWithImpl<$Res>;
  $Res call(
      {List<double> longitudeList,
      List<double> latitudeList,
      double distance,
      double duration,
      double pace,
      String uid,
      DateTime timeStamp,
      RunStatus status});
}

/// @nodoc
class _$RunSessionModelCopyWithImpl<$Res>
    implements $RunSessionModelCopyWith<$Res> {
  _$RunSessionModelCopyWithImpl(this._value, this._then);

  final RunSessionModel _value;
  // ignore: unused_field
  final $Res Function(RunSessionModel) _then;

  @override
  $Res call({
    Object? longitudeList = freezed,
    Object? latitudeList = freezed,
    Object? distance = freezed,
    Object? duration = freezed,
    Object? pace = freezed,
    Object? uid = freezed,
    Object? timeStamp = freezed,
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
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double,
      pace: pace == freezed
          ? _value.pace
          : pace // ignore: cast_nullable_to_non_nullable
              as double,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      timeStamp: timeStamp == freezed
          ? _value.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RunStatus,
    ));
  }
}

/// @nodoc
abstract class _$RunSessionCopyWith<$Res>
    implements $RunSessionModelCopyWith<$Res> {
  factory _$RunSessionCopyWith(
          _RunSession value, $Res Function(_RunSession) then) =
      __$RunSessionCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<double> longitudeList,
      List<double> latitudeList,
      double distance,
      double duration,
      double pace,
      String uid,
      DateTime timeStamp,
      RunStatus status});
}

/// @nodoc
class __$RunSessionCopyWithImpl<$Res>
    extends _$RunSessionModelCopyWithImpl<$Res>
    implements _$RunSessionCopyWith<$Res> {
  __$RunSessionCopyWithImpl(
      _RunSession _value, $Res Function(_RunSession) _then)
      : super(_value, (v) => _then(v as _RunSession));

  @override
  _RunSession get _value => super._value as _RunSession;

  @override
  $Res call({
    Object? longitudeList = freezed,
    Object? latitudeList = freezed,
    Object? distance = freezed,
    Object? duration = freezed,
    Object? pace = freezed,
    Object? uid = freezed,
    Object? timeStamp = freezed,
    Object? status = freezed,
  }) {
    return _then(_RunSession(
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
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double,
      pace: pace == freezed
          ? _value.pace
          : pace // ignore: cast_nullable_to_non_nullable
              as double,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      timeStamp: timeStamp == freezed
          ? _value.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RunStatus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RunSession implements _RunSession {
  const _$_RunSession(
      {this.longitudeList = const <double>[0],
      this.latitudeList = const <double>[0],
      this.distance = 0,
      this.duration = 0,
      this.pace = 0,
      this.uid = '',
      required this.timeStamp,
      this.status = RunStatus.unknown});

  factory _$_RunSession.fromJson(Map<String, dynamic> json) =>
      _$_$_RunSessionFromJson(json);

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
  final double duration;
  @JsonKey(defaultValue: 0)
  @override
  final double pace;
  @JsonKey(defaultValue: '')
  @override
  final String uid;
  @override
  final DateTime timeStamp;
  @JsonKey(defaultValue: RunStatus.unknown)
  @override
  final RunStatus status;

  @override
  String toString() {
    return 'RunSessionModel(longitudeList: $longitudeList, latitudeList: $latitudeList, distance: $distance, duration: $duration, pace: $pace, uid: $uid, timeStamp: $timeStamp, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RunSession &&
            (identical(other.longitudeList, longitudeList) ||
                const DeepCollectionEquality()
                    .equals(other.longitudeList, longitudeList)) &&
            (identical(other.latitudeList, latitudeList) ||
                const DeepCollectionEquality()
                    .equals(other.latitudeList, latitudeList)) &&
            (identical(other.distance, distance) ||
                const DeepCollectionEquality()
                    .equals(other.distance, distance)) &&
            (identical(other.duration, duration) ||
                const DeepCollectionEquality()
                    .equals(other.duration, duration)) &&
            (identical(other.pace, pace) ||
                const DeepCollectionEquality().equals(other.pace, pace)) &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)) &&
            (identical(other.timeStamp, timeStamp) ||
                const DeepCollectionEquality()
                    .equals(other.timeStamp, timeStamp)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(longitudeList) ^
      const DeepCollectionEquality().hash(latitudeList) ^
      const DeepCollectionEquality().hash(distance) ^
      const DeepCollectionEquality().hash(duration) ^
      const DeepCollectionEquality().hash(pace) ^
      const DeepCollectionEquality().hash(uid) ^
      const DeepCollectionEquality().hash(timeStamp) ^
      const DeepCollectionEquality().hash(status);

  @JsonKey(ignore: true)
  @override
  _$RunSessionCopyWith<_RunSession> get copyWith =>
      __$RunSessionCopyWithImpl<_RunSession>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RunSessionToJson(this);
  }
}

abstract class _RunSession implements RunSessionModel {
  const factory _RunSession(
      {List<double> longitudeList,
      List<double> latitudeList,
      double distance,
      double duration,
      double pace,
      String uid,
      required DateTime timeStamp,
      RunStatus status}) = _$_RunSession;

  factory _RunSession.fromJson(Map<String, dynamic> json) =
      _$_RunSession.fromJson;

  @override
  List<double> get longitudeList => throw _privateConstructorUsedError;
  @override
  List<double> get latitudeList => throw _privateConstructorUsedError;
  @override
  double get distance => throw _privateConstructorUsedError;
  @override
  double get duration => throw _privateConstructorUsedError;
  @override
  double get pace => throw _privateConstructorUsedError;
  @override
  String get uid => throw _privateConstructorUsedError;
  @override
  DateTime get timeStamp => throw _privateConstructorUsedError;
  @override
  RunStatus get status => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RunSessionCopyWith<_RunSession> get copyWith =>
      throw _privateConstructorUsedError;
}
