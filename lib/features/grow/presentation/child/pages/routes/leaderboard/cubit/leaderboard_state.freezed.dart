// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'leaderboard_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LeaderboardStateTearOff {
  const _$LeaderboardStateTearOff();

  _LeaderboardState call(
      {LeaderboardStatus status = LeaderboardStatus.loading}) {
    return _LeaderboardState(
      status: status,
    );
  }
}

/// @nodoc
const $LeaderboardState = _$LeaderboardStateTearOff();

/// @nodoc
mixin _$LeaderboardState {
  LeaderboardStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LeaderboardStateCopyWith<LeaderboardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeaderboardStateCopyWith<$Res> {
  factory $LeaderboardStateCopyWith(
          LeaderboardState value, $Res Function(LeaderboardState) then) =
      _$LeaderboardStateCopyWithImpl<$Res>;
  $Res call({LeaderboardStatus status});
}

/// @nodoc
class _$LeaderboardStateCopyWithImpl<$Res>
    implements $LeaderboardStateCopyWith<$Res> {
  _$LeaderboardStateCopyWithImpl(this._value, this._then);

  final LeaderboardState _value;
  // ignore: unused_field
  final $Res Function(LeaderboardState) _then;

  @override
  $Res call({
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LeaderboardStatus,
    ));
  }
}

/// @nodoc
abstract class _$LeaderboardStateCopyWith<$Res>
    implements $LeaderboardStateCopyWith<$Res> {
  factory _$LeaderboardStateCopyWith(
          _LeaderboardState value, $Res Function(_LeaderboardState) then) =
      __$LeaderboardStateCopyWithImpl<$Res>;
  @override
  $Res call({LeaderboardStatus status});
}

/// @nodoc
class __$LeaderboardStateCopyWithImpl<$Res>
    extends _$LeaderboardStateCopyWithImpl<$Res>
    implements _$LeaderboardStateCopyWith<$Res> {
  __$LeaderboardStateCopyWithImpl(
      _LeaderboardState _value, $Res Function(_LeaderboardState) _then)
      : super(_value, (v) => _then(v as _LeaderboardState));

  @override
  _LeaderboardState get _value => super._value as _LeaderboardState;

  @override
  $Res call({
    Object? status = freezed,
  }) {
    return _then(_LeaderboardState(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LeaderboardStatus,
    ));
  }
}

/// @nodoc

class _$_LeaderboardState implements _LeaderboardState {
  _$_LeaderboardState({this.status = LeaderboardStatus.loading});

  @JsonKey(defaultValue: LeaderboardStatus.loading)
  @override
  final LeaderboardStatus status;

  @override
  String toString() {
    return 'LeaderboardState(status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LeaderboardState &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(status);

  @JsonKey(ignore: true)
  @override
  _$LeaderboardStateCopyWith<_LeaderboardState> get copyWith =>
      __$LeaderboardStateCopyWithImpl<_LeaderboardState>(this, _$identity);
}

abstract class _LeaderboardState implements LeaderboardState {
  factory _LeaderboardState({LeaderboardStatus status}) = _$_LeaderboardState;

  @override
  LeaderboardStatus get status => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LeaderboardStateCopyWith<_LeaderboardState> get copyWith =>
      throw _privateConstructorUsedError;
}
