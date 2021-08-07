// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$HomePageStateTearOff {
  const _$HomePageStateTearOff();

  _HomePageState call(
      {required ChildUserModel child,
      String? error,
      BuildInfo buildInfo = const BuildInfo(),
      HomeStateStatus status = HomeStateStatus.loading}) {
    return _HomePageState(
      child: child,
      error: error,
      buildInfo: buildInfo,
      status: status,
    );
  }
}

/// @nodoc
const $HomePageState = _$HomePageStateTearOff();

/// @nodoc
mixin _$HomePageState {
  ChildUserModel get child => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  BuildInfo get buildInfo => throw _privateConstructorUsedError;
  HomeStateStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomePageStateCopyWith<HomePageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomePageStateCopyWith<$Res> {
  factory $HomePageStateCopyWith(
          HomePageState value, $Res Function(HomePageState) then) =
      _$HomePageStateCopyWithImpl<$Res>;
  $Res call(
      {ChildUserModel child,
      String? error,
      BuildInfo buildInfo,
      HomeStateStatus status});
}

/// @nodoc
class _$HomePageStateCopyWithImpl<$Res>
    implements $HomePageStateCopyWith<$Res> {
  _$HomePageStateCopyWithImpl(this._value, this._then);

  final HomePageState _value;
  // ignore: unused_field
  final $Res Function(HomePageState) _then;

  @override
  $Res call({
    Object? child = freezed,
    Object? error = freezed,
    Object? buildInfo = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      child: child == freezed
          ? _value.child
          : child // ignore: cast_nullable_to_non_nullable
              as ChildUserModel,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      buildInfo: buildInfo == freezed
          ? _value.buildInfo
          : buildInfo // ignore: cast_nullable_to_non_nullable
              as BuildInfo,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as HomeStateStatus,
    ));
  }
}

/// @nodoc
abstract class _$HomePageStateCopyWith<$Res>
    implements $HomePageStateCopyWith<$Res> {
  factory _$HomePageStateCopyWith(
          _HomePageState value, $Res Function(_HomePageState) then) =
      __$HomePageStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {ChildUserModel child,
      String? error,
      BuildInfo buildInfo,
      HomeStateStatus status});
}

/// @nodoc
class __$HomePageStateCopyWithImpl<$Res>
    extends _$HomePageStateCopyWithImpl<$Res>
    implements _$HomePageStateCopyWith<$Res> {
  __$HomePageStateCopyWithImpl(
      _HomePageState _value, $Res Function(_HomePageState) _then)
      : super(_value, (v) => _then(v as _HomePageState));

  @override
  _HomePageState get _value => super._value as _HomePageState;

  @override
  $Res call({
    Object? child = freezed,
    Object? error = freezed,
    Object? buildInfo = freezed,
    Object? status = freezed,
  }) {
    return _then(_HomePageState(
      child: child == freezed
          ? _value.child
          : child // ignore: cast_nullable_to_non_nullable
              as ChildUserModel,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      buildInfo: buildInfo == freezed
          ? _value.buildInfo
          : buildInfo // ignore: cast_nullable_to_non_nullable
              as BuildInfo,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as HomeStateStatus,
    ));
  }
}

/// @nodoc

class _$_HomePageState implements _HomePageState {
  _$_HomePageState(
      {required this.child,
      this.error,
      this.buildInfo = const BuildInfo(),
      this.status = HomeStateStatus.loading});

  @override
  final ChildUserModel child;
  @override
  final String? error;
  @JsonKey(defaultValue: const BuildInfo())
  @override
  final BuildInfo buildInfo;
  @JsonKey(defaultValue: HomeStateStatus.loading)
  @override
  final HomeStateStatus status;

  @override
  String toString() {
    return 'HomePageState(child: $child, error: $error, buildInfo: $buildInfo, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _HomePageState &&
            (identical(other.child, child) ||
                const DeepCollectionEquality().equals(other.child, child)) &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.buildInfo, buildInfo) ||
                const DeepCollectionEquality()
                    .equals(other.buildInfo, buildInfo)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(child) ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(buildInfo) ^
      const DeepCollectionEquality().hash(status);

  @JsonKey(ignore: true)
  @override
  _$HomePageStateCopyWith<_HomePageState> get copyWith =>
      __$HomePageStateCopyWithImpl<_HomePageState>(this, _$identity);
}

abstract class _HomePageState implements HomePageState {
  factory _HomePageState(
      {required ChildUserModel child,
      String? error,
      BuildInfo buildInfo,
      HomeStateStatus status}) = _$_HomePageState;

  @override
  ChildUserModel get child => throw _privateConstructorUsedError;
  @override
  String? get error => throw _privateConstructorUsedError;
  @override
  BuildInfo get buildInfo => throw _privateConstructorUsedError;
  @override
  HomeStateStatus get status => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$HomePageStateCopyWith<_HomePageState> get copyWith =>
      throw _privateConstructorUsedError;
}
