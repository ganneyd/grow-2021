// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'route_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RoutePageStateTearOff {
  const _$RoutePageStateTearOff();

  _RoutePageState call({RoutePageStatus status = RoutePageStatus.loading}) {
    return _RoutePageState(
      status: status,
    );
  }
}

/// @nodoc
const $RoutePageState = _$RoutePageStateTearOff();

/// @nodoc
mixin _$RoutePageState {
  RoutePageStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RoutePageStateCopyWith<RoutePageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoutePageStateCopyWith<$Res> {
  factory $RoutePageStateCopyWith(
          RoutePageState value, $Res Function(RoutePageState) then) =
      _$RoutePageStateCopyWithImpl<$Res>;
  $Res call({RoutePageStatus status});
}

/// @nodoc
class _$RoutePageStateCopyWithImpl<$Res>
    implements $RoutePageStateCopyWith<$Res> {
  _$RoutePageStateCopyWithImpl(this._value, this._then);

  final RoutePageState _value;
  // ignore: unused_field
  final $Res Function(RoutePageState) _then;

  @override
  $Res call({
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RoutePageStatus,
    ));
  }
}

/// @nodoc
abstract class _$RoutePageStateCopyWith<$Res>
    implements $RoutePageStateCopyWith<$Res> {
  factory _$RoutePageStateCopyWith(
          _RoutePageState value, $Res Function(_RoutePageState) then) =
      __$RoutePageStateCopyWithImpl<$Res>;
  @override
  $Res call({RoutePageStatus status});
}

/// @nodoc
class __$RoutePageStateCopyWithImpl<$Res>
    extends _$RoutePageStateCopyWithImpl<$Res>
    implements _$RoutePageStateCopyWith<$Res> {
  __$RoutePageStateCopyWithImpl(
      _RoutePageState _value, $Res Function(_RoutePageState) _then)
      : super(_value, (v) => _then(v as _RoutePageState));

  @override
  _RoutePageState get _value => super._value as _RoutePageState;

  @override
  $Res call({
    Object? status = freezed,
  }) {
    return _then(_RoutePageState(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RoutePageStatus,
    ));
  }
}

/// @nodoc

class _$_RoutePageState implements _RoutePageState {
  _$_RoutePageState({this.status = RoutePageStatus.loading});

  @JsonKey(defaultValue: RoutePageStatus.loading)
  @override
  final RoutePageStatus status;

  @override
  String toString() {
    return 'RoutePageState(status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RoutePageState &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(status);

  @JsonKey(ignore: true)
  @override
  _$RoutePageStateCopyWith<_RoutePageState> get copyWith =>
      __$RoutePageStateCopyWithImpl<_RoutePageState>(this, _$identity);
}

abstract class _RoutePageState implements RoutePageState {
  factory _RoutePageState({RoutePageStatus status}) = _$_RoutePageState;

  @override
  RoutePageStatus get status => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RoutePageStateCopyWith<_RoutePageState> get copyWith =>
      throw _privateConstructorUsedError;
}
