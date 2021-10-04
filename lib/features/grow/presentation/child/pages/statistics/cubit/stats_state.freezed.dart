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
      List<List<DailyChartData>> chartList = const <List<DailyChartData>>[],
      List<RunDailyStatsEntity> displayList = const <RunDailyStatsEntity>[],
      int maxDay = 0,
      int minDay = 0,
      int month = 0,
      int numberOfDays = 0,
      LevelDataModel levelDataModel = const LevelDataModel()}) {
    return _StatsState(
      errMsg: errMsg,
      status: status,
      chartList: chartList,
      displayList: displayList,
      maxDay: maxDay,
      minDay: minDay,
      month: month,
      numberOfDays: numberOfDays,
      levelDataModel: levelDataModel,
    );
  }
}

/// @nodoc
const $StatsState = _$StatsStateTearOff();

/// @nodoc
mixin _$StatsState {
  String get errMsg => throw _privateConstructorUsedError;
  StatsStatus get status => throw _privateConstructorUsedError;
  List<List<DailyChartData>> get chartList =>
      throw _privateConstructorUsedError;
  List<RunDailyStatsEntity> get displayList =>
      throw _privateConstructorUsedError;
  int get maxDay => throw _privateConstructorUsedError;
  int get minDay => throw _privateConstructorUsedError;
  int get month => throw _privateConstructorUsedError;
  int get numberOfDays => throw _privateConstructorUsedError;
  LevelDataModel get levelDataModel => throw _privateConstructorUsedError;

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
      List<List<DailyChartData>> chartList,
      List<RunDailyStatsEntity> displayList,
      int maxDay,
      int minDay,
      int month,
      int numberOfDays,
      LevelDataModel levelDataModel});

  $LevelDataModelCopyWith<$Res> get levelDataModel;
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
    Object? chartList = freezed,
    Object? displayList = freezed,
    Object? maxDay = freezed,
    Object? minDay = freezed,
    Object? month = freezed,
    Object? numberOfDays = freezed,
    Object? levelDataModel = freezed,
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
      chartList: chartList == freezed
          ? _value.chartList
          : chartList // ignore: cast_nullable_to_non_nullable
              as List<List<DailyChartData>>,
      displayList: displayList == freezed
          ? _value.displayList
          : displayList // ignore: cast_nullable_to_non_nullable
              as List<RunDailyStatsEntity>,
      maxDay: maxDay == freezed
          ? _value.maxDay
          : maxDay // ignore: cast_nullable_to_non_nullable
              as int,
      minDay: minDay == freezed
          ? _value.minDay
          : minDay // ignore: cast_nullable_to_non_nullable
              as int,
      month: month == freezed
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      numberOfDays: numberOfDays == freezed
          ? _value.numberOfDays
          : numberOfDays // ignore: cast_nullable_to_non_nullable
              as int,
      levelDataModel: levelDataModel == freezed
          ? _value.levelDataModel
          : levelDataModel // ignore: cast_nullable_to_non_nullable
              as LevelDataModel,
    ));
  }

  @override
  $LevelDataModelCopyWith<$Res> get levelDataModel {
    return $LevelDataModelCopyWith<$Res>(_value.levelDataModel, (value) {
      return _then(_value.copyWith(levelDataModel: value));
    });
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
      List<List<DailyChartData>> chartList,
      List<RunDailyStatsEntity> displayList,
      int maxDay,
      int minDay,
      int month,
      int numberOfDays,
      LevelDataModel levelDataModel});

  @override
  $LevelDataModelCopyWith<$Res> get levelDataModel;
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
    Object? chartList = freezed,
    Object? displayList = freezed,
    Object? maxDay = freezed,
    Object? minDay = freezed,
    Object? month = freezed,
    Object? numberOfDays = freezed,
    Object? levelDataModel = freezed,
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
      chartList: chartList == freezed
          ? _value.chartList
          : chartList // ignore: cast_nullable_to_non_nullable
              as List<List<DailyChartData>>,
      displayList: displayList == freezed
          ? _value.displayList
          : displayList // ignore: cast_nullable_to_non_nullable
              as List<RunDailyStatsEntity>,
      maxDay: maxDay == freezed
          ? _value.maxDay
          : maxDay // ignore: cast_nullable_to_non_nullable
              as int,
      minDay: minDay == freezed
          ? _value.minDay
          : minDay // ignore: cast_nullable_to_non_nullable
              as int,
      month: month == freezed
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      numberOfDays: numberOfDays == freezed
          ? _value.numberOfDays
          : numberOfDays // ignore: cast_nullable_to_non_nullable
              as int,
      levelDataModel: levelDataModel == freezed
          ? _value.levelDataModel
          : levelDataModel // ignore: cast_nullable_to_non_nullable
              as LevelDataModel,
    ));
  }
}

