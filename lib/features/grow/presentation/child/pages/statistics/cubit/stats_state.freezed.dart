// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'stats_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$StatsStateTearOff {
  const _$StatsStateTearOff();

  _StatsState call(
      {String errMsg = '',
      StatsStatus status = StatsStatus.loading,
      List<DistanceChartData> distanceStatsList =
          const <DistanceChartData>[]}) {
    return _StatsState(
      errMsg: errMsg,
      status: status,
      distanceStatsList: distanceStatsList,
    );
  }
}

/// @nodoc
const $StatsState = _$StatsStateTearOff();

/// @nodoc
mixin _$StatsState {
  String get errMsg => throw _privateConstructorUsedError;
  StatsStatus get status => throw _privateConstructorUsedError;
  List<DistanceChartData> get distanceStatsList =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StatsStateCopyWith<StatsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatsStateCopyWith<$Res> {
  factory $StatsStateCopyWith(
          StatsState value, $Res Function(StatsState) then) =
      _$StatsStateCopyWithImpl<$Res>;
  $Res call(
      {String errMsg,
      StatsStatus status,
      List<DistanceChartData> distanceStatsList});
}

/// @nodoc
class _$StatsStateCopyWithImpl<$Res> implements $StatsStateCopyWith<$Res> {
  _$StatsStateCopyWithImpl(this._value, this._then);

  final StatsState _value;
  // ignore: unused_field
  final $Res Function(StatsState) _then;

  @override
  $Res call({
    Object? errMsg = freezed,
    Object? status = freezed,
    Object? distanceStatsList = freezed,
  }) {
    return _then(_value.copyWith(
      errMsg: errMsg == freezed
          ? _value.errMsg
          : errMsg // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatsStatus,
      distanceStatsList: distanceStatsList == freezed
          ? _value.distanceStatsList
          : distanceStatsList // ignore: cast_nullable_to_non_nullable
              as List<DistanceChartData>,
    ));
  }
}

/// @nodoc
abstract class _$StatsStateCopyWith<$Res> implements $StatsStateCopyWith<$Res> {
  factory _$StatsStateCopyWith(
          _StatsState value, $Res Function(_StatsState) then) =
      __$StatsStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String errMsg,
      StatsStatus status,
      List<DistanceChartData> distanceStatsList});
}

/// @nodoc
class __$StatsStateCopyWithImpl<$Res> extends _$StatsStateCopyWithImpl<$Res>
    implements _$StatsStateCopyWith<$Res> {
  __$StatsStateCopyWithImpl(
      _StatsState _value, $Res Function(_StatsState) _then)
      : super(_value, (v) => _then(v as _StatsState));

  @override
  _StatsState get _value => super._value as _StatsState;

  @override
  $Res call({
    Object? errMsg = freezed,
    Object? status = freezed,
    Object? distanceStatsList = freezed,
  }) {
    return _then(_StatsState(
      errMsg: errMsg == freezed
          ? _value.errMsg
          : errMsg // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatsStatus,
      distanceStatsList: distanceStatsList == freezed
          ? _value.distanceStatsList
          : distanceStatsList // ignore: cast_nullable_to_non_nullable
              as List<DistanceChartData>,
    ));
  }
}

/// @nodoc

class _$_StatsState implements _StatsState {
  _$_StatsState(
      {this.errMsg = '',
      this.status = StatsStatus.loading,
      this.distanceStatsList = const <DistanceChartData>[]});

  @JsonKey(defaultValue: '')
  @override
  final String errMsg;
  @JsonKey(defaultValue: StatsStatus.loading)
  @override
  final StatsStatus status;
  @JsonKey(defaultValue: const <DistanceChartData>[])
  @override
  final List<DistanceChartData> distanceStatsList;

  @override
  String toString() {
    return 'StatsState(errMsg: $errMsg, status: $status, distanceStatsList: $distanceStatsList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _StatsState &&
            (identical(other.errMsg, errMsg) ||
                const DeepCollectionEquality().equals(other.errMsg, errMsg)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.distanceStatsList, distanceStatsList) ||
                const DeepCollectionEquality()
                    .equals(other.distanceStatsList, distanceStatsList)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(errMsg) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(distanceStatsList);

  @JsonKey(ignore: true)
  @override
  _$StatsStateCopyWith<_StatsState> get copyWith =>
      __$StatsStateCopyWithImpl<_StatsState>(this, _$identity);
}

abstract class _StatsState implements StatsState {
  factory _StatsState(
      {String errMsg,
      StatsStatus status,
      List<DistanceChartData> distanceStatsList}) = _$_StatsState;

  @override
  String get errMsg => throw _privateConstructorUsedError;
  @override
  StatsStatus get status => throw _privateConstructorUsedError;
  @override
  List<DistanceChartData> get distanceStatsList =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$StatsStateCopyWith<_StatsState> get copyWith =>
      throw _privateConstructorUsedError;
}
