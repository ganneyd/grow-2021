// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'background_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$BackgroundEntityTearOff {
  const _$BackgroundEntityTearOff();

  _BackgroundEntity call(
      {String image = 'image',
      String description = 'image-description',
      String locationPOI = 'image-location-poi',
      String animationFile = 'animation-file',
      double price = 0.0}) {
    return _BackgroundEntity(
      image: image,
      description: description,
      locationPOI: locationPOI,
      animationFile: animationFile,
      price: price,
    );
  }
}

/// @nodoc
const $BackgroundEntity = _$BackgroundEntityTearOff();

/// @nodoc
mixin _$BackgroundEntity {
  String get image => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get locationPOI => throw _privateConstructorUsedError;
  String get animationFile => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BackgroundEntityCopyWith<BackgroundEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BackgroundEntityCopyWith<$Res> {
  factory $BackgroundEntityCopyWith(
          BackgroundEntity value, $Res Function(BackgroundEntity) then) =
      _$BackgroundEntityCopyWithImpl<$Res>;
  $Res call(
      {String image,
      String description,
      String locationPOI,
      String animationFile,
      double price});
}

/// @nodoc
class _$BackgroundEntityCopyWithImpl<$Res>
    implements $BackgroundEntityCopyWith<$Res> {
  _$BackgroundEntityCopyWithImpl(this._value, this._then);

  final BackgroundEntity _value;
  // ignore: unused_field
  final $Res Function(BackgroundEntity) _then;

  @override
  $Res call({
    Object? image = freezed,
    Object? description = freezed,
    Object? locationPOI = freezed,
    Object? animationFile = freezed,
    Object? price = freezed,
  }) {
    return _then(_value.copyWith(
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      locationPOI: locationPOI == freezed
          ? _value.locationPOI
          : locationPOI // ignore: cast_nullable_to_non_nullable
              as String,
      animationFile: animationFile == freezed
          ? _value.animationFile
          : animationFile // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$BackgroundEntityCopyWith<$Res>
    implements $BackgroundEntityCopyWith<$Res> {
  factory _$BackgroundEntityCopyWith(
          _BackgroundEntity value, $Res Function(_BackgroundEntity) then) =
      __$BackgroundEntityCopyWithImpl<$Res>;
  @override
  $Res call(
      {String image,
      String description,
      String locationPOI,
      String animationFile,
      double price});
}

/// @nodoc
class __$BackgroundEntityCopyWithImpl<$Res>
    extends _$BackgroundEntityCopyWithImpl<$Res>
    implements _$BackgroundEntityCopyWith<$Res> {
  __$BackgroundEntityCopyWithImpl(
      _BackgroundEntity _value, $Res Function(_BackgroundEntity) _then)
      : super(_value, (v) => _then(v as _BackgroundEntity));

  @override
  _BackgroundEntity get _value => super._value as _BackgroundEntity;

  @override
  $Res call({
    Object? image = freezed,
    Object? description = freezed,
    Object? locationPOI = freezed,
    Object? animationFile = freezed,
    Object? price = freezed,
  }) {
    return _then(_BackgroundEntity(
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      locationPOI: locationPOI == freezed
          ? _value.locationPOI
          : locationPOI // ignore: cast_nullable_to_non_nullable
              as String,
      animationFile: animationFile == freezed
          ? _value.animationFile
          : animationFile // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_BackgroundEntity
    with DiagnosticableTreeMixin
    implements _BackgroundEntity {
  _$_BackgroundEntity(
      {this.image = 'image',
      this.description = 'image-description',
      this.locationPOI = 'image-location-poi',
      this.animationFile = 'animation-file',
      this.price = 0.0});

  @JsonKey(defaultValue: 'image')
  @override
  final String image;
  @JsonKey(defaultValue: 'image-description')
  @override
  final String description;
  @JsonKey(defaultValue: 'image-location-poi')
  @override
  final String locationPOI;
  @JsonKey(defaultValue: 'animation-file')
  @override
  final String animationFile;
  @JsonKey(defaultValue: 0.0)
  @override
  final double price;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BackgroundEntity(image: $image, description: $description, locationPOI: $locationPOI, animationFile: $animationFile, price: $price)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BackgroundEntity'))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('locationPOI', locationPOI))
      ..add(DiagnosticsProperty('animationFile', animationFile))
      ..add(DiagnosticsProperty('price', price));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BackgroundEntity &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.locationPOI, locationPOI) ||
                const DeepCollectionEquality()
                    .equals(other.locationPOI, locationPOI)) &&
            (identical(other.animationFile, animationFile) ||
                const DeepCollectionEquality()
                    .equals(other.animationFile, animationFile)) &&
            (identical(other.price, price) ||
                const DeepCollectionEquality().equals(other.price, price)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(image) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(locationPOI) ^
      const DeepCollectionEquality().hash(animationFile) ^
      const DeepCollectionEquality().hash(price);

  @JsonKey(ignore: true)
  @override
  _$BackgroundEntityCopyWith<_BackgroundEntity> get copyWith =>
      __$BackgroundEntityCopyWithImpl<_BackgroundEntity>(this, _$identity);
}

abstract class _BackgroundEntity implements BackgroundEntity {
  factory _BackgroundEntity(
      {String image,
      String description,
      String locationPOI,
      String animationFile,
      double price}) = _$_BackgroundEntity;

  @override
  String get image => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  String get locationPOI => throw _privateConstructorUsedError;
  @override
  String get animationFile => throw _privateConstructorUsedError;
  @override
  double get price => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$BackgroundEntityCopyWith<_BackgroundEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
