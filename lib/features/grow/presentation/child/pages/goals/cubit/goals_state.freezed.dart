// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'goals_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$GoalsStateTearOff {
  const _$GoalsStateTearOff();

  _GoalsState call({GoalsStatus status = GoalsStatus.loading}) {
    return _GoalsState(
      status: status,
    );
  }
}

/// @nodoc
const $GoalsState = _$GoalsStateTearOff();

/// @nodoc
mixin _$GoalsState {
  GoalsStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GoalsStateCopyWith<GoalsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoalsStateCopyWith<$Res> {
  factory $GoalsStateCopyWith(
          GoalsState value, $Res Function(GoalsState) then) =
      _$GoalsStateCopyWithImpl<$Res>;
  $Res call({GoalsStatus status});
}

/// @nodoc
class _$GoalsStateCopyWithImpl<$Res> implements $GoalsStateCopyWith<$Res> {
  _$GoalsStateCopyWithImpl(this._value, this._then);

  final GoalsState _value;
  // ignore: unused_field
  final $Res Function(GoalsState) _then;

  @override
  $Res call({
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as GoalsStatus,
    ));
  }
}

/// @nodoc
abstract class _$GoalsStateCopyWith<$Res> implements $GoalsStateCopyWith<$Res> {
  factory _$GoalsStateCopyWith(
          _GoalsState value, $Res Function(_GoalsState) then) =
      __$GoalsStateCopyWithImpl<$Res>;
  @override
  $Res call({GoalsStatus status});
}

/// @nodoc
class __$GoalsStateCopyWithImpl<$Res> extends _$GoalsStateCopyWithImpl<$Res>
    implements _$GoalsStateCopyWith<$Res> {
  __$GoalsStateCopyWithImpl(
      _GoalsState _value, $Res Function(_GoalsState) _then)
      : super(_value, (v) => _then(v as _GoalsState));

  @override
  _GoalsState get _value => super._value as _GoalsState;

  @override
  $Res call({
    Object? status = freezed,
  }) {
    return _then(_GoalsState(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as GoalsStatus,
    ));
  }
}

/// @nodoc

class _$_GoalsState implements _GoalsState {
  _$_GoalsState({this.status = GoalsStatus.loading});

  @JsonKey(defaultValue: GoalsStatus.loading)
  @override
  final GoalsStatus status;

  @override
  String toString() {
    return 'GoalsState(status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GoalsState &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(status);

  @JsonKey(ignore: true)
  @override
  _$GoalsStateCopyWith<_GoalsState> get copyWith =>
      __$GoalsStateCopyWithImpl<_GoalsState>(this, _$identity);
}

abstract class _GoalsState implements GoalsState {
  factory _GoalsState({GoalsStatus status}) = _$_GoalsState;

  @override
  GoalsStatus get status => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$GoalsStateCopyWith<_GoalsState> get copyWith =>
      throw _privateConstructorUsedError;
}
