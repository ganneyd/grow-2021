// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'previous_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PreviousModelTearOff {
  const _$PreviousModelTearOff();

  _PreviousModel call(
      {double longitude = 0,
      double latitude = 0,
      double distance = 0,
      double pace = 0}) {
    return _PreviousModel(
      longitude: longitude,
      latitude: latitude,
      distance: distance,
      pace: pace,
    );
  }
}

/// @nodoc
const $PreviousModel = _$PreviousModelTearOff();

/// @nodoc
mixin _$PreviousModel {
  double get longitude => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get distance => throw _privateConstructorUsedError;
  double get pace => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PreviousModelCopyWith<PreviousModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreviousModelCopyWith<$Res> {
  factory $PreviousModelCopyWith(
          PreviousModel value, $Res Function(PreviousModel) then) =
      _$PreviousModelCopyWithImpl<$Res>;
  $Res call({double longitude, double latitude, double distance, double pace});
}

/// @nodoc
class _$PreviousModelCopyWithImpl<$Res>
    implements $PreviousModelCopyWith<$Res> {
  _$PreviousModelCopyWithImpl(this._value, this._then);

  final PreviousModel _value;
  // ignore: unused_field
  final $Res Function(PreviousModel) _then;

  @override
  $Res call({
    Object? longitude = freezed,
    Object? latitude = freezed,
    Object? distance = freezed,
    Object? pace = freezed,
  }) {
    return _then(_value.copyWith(
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      distance: distance == freezed
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      pace: pace == freezed
          ? _value.pace
          : pace // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$PreviousModelCopyWith<$Res>
    implements $PreviousModelCopyWith<$Res> {
  factory _$PreviousModelCopyWith(
          _PreviousModel value, $Res Function(_PreviousModel) then) =
      __$PreviousModelCopyWithImpl<$Res>;
  @override
  $Res call({double longitude, double latitude, double distance, double pace});
}

/// @nodoc
class __$PreviousModelCopyWithImpl<$Res>
    extends _$PreviousModelCopyWithImpl<$Res>
    implements _$PreviousModelCopyWith<$Res> {
  __$PreviousModelCopyWithImpl(
      _PreviousModel _value, $Res Function(_PreviousModel) _then)
      : super(_value, (v) => _then(v as _PreviousModel));

  @override
  _PreviousModel get _value => super._value as _PreviousModel;

  @override
  $Res call({
    Object? longitude = freezed,
    Object? latitude = freezed,
    Object? distance = freezed,
    Object? pace = freezed,
  }) {
    return _then(_PreviousModel(
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      distance: distance == freezed
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      pace: pace == freezed
          ? _value.pace
          : pace // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_PreviousModel implements _PreviousModel {
  const _$_PreviousModel(
      {this.longitude = 0,
      this.latitude = 0,
      this.distance = 0,
      this.pace = 0});

  @JsonKey(defaultValue: 0)
  @override
  final double longitude;
  @JsonKey(defaultValue: 0)
  @override
  final double latitude;
  @JsonKey(defaultValue: 0)
  @override
  final double distance;
  @JsonKey(defaultValue: 0)
  @override
  final double pace;

  @override
  String toString() {
    return 'PreviousModel(longitude: $longitude, latitude: $latitude, distance: $distance, pace: $pace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PreviousModel &&
            (identical(other.longitude, longitude) ||
                const DeepCollectionEquality()
                    .equals(other.longitude, longitude)) &&
            (identical(other.latitude, latitude) ||
                const DeepCollectionEquality()
                    .equals(other.latitude, latitude)) &&
            (identical(other.distance, distance) ||
                const DeepCollectionEquality()
                    .equals(other.distance, distance)) &&
            (identical(other.pace, pace) ||
                const DeepCollectionEquality().equals(other.pace, pace)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(longitude) ^
      const DeepCollectionEquality().hash(latitude) ^
      const DeepCollectionEquality().hash(distance) ^
      const DeepCollectionEquality().hash(pace);

  @JsonKey(ignore: true)
  @override
  _$PreviousModelCopyWith<_PreviousModel> get copyWith =>
      __$PreviousModelCopyWithImpl<_PreviousModel>(this, _$identity);
}

abstract class _PreviousModel implements PreviousModel {
  const factory _PreviousModel(
      {double longitude,
      double latitude,
      double distance,
      double pace}) = _$_PreviousModel;

  @override
  double get longitude => throw _privateConstructorUsedError;
  @override
  double get latitude => throw _privateConstructorUsedError;
  @override
  double get distance => throw _privateConstructorUsedError;
  @override
  double get pace => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PreviousModelCopyWith<_PreviousModel> get copyWith =>
      throw _privateConstructorUsedError;
}
