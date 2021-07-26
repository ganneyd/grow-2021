// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LoginPageStateTearOff {
  const _$LoginPageStateTearOff();

  _LoginPageState call(
      {String? error, LoginStateStatus status = LoginStateStatus.unknown}) {
    return _LoginPageState(
      error: error,
      status: status,
    );
  }
}

/// @nodoc
const $LoginPageState = _$LoginPageStateTearOff();

/// @nodoc
mixin _$LoginPageState {
  String? get error => throw _privateConstructorUsedError;
  LoginStateStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginPageStateCopyWith<LoginPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginPageStateCopyWith<$Res> {
  factory $LoginPageStateCopyWith(
          LoginPageState value, $Res Function(LoginPageState) then) =
      _$LoginPageStateCopyWithImpl<$Res>;
  $Res call({String? error, LoginStateStatus status});
}

/// @nodoc
class _$LoginPageStateCopyWithImpl<$Res>
    implements $LoginPageStateCopyWith<$Res> {
  _$LoginPageStateCopyWithImpl(this._value, this._then);

  final LoginPageState _value;
  // ignore: unused_field
  final $Res Function(LoginPageState) _then;

  @override
  $Res call({
    Object? error = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LoginStateStatus,
    ));
  }
}

/// @nodoc
abstract class _$LoginPageStateCopyWith<$Res>
    implements $LoginPageStateCopyWith<$Res> {
  factory _$LoginPageStateCopyWith(
          _LoginPageState value, $Res Function(_LoginPageState) then) =
      __$LoginPageStateCopyWithImpl<$Res>;
  @override
  $Res call({String? error, LoginStateStatus status});
}

/// @nodoc
class __$LoginPageStateCopyWithImpl<$Res>
    extends _$LoginPageStateCopyWithImpl<$Res>
    implements _$LoginPageStateCopyWith<$Res> {
  __$LoginPageStateCopyWithImpl(
      _LoginPageState _value, $Res Function(_LoginPageState) _then)
      : super(_value, (v) => _then(v as _LoginPageState));

  @override
  _LoginPageState get _value => super._value as _LoginPageState;

  @override
  $Res call({
    Object? error = freezed,
    Object? status = freezed,
  }) {
    return _then(_LoginPageState(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LoginStateStatus,
    ));
  }
}

/// @nodoc

class _$_LoginPageState implements _LoginPageState {
  _$_LoginPageState({this.error, this.status = LoginStateStatus.unknown});

  @override
  final String? error;
  @JsonKey(defaultValue: LoginStateStatus.unknown)
  @override
  final LoginStateStatus status;

  @override
  String toString() {
    return 'LoginPageState(error: $error, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoginPageState &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(status);

  @JsonKey(ignore: true)
  @override
  _$LoginPageStateCopyWith<_LoginPageState> get copyWith =>
      __$LoginPageStateCopyWithImpl<_LoginPageState>(this, _$identity);
}

abstract class _LoginPageState implements LoginPageState {
  factory _LoginPageState({String? error, LoginStateStatus status}) =
      _$_LoginPageState;

  @override
  String? get error => throw _privateConstructorUsedError;
  @override
  LoginStateStatus get status => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LoginPageStateCopyWith<_LoginPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
