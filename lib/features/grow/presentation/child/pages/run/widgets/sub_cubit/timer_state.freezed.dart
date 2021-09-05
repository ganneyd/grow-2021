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
      required ElapsedTimeModel elapsedTimeModel,
      required RunDetailsModel runDetailsModel}) {
    return _TimerState(
      status: status,
      isTimerRunning: isTimerRunning,
      elapsedTimeModel: elapsedTimeModel,
      runDetailsModel: runDetailsModel,
    );
  }
}

/// @nodoc
const $TimerState = _$TimerStateTearOff();

/// @nodoc
mixin _$TimerState {
  TimerStatus get status => throw _privateConstructorUsedError;
  bool get isTimerRunning => throw _privateConstructorUsedError;
  ElapsedTimeModel get elapsedTimeModel => throw _privateConstructorUsedError;
  RunDetailsModel get runDetailsModel => throw _privateConstructorUsedError;

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
      ElapsedTimeModel elapsedTimeModel,
      RunDetailsModel runDetailsModel});

  $ElapsedTimeModelCopyWith<$Res> get elapsedTimeModel;
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
    Object? elapsedTimeModel = freezed,
    Object? runDetailsModel = freezed,
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
      elapsedTimeModel: elapsedTimeModel == freezed
          ? _value.elapsedTimeModel
          : elapsedTimeModel // ignore: cast_nullable_to_non_nullable
              as ElapsedTimeModel,
      runDetailsModel: runDetailsModel == freezed
          ? _value.runDetailsModel
          : runDetailsModel // ignore: cast_nullable_to_non_nullable
              as RunDetailsModel,
    ));
  }

  @override
  $ElapsedTimeModelCopyWith<$Res> get elapsedTimeModel {
    return $ElapsedTimeModelCopyWith<$Res>(_value.elapsedTimeModel, (value) {
      return _then(_value.copyWith(elapsedTimeModel: value));
    });
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
      ElapsedTimeModel elapsedTimeModel,
      RunDetailsModel runDetailsModel});

  @override
  $ElapsedTimeModelCopyWith<$Res> get elapsedTimeModel;
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
    Object? elapsedTimeModel = freezed,
    Object? runDetailsModel = freezed,
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
      elapsedTimeModel: elapsedTimeModel == freezed
          ? _value.elapsedTimeModel
          : elapsedTimeModel // ignore: cast_nullable_to_non_nullable
              as ElapsedTimeModel,
      runDetailsModel: runDetailsModel == freezed
          ? _value.runDetailsModel
          : runDetailsModel // ignore: cast_nullable_to_non_nullable
              as RunDetailsModel,
    ));
  }
}

/// @nodoc

class _$_TimerState implements _TimerState {
  _$_TimerState(
      {this.status = TimerStatus.fresh,
      this.isTimerRunning = false,
      required this.elapsedTimeModel,
      required this.runDetailsModel});

  @JsonKey(defaultValue: TimerStatus.fresh)
  @override
  final TimerStatus status;
  @JsonKey(defaultValue: false)
  @override
  final bool isTimerRunning;
  @override
  final ElapsedTimeModel elapsedTimeModel;
  @override
  final RunDetailsModel runDetailsModel;

  @override
  String toString() {
    return 'TimerState(status: $status, isTimerRunning: $isTimerRunning, elapsedTimeModel: $elapsedTimeModel, runDetailsModel: $runDetailsModel)';
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
            (identical(other.elapsedTimeModel, elapsedTimeModel) ||
                const DeepCollectionEquality()
                    .equals(other.elapsedTimeModel, elapsedTimeModel)) &&
            (identical(other.runDetailsModel, runDetailsModel) ||
                const DeepCollectionEquality()
                    .equals(other.runDetailsModel, runDetailsModel)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(isTimerRunning) ^
      const DeepCollectionEquality().hash(elapsedTimeModel) ^
      const DeepCollectionEquality().hash(runDetailsModel);

  @JsonKey(ignore: true)
  @override
  _$TimerStateCopyWith<_TimerState> get copyWith =>
      __$TimerStateCopyWithImpl<_TimerState>(this, _$identity);
}

abstract class _TimerState implements TimerState {
  factory _TimerState(
      {TimerStatus status,
      bool isTimerRunning,
      required ElapsedTimeModel elapsedTimeModel,
      required RunDetailsModel runDetailsModel}) = _$_TimerState;

  @override
  TimerStatus get status => throw _privateConstructorUsedError;
  @override
  bool get isTimerRunning => throw _privateConstructorUsedError;
  @override
  ElapsedTimeModel get elapsedTimeModel => throw _privateConstructorUsedError;
  @override
  RunDetailsModel get runDetailsModel => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TimerStateCopyWith<_TimerState> get copyWith =>
      throw _privateConstructorUsedError;
}
