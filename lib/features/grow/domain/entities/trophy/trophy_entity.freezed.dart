// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'trophy_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TrophyEntity _$TrophyEntityFromJson(Map<String, dynamic> json) {
  return _TrophyEntity.fromJson(json);
}

/// @nodoc
class _$TrophyEntityTearOff {
  const _$TrophyEntityTearOff();

  _TrophyEntity call(
      {TROPHY_CATEGORY trophyCategory = TROPHY_CATEGORY.UNKNOWN,
      String image = 'trophy-image',
      String name = 'trophy-name',
      String animation = 'trophy-animation',
      String description = 'trophy-description'}) {
    return _TrophyEntity(
      trophyCategory: trophyCategory,
      image: image,
      name: name,
      animation: animation,
      description: description,
    );
  }

  TrophyEntity fromJson(Map<String, Object> json) {
    return TrophyEntity.fromJson(json);
  }
}

/// @nodoc
const $TrophyEntity = _$TrophyEntityTearOff();

/// @nodoc
mixin _$TrophyEntity {
  TROPHY_CATEGORY get trophyCategory => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get animation => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TrophyEntityCopyWith<TrophyEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrophyEntityCopyWith<$Res> {
  factory $TrophyEntityCopyWith(
          TrophyEntity value, $Res Function(TrophyEntity) then) =
      _$TrophyEntityCopyWithImpl<$Res>;
  $Res call(
      {TROPHY_CATEGORY trophyCategory,
      String image,
      String name,
      String animation,
      String description});
}

/// @nodoc
class _$TrophyEntityCopyWithImpl<$Res> implements $TrophyEntityCopyWith<$Res> {
  _$TrophyEntityCopyWithImpl(this._value, this._then);

  final TrophyEntity _value;
  // ignore: unused_field
  final $Res Function(TrophyEntity) _then;

  @override
  $Res call({
    Object? trophyCategory = freezed,
    Object? image = freezed,
    Object? name = freezed,
    Object? animation = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      trophyCategory: trophyCategory == freezed
          ? _value.trophyCategory
          : trophyCategory // ignore: cast_nullable_to_non_nullable
              as TROPHY_CATEGORY,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      animation: animation == freezed
          ? _value.animation
          : animation // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$TrophyEntityCopyWith<$Res>
    implements $TrophyEntityCopyWith<$Res> {
  factory _$TrophyEntityCopyWith(
          _TrophyEntity value, $Res Function(_TrophyEntity) then) =
      __$TrophyEntityCopyWithImpl<$Res>;
  @override
  $Res call(
      {TROPHY_CATEGORY trophyCategory,
      String image,
      String name,
      String animation,
      String description});
}

/// @nodoc
class __$TrophyEntityCopyWithImpl<$Res> extends _$TrophyEntityCopyWithImpl<$Res>
    implements _$TrophyEntityCopyWith<$Res> {
  __$TrophyEntityCopyWithImpl(
      _TrophyEntity _value, $Res Function(_TrophyEntity) _then)
      : super(_value, (v) => _then(v as _TrophyEntity));

  @override
  _TrophyEntity get _value => super._value as _TrophyEntity;

  @override
  $Res call({
    Object? trophyCategory = freezed,
    Object? image = freezed,
    Object? name = freezed,
    Object? animation = freezed,
    Object? description = freezed,
  }) {
    return _then(_TrophyEntity(
      trophyCategory: trophyCategory == freezed
          ? _value.trophyCategory
          : trophyCategory // ignore: cast_nullable_to_non_nullable
              as TROPHY_CATEGORY,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      animation: animation == freezed
          ? _value.animation
          : animation // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TrophyEntity extends _TrophyEntity with DiagnosticableTreeMixin {
  _$_TrophyEntity(
      {this.trophyCategory = TROPHY_CATEGORY.UNKNOWN,
      this.image = 'trophy-image',
      this.name = 'trophy-name',
      this.animation = 'trophy-animation',
      this.description = 'trophy-description'})
      : super._();

  factory _$_TrophyEntity.fromJson(Map<String, dynamic> json) =>
      _$_$_TrophyEntityFromJson(json);

  @JsonKey(defaultValue: TROPHY_CATEGORY.UNKNOWN)
  @override
  final TROPHY_CATEGORY trophyCategory;
  @JsonKey(defaultValue: 'trophy-image')
  @override
  final String image;
  @JsonKey(defaultValue: 'trophy-name')
  @override
  final String name;
  @JsonKey(defaultValue: 'trophy-animation')
  @override
  final String animation;
  @JsonKey(defaultValue: 'trophy-description')
  @override
  final String description;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TrophyEntity(trophyCategory: $trophyCategory, image: $image, name: $name, animation: $animation, description: $description)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TrophyEntity'))
      ..add(DiagnosticsProperty('trophyCategory', trophyCategory))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('animation', animation))
      ..add(DiagnosticsProperty('description', description));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TrophyEntity &&
            (identical(other.trophyCategory, trophyCategory) ||
                const DeepCollectionEquality()
                    .equals(other.trophyCategory, trophyCategory)) &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.animation, animation) ||
                const DeepCollectionEquality()
                    .equals(other.animation, animation)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(trophyCategory) ^
      const DeepCollectionEquality().hash(image) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(animation) ^
      const DeepCollectionEquality().hash(description);

  @JsonKey(ignore: true)
  @override
  _$TrophyEntityCopyWith<_TrophyEntity> get copyWith =>
      __$TrophyEntityCopyWithImpl<_TrophyEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TrophyEntityToJson(this);
  }
}

abstract class _TrophyEntity extends TrophyEntity {
  factory _TrophyEntity(
      {TROPHY_CATEGORY trophyCategory,
      String image,
      String name,
      String animation,
      String description}) = _$_TrophyEntity;
  _TrophyEntity._() : super._();

  factory _TrophyEntity.fromJson(Map<String, dynamic> json) =
      _$_TrophyEntity.fromJson;

  @override
  TROPHY_CATEGORY get trophyCategory => throw _privateConstructorUsedError;
  @override
  String get image => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get animation => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TrophyEntityCopyWith<_TrophyEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
