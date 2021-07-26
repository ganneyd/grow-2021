// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'clothing_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ClothingEntityTearOff {
  const _$ClothingEntityTearOff();

  _ClothingEntity call(
      {String image = 'image',
      String description = 'clothing-description',
      CLOTHING_TYPE type = CLOTHING_TYPE.NOT_SPECIFIED,
      double xpBoostFactor = 1,
      double price = 0}) {
    return _ClothingEntity(
      image: image,
      description: description,
      type: type,
      xpBoostFactor: xpBoostFactor,
      price: price,
    );
  }
}

/// @nodoc
const $ClothingEntity = _$ClothingEntityTearOff();

/// @nodoc
mixin _$ClothingEntity {
  String get image => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  CLOTHING_TYPE get type => throw _privateConstructorUsedError;
  double get xpBoostFactor => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ClothingEntityCopyWith<ClothingEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClothingEntityCopyWith<$Res> {
  factory $ClothingEntityCopyWith(
          ClothingEntity value, $Res Function(ClothingEntity) then) =
      _$ClothingEntityCopyWithImpl<$Res>;
  $Res call(
      {String image,
      String description,
      CLOTHING_TYPE type,
      double xpBoostFactor,
      double price});
}

/// @nodoc
class _$ClothingEntityCopyWithImpl<$Res>
    implements $ClothingEntityCopyWith<$Res> {
  _$ClothingEntityCopyWithImpl(this._value, this._then);

  final ClothingEntity _value;
  // ignore: unused_field
  final $Res Function(ClothingEntity) _then;

  @override
  $Res call({
    Object? image = freezed,
    Object? description = freezed,
    Object? type = freezed,
    Object? xpBoostFactor = freezed,
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
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CLOTHING_TYPE,
      xpBoostFactor: xpBoostFactor == freezed
          ? _value.xpBoostFactor
          : xpBoostFactor // ignore: cast_nullable_to_non_nullable
              as double,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$ClothingEntityCopyWith<$Res>
    implements $ClothingEntityCopyWith<$Res> {
  factory _$ClothingEntityCopyWith(
          _ClothingEntity value, $Res Function(_ClothingEntity) then) =
      __$ClothingEntityCopyWithImpl<$Res>;
  @override
  $Res call(
      {String image,
      String description,
      CLOTHING_TYPE type,
      double xpBoostFactor,
      double price});
}

/// @nodoc
class __$ClothingEntityCopyWithImpl<$Res>
    extends _$ClothingEntityCopyWithImpl<$Res>
    implements _$ClothingEntityCopyWith<$Res> {
  __$ClothingEntityCopyWithImpl(
      _ClothingEntity _value, $Res Function(_ClothingEntity) _then)
      : super(_value, (v) => _then(v as _ClothingEntity));

  @override
  _ClothingEntity get _value => super._value as _ClothingEntity;

  @override
  $Res call({
    Object? image = freezed,
    Object? description = freezed,
    Object? type = freezed,
    Object? xpBoostFactor = freezed,
    Object? price = freezed,
  }) {
    return _then(_ClothingEntity(
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CLOTHING_TYPE,
      xpBoostFactor: xpBoostFactor == freezed
          ? _value.xpBoostFactor
          : xpBoostFactor // ignore: cast_nullable_to_non_nullable
              as double,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_ClothingEntity
    with DiagnosticableTreeMixin
    implements _ClothingEntity {
  _$_ClothingEntity(
      {this.image = 'image',
      this.description = 'clothing-description',
      this.type = CLOTHING_TYPE.NOT_SPECIFIED,
      this.xpBoostFactor = 1,
      this.price = 0});

  @JsonKey(defaultValue: 'image')
  @override
  final String image;
  @JsonKey(defaultValue: 'clothing-description')
  @override
  final String description;
  @JsonKey(defaultValue: CLOTHING_TYPE.NOT_SPECIFIED)
  @override
  final CLOTHING_TYPE type;
  @JsonKey(defaultValue: 1)
  @override
  final double xpBoostFactor;
  @JsonKey(defaultValue: 0)
  @override
  final double price;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ClothingEntity(image: $image, description: $description, type: $type, xpBoostFactor: $xpBoostFactor, price: $price)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ClothingEntity'))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('xpBoostFactor', xpBoostFactor))
      ..add(DiagnosticsProperty('price', price));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ClothingEntity &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.xpBoostFactor, xpBoostFactor) ||
                const DeepCollectionEquality()
                    .equals(other.xpBoostFactor, xpBoostFactor)) &&
            (identical(other.price, price) ||
                const DeepCollectionEquality().equals(other.price, price)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(image) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(xpBoostFactor) ^
      const DeepCollectionEquality().hash(price);

  @JsonKey(ignore: true)
  @override
  _$ClothingEntityCopyWith<_ClothingEntity> get copyWith =>
      __$ClothingEntityCopyWithImpl<_ClothingEntity>(this, _$identity);
}

abstract class _ClothingEntity implements ClothingEntity {
  factory _ClothingEntity(
      {String image,
      String description,
      CLOTHING_TYPE type,
      double xpBoostFactor,
      double price}) = _$_ClothingEntity;

  @override
  String get image => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  CLOTHING_TYPE get type => throw _privateConstructorUsedError;
  @override
  double get xpBoostFactor => throw _privateConstructorUsedError;
  @override
  double get price => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ClothingEntityCopyWith<_ClothingEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
