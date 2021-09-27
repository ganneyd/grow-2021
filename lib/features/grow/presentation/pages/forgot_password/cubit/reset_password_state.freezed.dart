// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'reset_password_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ResetPasswordPageStateTearOff {
  const _$ResetPasswordPageStateTearOff();

  _ResetPasswordPageState call(
      {ResetPasswordStatus status = ResetPasswordStatus.unknown}) {
    return _ResetPasswordPageState(
      status: status,
    );
  }
}

/// @nodoc
const $ResetPasswordPageState = _$ResetPasswordPageStateTearOff();

/// @nodoc
mixin _$ResetPasswordPageState {
  ResetPasswordStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ResetPasswordPageStateCopyWith<ResetPasswordPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResetPasswordPageStateCopyWith<$Res> {
  factory $ResetPasswordPageStateCopyWith(ResetPasswordPageState value,
          $Res Function(ResetPasswordPageState) then) =
      _$ResetPasswordPageStateCopyWithImpl<$Res>;
  $Res call({ResetPasswordStatus status});
}

/// @nodoc
class _$ResetPasswordPageStateCopyWithImpl<$Res>
    implements $ResetPasswordPageStateCopyWith<$Res> {
  _$ResetPasswordPageStateCopyWithImpl(this._value, this._then);

  final ResetPasswordPageState _value;
  // ignore: unused_field
  final $Res Function(ResetPasswordPageState) _then;

  @override
  $Res call({
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ResetPasswordStatus,
    ));
  }
}

/// @nodoc
abstract class _$ResetPasswordPageStateCopyWith<$Res>
    implements $ResetPasswordPageStateCopyWith<$Res> {
  factory _$ResetPasswordPageStateCopyWith(_ResetPasswordPageState value,
          $Res Function(_ResetPasswordPageState) then) =
      __$ResetPasswordPageStateCopyWithImpl<$Res>;
  @override
  $Res call({ResetPasswordStatus status});
}

/// @nodoc
class __$ResetPasswordPageStateCopyWithImpl<$Res>
    extends _$ResetPasswordPageStateCopyWithImpl<$Res>
    implements _$ResetPasswordPageStateCopyWith<$Res> {
  __$ResetPasswordPageStateCopyWithImpl(_ResetPasswordPageState _value,
      $Res Function(_ResetPasswordPageState) _then)
      : super(_value, (v) => _then(v as _ResetPasswordPageState));

  @override
  _ResetPasswordPageState get _value => super._value as _ResetPasswordPageState;

  @override
  $Res call({
    Object? status = freezed,
  }) {
    return _then(_ResetPasswordPageState(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ResetPasswordStatus,
    ));
  }
}

/// @nodoc

class _$_ResetPasswordPageState implements _ResetPasswordPageState {
  _$_ResetPasswordPageState({this.status = ResetPasswordStatus.unknown});

  @JsonKey(defaultValue: ResetPasswordStatus.unknown)
  @override
  final ResetPasswordStatus status;

  @override
  String toString() {
    return 'ResetPasswordPageState(status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ResetPasswordPageState &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(status);

  @JsonKey(ignore: true)
  @override
  _$ResetPasswordPageStateCopyWith<_ResetPasswordPageState> get copyWith =>
      __$ResetPasswordPageStateCopyWithImpl<_ResetPasswordPageState>(
          this, _$identity);
}

abstract class _ResetPasswordPageState implements ResetPasswordPageState {
  factory _ResetPasswordPageState({ResetPasswordStatus status}) =
      _$_ResetPasswordPageState;

  @override
  ResetPasswordStatus get status => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ResetPasswordPageStateCopyWith<_ResetPasswordPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
