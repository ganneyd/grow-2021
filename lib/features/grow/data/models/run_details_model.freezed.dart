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
      {PreviousModel previous =
          const PreviousModel(latitude: 0, longitude: 0, distance: 0),
      double pace = 0,
      ElapsedTimeModel elapsedTime = const ElapsedTimeModel(
          hours: '0', milliseconds: '0', minutes: '0', seconds: '0'),
      RunStatus status = RunStatus.unknown}) {
    return _RunDetails(
      previous: previous,
      pace: pace,
      elapsedTime: elapsedTime,
      status: status,
    );
  }
}

/// @nodoc
const $RunDetailsModel = _$RunDetailsModelTearOff();

/// @nodoc
mixin _$RunDetailsModel {
  PreviousModel get previous => throw _privateConstructorUsedError;
  double get pace => throw _privateConstructorUsedError;
  ElapsedTimeModel get elapsedTime => throw _privateConstructorUsedError;
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
      {PreviousModel previous,
      double pace,
      ElapsedTimeModel elapsedTime,
      RunStatus status});

  $PreviousModelCopyWith<$Res> get previous;
  $ElapsedTimeModelCopyWith<$Res> get elapsedTime;
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
    Object? previous = freezed,
    Object? pace = freezed,
    Object? elapsedTime = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      previous: previous == freezed
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as PreviousModel,
      pace: pace == freezed
          ? _value.pace
          : pace // ignore: cast_nullable_to_non_nullable
              as double,
      elapsedTime: elapsedTime == freezed
          ? _value.elapsedTime
          : elapsedTime // ignore: cast_nullable_to_non_nullable
              as ElapsedTimeModel,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RunStatus,
    ));
  }

  @override
  $PreviousModelCopyWith<$Res> get previous {
    return $PreviousModelCopyWith<$Res>(_value.previous, (value) {
      return _then(_value.copyWith(previous: value));
    });
  }

  @override
  $ElapsedTimeModelCopyWith<$Res> get elapsedTime {
    return $ElapsedTimeModelCopyWith<$Res>(_value.elapsedTime, (value) {
      return _then(_value.copyWith(elapsedTime: value));
    });
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
      {PreviousModel previous,
      double pace,
      ElapsedTimeModel elapsedTime,
      RunStatus status});

  @override
  $PreviousModelCopyWith<$Res> get previous;
  @override
  $ElapsedTimeModelCopyWith<$Res> get elapsedTime;
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
    Object? previous = freezed,
    Object? pace = freezed,
    Object? elapsedTime = freezed,
    Object? status = freezed,
  }) {
    return _then(_RunDetails(
      previous: previous == freezed
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as PreviousModel,
      pace: pace == freezed
          ? _value.pace
          : pace // ignore: cast_nullable_to_non_nullable
              as double,
      elapsedTime: elapsedTime == freezed
          ? _value.elapsedTime
          : elapsedTime // ignore: cast_nullable_to_non_nullable
              as ElapsedTimeModel,
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
      {this.previous =
          const PreviousModel(latitude: 0, longitude: 0, distance: 0),
      this.pace = 0,
      this.elapsedTime = const ElapsedTimeModel(
          hours: '0', milliseconds: '0', minutes: '0', seconds: '0'),
      this.status = RunStatus.unknown});

  @JsonKey(defaultValue: PreviousModel)
  @override
  final PreviousModel previous;
  @JsonKey(defaultValue: 0)
  @override
  final double pace;
  @JsonKey(defaultValue: ElapsedTimeModel)
  @override
  final ElapsedTimeModel elapsedTime;
  @JsonKey(defaultValue: RunStatus.unknown)
  @override
  final RunStatus status;

  @override
  String toString() {
    return 'RunDetailsModel(previous: $previous, pace: $pace, elapsedTime: $elapsedTime, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RunDetails &&
            (identical(other.previous, previous) ||
                const DeepCollectionEquality()
                    .equals(other.previous, previous)) &&
            (identical(other.pace, pace) ||
                const DeepCollectionEquality().equals(other.pace, pace)) &&
            (identical(other.elapsedTime, elapsedTime) ||
                const DeepCollectionEquality()
                    .equals(other.elapsedTime, elapsedTime)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(previous) ^
      const DeepCollectionEquality().hash(pace) ^
      const DeepCollectionEquality().hash(elapsedTime) ^
      const DeepCollectionEquality().hash(status);

  @JsonKey(ignore: true)
  @override
  _$RunDetailsCopyWith<_RunDetails> get copyWith =>
      __$RunDetailsCopyWithImpl<_RunDetails>(this, _$identity);
}

abstract class _RunDetails implements RunDetailsModel {
  const factory _RunDetails(
      {PreviousModel previous,
      double pace,
      ElapsedTimeModel elapsedTime,
      RunStatus status}) = _$_RunDetails;

  @override
  PreviousModel get previous => throw _privateConstructorUsedError;
  @override
  double get pace => throw _privateConstructorUsedError;
  @override
  ElapsedTimeModel get elapsedTime => throw _privateConstructorUsedError;
  @override
  RunStatus get status => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RunDetailsCopyWith<_RunDetails> get copyWith =>
      throw _privateConstructorUsedError;
}
