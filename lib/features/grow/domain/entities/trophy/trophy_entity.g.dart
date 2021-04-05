// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trophy_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TrophyEntity _$_$_TrophyEntityFromJson(Map<String, dynamic> json) {
  return _$_TrophyEntity(
    trophyCategory: _$enumDecodeNullable(
            _$TROPHY_CATEGORYEnumMap, json['trophyCategory']) ??
        TROPHY_CATEGORY.UNKNOWN,
    image: json['image'] as String? ?? 'trophy-image',
    name: json['name'] as String? ?? 'trophy-name',
    animation: json['animation'] as String? ?? 'trophy-animation',
    description: json['description'] as String? ?? 'trophy-description',
  );
}

Map<String, dynamic> _$_$_TrophyEntityToJson(_$_TrophyEntity instance) =>
    <String, dynamic>{
      'trophyCategory': _$TROPHY_CATEGORYEnumMap[instance.trophyCategory],
      'image': instance.image,
      'name': instance.name,
      'animation': instance.animation,
      'description': instance.description,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$TROPHY_CATEGORYEnumMap = {
  TROPHY_CATEGORY.RUN: 'RUN',
  TROPHY_CATEGORY.ENDURANCE: 'ENDURANCE',
  TROPHY_CATEGORY.DISTANCE: 'DISTANCE',
  TROPHY_CATEGORY.XP: 'XP',
  TROPHY_CATEGORY.GOAL_COMPLETED: 'GOAL_COMPLETED',
  TROPHY_CATEGORY.UNKNOWN: 'UNKNOWN',
};