/// @nodoc

class _$_StatsState implements _StatsState {
  _$_StatsState(
      {this.errMsg = '',
      this.status = StatsStatus.loading,
      this.chartList = const <List<DailyChartData>>[],
      this.displayList = const <RunDailyStatsEntity>[],
      this.maxDay = 0,
      this.minDay = 0,
      this.month = 0,
      this.numberOfDays = 0,
      this.levelDataModel = const LevelDataModel()});

  @JsonKey(defaultValue: '')
  @override
  final String errMsg;
  @JsonKey(defaultValue: StatsStatus.loading)
  @override
  final StatsStatus status;
  @JsonKey(defaultValue: const <List<DailyChartData>>[])
  @override
  final List<List<DailyChartData>> chartList;
  @JsonKey(defaultValue: const <RunDailyStatsEntity>[])
  @override
  final List<RunDailyStatsEntity> displayList;
  @JsonKey(defaultValue: 0)
  @override
  final int maxDay;
  @JsonKey(defaultValue: 0)
  @override
  final int minDay;
  @JsonKey(defaultValue: 0)
  @override
  final int month;
  @JsonKey(defaultValue: 0)
  @override
  final int numberOfDays;
  @JsonKey(defaultValue: LevelDataModel)
  @override
  final LevelDataModel levelDataModel;

  @override
  String toString() {
    return 'StatsState(errMsg: $errMsg, status: $status, chartList: $chartList, displayList: $displayList, maxDay: $maxDay, minDay: $minDay, month: $month, numberOfDays: $numberOfDays, levelDataModel: $levelDataModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _StatsState &&
            (identical(other.errMsg, errMsg) ||
                const DeepCollectionEquality().equals(other.errMsg, errMsg)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.chartList, chartList) ||
                const DeepCollectionEquality()
                    .equals(other.chartList, chartList)) &&
            (identical(other.displayList, displayList) ||
                const DeepCollectionEquality()
                    .equals(other.displayList, displayList)) &&
            (identical(other.maxDay, maxDay) ||
                const DeepCollectionEquality().equals(other.maxDay, maxDay)) &&
            (identical(other.minDay, minDay) ||
                const DeepCollectionEquality().equals(other.minDay, minDay)) &&
            (identical(other.month, month) ||
                const DeepCollectionEquality().equals(other.month, month)) &&
            (identical(other.numberOfDays, numberOfDays) ||
                const DeepCollectionEquality()
                    .equals(other.numberOfDays, numberOfDays)) &&
            (identical(other.levelDataModel, levelDataModel) ||
                const DeepCollectionEquality()
                    .equals(other.levelDataModel, levelDataModel)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(errMsg) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(chartList) ^
      const DeepCollectionEquality().hash(displayList) ^
      const DeepCollectionEquality().hash(maxDay) ^
      const DeepCollectionEquality().hash(minDay) ^
      const DeepCollectionEquality().hash(month) ^
      const DeepCollectionEquality().hash(numberOfDays) ^
      const DeepCollectionEquality().hash(levelDataModel);

  @JsonKey(ignore: true)
  @override
  _$StatsStateCopyWith<_StatsState> get copyWith =>
      __$StatsStateCopyWithImpl<_StatsState>(this, _$identity);
}

abstract class _StatsState implements StatsState {
  factory _StatsState(
      {String errMsg,
      StatsStatus status,
      List<List<DailyChartData>> chartList,
      List<RunDailyStatsEntity> displayList,
      int maxDay,
      int minDay,
      int month,
      int numberOfDays,
      LevelDataModel levelDataModel}) = _$_StatsState;

  @override
  String get errMsg => throw _privateConstructorUsedError;
  @override
  StatsStatus get status => throw _privateConstructorUsedError;
  @override
  List<List<DailyChartData>> get chartList =>
      throw _privateConstructorUsedError;
  @override
  List<RunDailyStatsEntity> get displayList =>
      throw _privateConstructorUsedError;
  @override
  int get maxDay => throw _privateConstructorUsedError;
  @override
  int get minDay => throw _privateConstructorUsedError;
  @override
  int get month => throw _privateConstructorUsedError;
  @override
  int get numberOfDays => throw _privateConstructorUsedError;
  @override
  LevelDataModel get levelDataModel => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$StatsStateCopyWith<_StatsState> get copyWith =>
      throw _privateConstructorUsedError;
}
