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
class _$RunStatsModelTearOff {
  const _$RunStatsModelTearOff();

  _RunStats call(
      {required DateTime startDate,
      DateTime? endDate,
      double statValue = 0.0,
      String statName = 'no-name'}) {
    return _RunStats(
      startDate: startDate,
      endDate: endDate,
      statValue: statValue,
      statName: statName,
    );
  }
}

/// @nodoc
const $RunStatsModel = _$RunStatsModelTearOff();

/// @nodoc
mixin _$RunStatsModel {
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime? get endDate => throw _privateConstructorUsedError;
  double get statValue => throw _privateConstructorUsedError;
  String get statName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RunStatsModelCopyWith<RunStatsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RunStatsModelCopyWith<$Res> {
  factory $RunStatsModelCopyWith(
          RunStatsModel value, $Res Function(RunStatsModel) then) =
      _$RunStatsModelCopyWithImpl<$Res>;
  $Res call(
      {DateTime startDate,
      DateTime? endDate,
      double statValue,
      String statName});
}

/// @nodoc
class _$RunStatsModelCopyWithImpl<$Res>
    implements $RunStatsModelCopyWith<$Res> {
  _$RunStatsModelCopyWithImpl(this._value, this._then);

  final RunStatsModel _value;
  // ignore: unused_field
  final $Res Function(RunStatsModel) _then;

  @override
  $Res call({
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? statValue = freezed,
    Object? statName = freezed,
  }) {
    return _then(_value.copyWith(
      startDate: startDate == freezed
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: endDate == freezed
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      statValue: statValue == freezed
          ? _value.statValue
          : statValue // ignore: cast_nullable_to_non_nullable
              as double,
      statName: statName == freezed
          ? _value.statName
          : statName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$RunStatsCopyWith<$Res>
    implements $RunStatsModelCopyWith<$Res> {
  factory _$RunStatsCopyWith(_RunStats value, $Res Function(_RunStats) then) =
      __$RunStatsCopyWithImpl<$Res>;
  @override
  $Res call(
      {DateTime startDate,
      DateTime? endDate,
      double statValue,
      String statName});
}

/// @nodoc
class __$RunStatsCopyWithImpl<$Res> extends _$RunStatsModelCopyWithImpl<$Res>
    implements _$RunStatsCopyWith<$Res> {
  __$RunStatsCopyWithImpl(_RunStats _value, $Res Function(_RunStats) _then)
      : super(_value, (v) => _then(v as _RunStats));

  @override
  _RunStats get _value => super._value as _RunStats;

  @override
  $Res call({
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? statValue = freezed,
    Object? statName = freezed,
  }) {
    return _then(_RunStats(
      startDate: startDate == freezed
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: endDate == freezed
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      statValue: statValue == freezed
          ? _value.statValue
          : statValue // ignore: cast_nullable_to_non_nullable
              as double,
      statName: statName == freezed
          ? _value.statName
          : statName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_RunStats implements _RunStats {
  _$_RunStats(
      {required this.startDate,
      this.endDate,
      this.statValue = 0.0,
      this.statName = 'no-name'});

  @override
  final DateTime startDate;
  @override
  final DateTime? endDate;
  @JsonKey(defaultValue: 0.0)
  @override
  final double statValue;
  @JsonKey(defaultValue: 'no-name')
  @override
  final String statName;

  @override
  String toString() {
    return 'RunStatsModel(startDate: $startDate, endDate: $endDate, statValue: $statValue, statName: $statName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RunStats &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality()
                    .equals(other.startDate, startDate)) &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality()
                    .equals(other.endDate, endDate)) &&
            (identical(other.statValue, statValue) ||
                const DeepCollectionEquality()
                    .equals(other.statValue, statValue)) &&
            (identical(other.statName, statName) ||
                const DeepCollectionEquality()
                    .equals(other.statName, statName)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(endDate) ^
      const DeepCollectionEquality().hash(statValue) ^
      const DeepCollectionEquality().hash(statName);

  @JsonKey(ignore: true)
  @override
  _$RunStatsCopyWith<_RunStats> get copyWith =>
      __$RunStatsCopyWithImpl<_RunStats>(this, _$identity);
}

abstract class _RunStats implements RunStatsModel {
  factory _RunStats(
      {required DateTime startDate,
      DateTime? endDate,
      double statValue,
      String statName}) = _$_RunStats;

  @override
  DateTime get startDate => throw _privateConstructorUsedError;
  @override
  DateTime? get endDate => throw _privateConstructorUsedError;
  @override
  double get statValue => throw _privateConstructorUsedError;
  @override
  String get statName => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RunStatsCopyWith<_RunStats> get copyWith =>
      throw _privateConstructorUsedError;
}
