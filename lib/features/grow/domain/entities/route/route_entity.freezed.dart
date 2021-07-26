// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'route_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RouteEntityTearOff {
  const _$RouteEntityTearOff();

  _RouteEntity call(
      {DateTime? dateCreated,
      List<DateTime>? datesCompleted,
      int attempts = 0,
      double distance = 0}) {
    return _RouteEntity(
      dateCreated: dateCreated,
      datesCompleted: datesCompleted,
      attempts: attempts,
      distance: distance,
    );
  }
}

/// @nodoc
const $RouteEntity = _$RouteEntityTearOff();

/// @nodoc
mixin _$RouteEntity {
  DateTime? get dateCreated => throw _privateConstructorUsedError;
  List<DateTime>? get datesCompleted => throw _privateConstructorUsedError;
  int get attempts => throw _privateConstructorUsedError;
  double get distance => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RouteEntityCopyWith<RouteEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteEntityCopyWith<$Res> {
  factory $RouteEntityCopyWith(
          RouteEntity value, $Res Function(RouteEntity) then) =
      _$RouteEntityCopyWithImpl<$Res>;
  $Res call(
      {DateTime? dateCreated,
      List<DateTime>? datesCompleted,
      int attempts,
      double distance});
}

/// @nodoc
class _$RouteEntityCopyWithImpl<$Res> implements $RouteEntityCopyWith<$Res> {
  _$RouteEntityCopyWithImpl(this._value, this._then);

  final RouteEntity _value;
  // ignore: unused_field
  final $Res Function(RouteEntity) _then;

  @override
  $Res call({
    Object? dateCreated = freezed,
    Object? datesCompleted = freezed,
    Object? attempts = freezed,
    Object? distance = freezed,
  }) {
    return _then(_value.copyWith(
      dateCreated: dateCreated == freezed
          ? _value.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      datesCompleted: datesCompleted == freezed
          ? _value.datesCompleted
          : datesCompleted // ignore: cast_nullable_to_non_nullable
              as List<DateTime>?,
      attempts: attempts == freezed
          ? _value.attempts
          : attempts // ignore: cast_nullable_to_non_nullable
              as int,
      distance: distance == freezed
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$RouteEntityCopyWith<$Res>
    implements $RouteEntityCopyWith<$Res> {
  factory _$RouteEntityCopyWith(
          _RouteEntity value, $Res Function(_RouteEntity) then) =
      __$RouteEntityCopyWithImpl<$Res>;
  @override
  $Res call(
      {DateTime? dateCreated,
      List<DateTime>? datesCompleted,
      int attempts,
      double distance});
}

/// @nodoc
class __$RouteEntityCopyWithImpl<$Res> extends _$RouteEntityCopyWithImpl<$Res>
    implements _$RouteEntityCopyWith<$Res> {
  __$RouteEntityCopyWithImpl(
      _RouteEntity _value, $Res Function(_RouteEntity) _then)
      : super(_value, (v) => _then(v as _RouteEntity));

  @override
  _RouteEntity get _value => super._value as _RouteEntity;

  @override
  $Res call({
    Object? dateCreated = freezed,
    Object? datesCompleted = freezed,
    Object? attempts = freezed,
    Object? distance = freezed,
  }) {
    return _then(_RouteEntity(
      dateCreated: dateCreated == freezed
          ? _value.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      datesCompleted: datesCompleted == freezed
          ? _value.datesCompleted
          : datesCompleted // ignore: cast_nullable_to_non_nullable
              as List<DateTime>?,
      attempts: attempts == freezed
          ? _value.attempts
          : attempts // ignore: cast_nullable_to_non_nullable
              as int,
      distance: distance == freezed
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_RouteEntity with DiagnosticableTreeMixin implements _RouteEntity {
  _$_RouteEntity(
      {this.dateCreated,
      this.datesCompleted,
      this.attempts = 0,
      this.distance = 0});

  @override
  final DateTime? dateCreated;
  @override
  final List<DateTime>? datesCompleted;
  @JsonKey(defaultValue: 0)
  @override
  final int attempts;
  @JsonKey(defaultValue: 0)
  @override
  final double distance;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RouteEntity(dateCreated: $dateCreated, datesCompleted: $datesCompleted, attempts: $attempts, distance: $distance)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RouteEntity'))
      ..add(DiagnosticsProperty('dateCreated', dateCreated))
      ..add(DiagnosticsProperty('datesCompleted', datesCompleted))
      ..add(DiagnosticsProperty('attempts', attempts))
      ..add(DiagnosticsProperty('distance', distance));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RouteEntity &&
            (identical(other.dateCreated, dateCreated) ||
                const DeepCollectionEquality()
                    .equals(other.dateCreated, dateCreated)) &&
            (identical(other.datesCompleted, datesCompleted) ||
                const DeepCollectionEquality()
                    .equals(other.datesCompleted, datesCompleted)) &&
            (identical(other.attempts, attempts) ||
                const DeepCollectionEquality()
                    .equals(other.attempts, attempts)) &&
            (identical(other.distance, distance) ||
                const DeepCollectionEquality()
                    .equals(other.distance, distance)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(dateCreated) ^
      const DeepCollectionEquality().hash(datesCompleted) ^
      const DeepCollectionEquality().hash(attempts) ^
      const DeepCollectionEquality().hash(distance);

  @JsonKey(ignore: true)
  @override
  _$RouteEntityCopyWith<_RouteEntity> get copyWith =>
      __$RouteEntityCopyWithImpl<_RouteEntity>(this, _$identity);
}

abstract class _RouteEntity implements RouteEntity {
  factory _RouteEntity(
      {DateTime? dateCreated,
      List<DateTime>? datesCompleted,
      int attempts,
      double distance}) = _$_RouteEntity;

  @override
  DateTime? get dateCreated => throw _privateConstructorUsedError;
  @override
  List<DateTime>? get datesCompleted => throw _privateConstructorUsedError;
  @override
  int get attempts => throw _privateConstructorUsedError;
  @override
  double get distance => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RouteEntityCopyWith<_RouteEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
