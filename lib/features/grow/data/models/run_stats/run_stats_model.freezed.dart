// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'run_stats_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RunDailyStatsModelTearOff {
  const _$RunDailyStatsModelTearOff();

  _RunDailyStats call(
      {required DateTime date,
      List<RunSessionModel> runSessions = const <RunSessionModel>[]}) {
    return _RunDailyStats(
      date: date,
      runSessions: runSessions,
    );
  }
}

/// @nodoc
const $RunDailyStatsModel = _$RunDailyStatsModelTearOff();

/// @nodoc
mixin _$RunDailyStatsModel {
  DateTime get date => throw _privateConstructorUsedError;
  List<RunSessionModel> get runSessions => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RunDailyStatsModelCopyWith<RunDailyStatsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RunDailyStatsModelCopyWith<$Res> {
  factory $RunDailyStatsModelCopyWith(
          RunDailyStatsModel value, $Res Function(RunDailyStatsModel) then) =
      _$RunDailyStatsModelCopyWithImpl<$Res>;
  $Res call({DateTime date, List<RunSessionModel> runSessions});
}

/// @nodoc
class _$RunDailyStatsModelCopyWithImpl<$Res>
    implements $RunDailyStatsModelCopyWith<$Res> {
  _$RunDailyStatsModelCopyWithImpl(this._value, this._then);

  final RunDailyStatsModel _value;
  // ignore: unused_field
  final $Res Function(RunDailyStatsModel) _then;

  @override
  $Res call({
    Object? date = freezed,
    Object? runSessions = freezed,
  }) {
    return _then(_value.copyWith(
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      runSessions: runSessions == freezed
          ? _value.runSessions
          : runSessions // ignore: cast_nullable_to_non_nullable
              as List<RunSessionModel>,
    ));
  }
}

/// @nodoc
abstract class _$RunDailyStatsCopyWith<$Res>
    implements $RunDailyStatsModelCopyWith<$Res> {
  factory _$RunDailyStatsCopyWith(
          _RunDailyStats value, $Res Function(_RunDailyStats) then) =
      __$RunDailyStatsCopyWithImpl<$Res>;
  @override
  $Res call({DateTime date, List<RunSessionModel> runSessions});
}

/// @nodoc
class __$RunDailyStatsCopyWithImpl<$Res>
    extends _$RunDailyStatsModelCopyWithImpl<$Res>
    implements _$RunDailyStatsCopyWith<$Res> {
  __$RunDailyStatsCopyWithImpl(
      _RunDailyStats _value, $Res Function(_RunDailyStats) _then)
      : super(_value, (v) => _then(v as _RunDailyStats));

  @override
  _RunDailyStats get _value => super._value as _RunDailyStats;

  @override
  $Res call({
    Object? date = freezed,
    Object? runSessions = freezed,
  }) {
    return _then(_RunDailyStats(
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      runSessions: runSessions == freezed
          ? _value.runSessions
          : runSessions // ignore: cast_nullable_to_non_nullable
              as List<RunSessionModel>,
    ));
  }
}

/// @nodoc

class _$_RunDailyStats extends _RunDailyStats {
  _$_RunDailyStats(
      {required this.date, this.runSessions = const <RunSessionModel>[]})
      : super._();

  @override
  final DateTime date;
  @JsonKey(defaultValue: const <RunSessionModel>[])
  @override
  final List<RunSessionModel> runSessions;

  @override
  String toString() {
    return 'RunDailyStatsModel(date: $date, runSessions: $runSessions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RunDailyStats &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.runSessions, runSessions) ||
                const DeepCollectionEquality()
                    .equals(other.runSessions, runSessions)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(runSessions);

  @JsonKey(ignore: true)
  @override
  _$RunDailyStatsCopyWith<_RunDailyStats> get copyWith =>
      __$RunDailyStatsCopyWithImpl<_RunDailyStats>(this, _$identity);
}

abstract class _RunDailyStats extends RunDailyStatsModel {
  factory _RunDailyStats(
      {required DateTime date,
      List<RunSessionModel> runSessions}) = _$_RunDailyStats;
  _RunDailyStats._() : super._();

  @override
  DateTime get date => throw _privateConstructorUsedError;
  @override
  List<RunSessionModel> get runSessions => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RunDailyStatsCopyWith<_RunDailyStats> get copyWith =>
      throw _privateConstructorUsedError;
}
