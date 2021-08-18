// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'timer_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TimerStateTearOff {
  const _$TimerStateTearOff();

  _TimerState call(
      {TimerStatus status = TimerStatus.fresh,
      bool isTimerRunning = false,
      Stream<RunDetailsModel>? runDetailsStream,
      Stream<ElapsedTimeModel>? timerStream}) {
    return _TimerState(
      status: status,
      isTimerRunning: isTimerRunning,
      runDetailsStream: runDetailsStream,
      timerStream: timerStream,
    );
  }
}

/// @nodoc
const $TimerState = _$TimerStateTearOff();

/// @nodoc
mixin _$TimerState {
  TimerStatus get status => throw _privateConstructorUsedError;
  bool get isTimerRunning => throw _privateConstructorUsedError;
  Stream<RunDetailsModel>? get runDetailsStream =>
      throw _privateConstructorUsedError;
  Stream<ElapsedTimeModel>? get timerStream =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TimerStateCopyWith<TimerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimerStateCopyWith<$Res> {
  factory $TimerStateCopyWith(
          TimerState value, $Res Function(TimerState) then) =
      _$TimerStateCopyWithImpl<$Res>;
  $Res call(
      {TimerStatus status,
      bool isTimerRunning,
      Stream<RunDetailsModel>? runDetailsStream,
      Stream<ElapsedTimeModel>? timerStream});
}

/// @nodoc
class _$TimerStateCopyWithImpl<$Res> implements $TimerStateCopyWith<$Res> {
  _$TimerStateCopyWithImpl(this._value, this._then);

  final TimerState _value;
  // ignore: unused_field
  final $Res Function(TimerState) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? isTimerRunning = freezed,
    Object? runDetailsStream = freezed,
    Object? timerStream = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TimerStatus,
      isTimerRunning: isTimerRunning == freezed
          ? _value.isTimerRunning
          : isTimerRunning // ignore: cast_nullable_to_non_nullable
              as bool,
      runDetailsStream: runDetailsStream == freezed
          ? _value.runDetailsStream
          : runDetailsStream // ignore: cast_nullable_to_non_nullable
              as Stream<RunDetailsModel>?,
      timerStream: timerStream == freezed
          ? _value.timerStream
          : timerStream // ignore: cast_nullable_to_non_nullable
              as Stream<ElapsedTimeModel>?,
    ));
  }
}

/// @nodoc
abstract class _$TimerStateCopyWith<$Res> implements $TimerStateCopyWith<$Res> {
  factory _$TimerStateCopyWith(
          _TimerState value, $Res Function(_TimerState) then) =
      __$TimerStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {TimerStatus status,
      bool isTimerRunning,
      Stream<RunDetailsModel>? runDetailsStream,
      Stream<ElapsedTimeModel>? timerStream});
}

/// @nodoc
class __$TimerStateCopyWithImpl<$Res> extends _$TimerStateCopyWithImpl<$Res>
    implements _$TimerStateCopyWith<$Res> {
  __$TimerStateCopyWithImpl(
      _TimerState _value, $Res Function(_TimerState) _then)
      : super(_value, (v) => _then(v as _TimerState));

  @override
  _TimerState get _value => super._value as _TimerState;

  @override
  $Res call({
    Object? status = freezed,
    Object? isTimerRunning = freezed,
    Object? runDetailsStream = freezed,
    Object? timerStream = freezed,
  }) {
    return _then(_TimerState(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TimerStatus,
      isTimerRunning: isTimerRunning == freezed
          ? _value.isTimerRunning
          : isTimerRunning // ignore: cast_nullable_to_non_nullable
              as bool,
      runDetailsStream: runDetailsStream == freezed
          ? _value.runDetailsStream
          : runDetailsStream // ignore: cast_nullable_to_non_nullable
              as Stream<RunDetailsModel>?,
      timerStream: timerStream == freezed
          ? _value.timerStream
          : timerStream // ignore: cast_nullable_to_non_nullable
              as Stream<ElapsedTimeModel>?,
    ));
  }
}

/// @nodoc

class _$_TimerState implements _TimerState {
  _$_TimerState(
      {this.status = TimerStatus.fresh,
      this.isTimerRunning = false,
      this.runDetailsStream,
      this.timerStream});

  @JsonKey(defaultValue: TimerStatus.fresh)
  @override
  final TimerStatus status;
  @JsonKey(defaultValue: false)
  @override
  final bool isTimerRunning;
  @override
  final Stream<RunDetailsModel>? runDetailsStream;
  @override
  final Stream<ElapsedTimeModel>? timerStream;

  @override
  String toString() {
    return 'TimerState(status: $status, isTimerRunning: $isTimerRunning, runDetailsStream: $runDetailsStream, timerStream: $timerStream)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TimerState &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.isTimerRunning, isTimerRunning) ||
                const DeepCollectionEquality()
                    .equals(other.isTimerRunning, isTimerRunning)) &&
            (identical(other.runDetailsStream, runDetailsStream) ||
                const DeepCollectionEquality()
                    .equals(other.runDetailsStream, runDetailsStream)) &&
            (identical(other.timerStream, timerStream) ||
                const DeepCollectionEquality()
                    .equals(other.timerStream, timerStream)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(isTimerRunning) ^
      const DeepCollectionEquality().hash(runDetailsStream) ^
      const DeepCollectionEquality().hash(timerStream);

  @JsonKey(ignore: true)
  @override
  _$TimerStateCopyWith<_TimerState> get copyWith =>
      __$TimerStateCopyWithImpl<_TimerState>(this, _$identity);
}

abstract class _TimerState implements TimerState {
  factory _TimerState(
      {TimerStatus status,
      bool isTimerRunning,
      Stream<RunDetailsModel>? runDetailsStream,
      Stream<ElapsedTimeModel>? timerStream}) = _$_TimerState;

  @override
  TimerStatus get status => throw _privateConstructorUsedError;
  @override
  bool get isTimerRunning => throw _privateConstructorUsedError;
  @override
  Stream<RunDetailsModel>? get runDetailsStream =>
      throw _privateConstructorUsedError;
  @override
  Stream<ElapsedTimeModel>? get timerStream =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TimerStateCopyWith<_TimerState> get copyWith =>
      throw _privateConstructorUsedError;
}