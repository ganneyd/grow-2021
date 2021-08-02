// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'goal_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$GoalEntityTearOff {
  const _$GoalEntityTearOff();

  _GoalEntity call(
      {GOAL_OCCURANCE goalOccurance = GOAL_OCCURANCE.unknown,
      GOAL_TYPE goalType = GOAL_TYPE.unknown,
      String name = 'goal-name',
      String description = 'goal-description',
      List<DateTime>? dateCompleted,
      DateTime? dateMade,
      double threshold = 0}) {
    return _GoalEntity(
      goalOccurance: goalOccurance,
      goalType: goalType,
      name: name,
      description: description,
      dateCompleted: dateCompleted,
      dateMade: dateMade,
      threshold: threshold,
    );
  }
}

/// @nodoc
const $GoalEntity = _$GoalEntityTearOff();

/// @nodoc
mixin _$GoalEntity {
  GOAL_OCCURANCE get goalOccurance => throw _privateConstructorUsedError;
  GOAL_TYPE get goalType => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<DateTime>? get dateCompleted => throw _privateConstructorUsedError;
  DateTime? get dateMade => throw _privateConstructorUsedError;
  double get threshold => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GoalEntityCopyWith<GoalEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoalEntityCopyWith<$Res> {
  factory $GoalEntityCopyWith(
          GoalEntity value, $Res Function(GoalEntity) then) =
      _$GoalEntityCopyWithImpl<$Res>;
  $Res call(
      {GOAL_OCCURANCE goalOccurance,
      GOAL_TYPE goalType,
      String name,
      String description,
      List<DateTime>? dateCompleted,
      DateTime? dateMade,
      double threshold});
}

/// @nodoc
class _$GoalEntityCopyWithImpl<$Res> implements $GoalEntityCopyWith<$Res> {
  _$GoalEntityCopyWithImpl(this._value, this._then);

  final GoalEntity _value;
  // ignore: unused_field
  final $Res Function(GoalEntity) _then;

  @override
  $Res call({
    Object? goalOccurance = freezed,
    Object? goalType = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? dateCompleted = freezed,
    Object? dateMade = freezed,
    Object? threshold = freezed,
  }) {
    return _then(_value.copyWith(
      goalOccurance: goalOccurance == freezed
          ? _value.goalOccurance
          : goalOccurance // ignore: cast_nullable_to_non_nullable
              as GOAL_OCCURANCE,
      goalType: goalType == freezed
          ? _value.goalType
          : goalType // ignore: cast_nullable_to_non_nullable
              as GOAL_TYPE,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      dateCompleted: dateCompleted == freezed
          ? _value.dateCompleted
          : dateCompleted // ignore: cast_nullable_to_non_nullable
              as List<DateTime>?,
      dateMade: dateMade == freezed
          ? _value.dateMade
          : dateMade // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      threshold: threshold == freezed
          ? _value.threshold
          : threshold // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$GoalEntityCopyWith<$Res> implements $GoalEntityCopyWith<$Res> {
  factory _$GoalEntityCopyWith(
          _GoalEntity value, $Res Function(_GoalEntity) then) =
      __$GoalEntityCopyWithImpl<$Res>;
  @override
  $Res call(
      {GOAL_OCCURANCE goalOccurance,
      GOAL_TYPE goalType,
      String name,
      String description,
      List<DateTime>? dateCompleted,
      DateTime? dateMade,
      double threshold});
}

/// @nodoc
class __$GoalEntityCopyWithImpl<$Res> extends _$GoalEntityCopyWithImpl<$Res>
    implements _$GoalEntityCopyWith<$Res> {
  __$GoalEntityCopyWithImpl(
      _GoalEntity _value, $Res Function(_GoalEntity) _then)
      : super(_value, (v) => _then(v as _GoalEntity));

  @override
  _GoalEntity get _value => super._value as _GoalEntity;

  @override
  $Res call({
    Object? goalOccurance = freezed,
    Object? goalType = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? dateCompleted = freezed,
    Object? dateMade = freezed,
    Object? threshold = freezed,
  }) {
    return _then(_GoalEntity(
      goalOccurance: goalOccurance == freezed
          ? _value.goalOccurance
          : goalOccurance // ignore: cast_nullable_to_non_nullable
              as GOAL_OCCURANCE,
      goalType: goalType == freezed
          ? _value.goalType
          : goalType // ignore: cast_nullable_to_non_nullable
              as GOAL_TYPE,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      dateCompleted: dateCompleted == freezed
          ? _value.dateCompleted
          : dateCompleted // ignore: cast_nullable_to_non_nullable
              as List<DateTime>?,
      dateMade: dateMade == freezed
          ? _value.dateMade
          : dateMade // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      threshold: threshold == freezed
          ? _value.threshold
          : threshold // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_GoalEntity with DiagnosticableTreeMixin implements _GoalEntity {
  _$_GoalEntity(
      {this.goalOccurance = GOAL_OCCURANCE.unknown,
      this.goalType = GOAL_TYPE.unknown,
      this.name = 'goal-name',
      this.description = 'goal-description',
      this.dateCompleted,
      this.dateMade,
      this.threshold = 0});

  @JsonKey(defaultValue: GOAL_OCCURANCE.unknown)
  @override
  final GOAL_OCCURANCE goalOccurance;
  @JsonKey(defaultValue: GOAL_TYPE.unknown)
  @override
  final GOAL_TYPE goalType;
  @JsonKey(defaultValue: 'goal-name')
  @override
  final String name;
  @JsonKey(defaultValue: 'goal-description')
  @override
  final String description;
  @override
  final List<DateTime>? dateCompleted;
  @override
  final DateTime? dateMade;
  @JsonKey(defaultValue: 0)
  @override
  final double threshold;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return '${'${"GoalEntity(goalOccurance: $goalOccurance, goalType: $goalType,"}'}${'${' name: $name, description: $description, dateCompleted: $dateCompleted,'}'}${'${" dateMade: $dateMade, threshold: $threshold)"}'}';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GoalEntity'))
      ..add(DiagnosticsProperty('goalOccurance', goalOccurance))
      ..add(DiagnosticsProperty('goalType', goalType))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('dateCompleted', dateCompleted))
      ..add(DiagnosticsProperty('dateMade', dateMade))
      ..add(DiagnosticsProperty('threshold', threshold));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GoalEntity &&
            (identical(other.goalOccurance, goalOccurance) ||
                const DeepCollectionEquality()
                    .equals(other.goalOccurance, goalOccurance)) &&
            (identical(other.goalType, goalType) ||
                const DeepCollectionEquality()
                    .equals(other.goalType, goalType)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.dateCompleted, dateCompleted) ||
                const DeepCollectionEquality()
                    .equals(other.dateCompleted, dateCompleted)) &&
            (identical(other.dateMade, dateMade) ||
                const DeepCollectionEquality()
                    .equals(other.dateMade, dateMade)) &&
            (identical(other.threshold, threshold) ||
                const DeepCollectionEquality()
                    .equals(other.threshold, threshold)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(goalOccurance) ^
      const DeepCollectionEquality().hash(goalType) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(dateCompleted) ^
      const DeepCollectionEquality().hash(dateMade) ^
      const DeepCollectionEquality().hash(threshold);

  @JsonKey(ignore: true)
  @override
  _$GoalEntityCopyWith<_GoalEntity> get copyWith =>
      __$GoalEntityCopyWithImpl<_GoalEntity>(this, _$identity);
}

abstract class _GoalEntity implements GoalEntity {
  factory _GoalEntity(
      {GOAL_OCCURANCE goalOccurance,
      GOAL_TYPE goalType,
      String name,
      String description,
      List<DateTime>? dateCompleted,
      DateTime? dateMade,
      double threshold}) = _$_GoalEntity;

  @override
  GOAL_OCCURANCE get goalOccurance => throw _privateConstructorUsedError;
  @override
  GOAL_TYPE get goalType => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  List<DateTime>? get dateCompleted => throw _privateConstructorUsedError;
  @override
  DateTime? get dateMade => throw _privateConstructorUsedError;
  @override
  double get threshold => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$GoalEntityCopyWith<_GoalEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
