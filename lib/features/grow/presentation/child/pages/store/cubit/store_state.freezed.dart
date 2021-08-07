// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'store_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$StoreStateTearOff {
  const _$StoreStateTearOff();

  _StoreState call({StoreStatus status = StoreStatus.loading}) {
    return _StoreState(
      status: status,
    );
  }
}

/// @nodoc
const $StoreState = _$StoreStateTearOff();

/// @nodoc
mixin _$StoreState {
  StoreStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StoreStateCopyWith<StoreState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreStateCopyWith<$Res> {
  factory $StoreStateCopyWith(
          StoreState value, $Res Function(StoreState) then) =
      _$StoreStateCopyWithImpl<$Res>;
  $Res call({StoreStatus status});
}

/// @nodoc
class _$StoreStateCopyWithImpl<$Res> implements $StoreStateCopyWith<$Res> {
  _$StoreStateCopyWithImpl(this._value, this._then);

  final StoreState _value;
  // ignore: unused_field
  final $Res Function(StoreState) _then;

  @override
  $Res call({
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StoreStatus,
    ));
  }
}

/// @nodoc
abstract class _$StoreStateCopyWith<$Res> implements $StoreStateCopyWith<$Res> {
  factory _$StoreStateCopyWith(
          _StoreState value, $Res Function(_StoreState) then) =
      __$StoreStateCopyWithImpl<$Res>;
  @override
  $Res call({StoreStatus status});
}

/// @nodoc
class __$StoreStateCopyWithImpl<$Res> extends _$StoreStateCopyWithImpl<$Res>
    implements _$StoreStateCopyWith<$Res> {
  __$StoreStateCopyWithImpl(
      _StoreState _value, $Res Function(_StoreState) _then)
      : super(_value, (v) => _then(v as _StoreState));

  @override
  _StoreState get _value => super._value as _StoreState;

  @override
  $Res call({
    Object? status = freezed,
  }) {
    return _then(_StoreState(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StoreStatus,
    ));
  }
}

/// @nodoc

class _$_StoreState implements _StoreState {
  _$_StoreState({this.status = StoreStatus.loading});

  @JsonKey(defaultValue: StoreStatus.loading)
  @override
  final StoreStatus status;

  @override
  String toString() {
    return 'StoreState(status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _StoreState &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(status);

  @JsonKey(ignore: true)
  @override
  _$StoreStateCopyWith<_StoreState> get copyWith =>
      __$StoreStateCopyWithImpl<_StoreState>(this, _$identity);
}

abstract class _StoreState implements StoreState {
  factory _StoreState({StoreStatus status}) = _$_StoreState;

  @override
  StoreStatus get status => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$StoreStateCopyWith<_StoreState> get copyWith =>
      throw _privateConstructorUsedError;
}
