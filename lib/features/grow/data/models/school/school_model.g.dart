// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'school_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SchoolModel _$_$_SchoolModelFromJson(Map<String, dynamic> json) {
  return _$_SchoolModel(
    uid: json['uid'] as String? ?? 'no-id',
    name: json['name'] as String? ?? 'name',
    address: json['address'] as String? ?? 'address',
    minGradeLevel: json['minGradeLevel'] as int? ?? 0,
    maxGradeLevel: json['maxGradeLevel'] as int? ?? 8,
    isPublic: json['isPublic'] as bool? ?? true,
    schoolLevel:
        _$enumDecodeNullable(_$SchoolLevelEnumMap, json['schoolLevel']) ??
            SchoolLevel.primary,
  );
}

Map<String, dynamic> _$_$_SchoolModelToJson(_$_SchoolModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'address': instance.address,
      'minGradeLevel': instance.minGradeLevel,
      'maxGradeLevel': instance.maxGradeLevel,
      'isPublic': instance.isPublic,
      'schoolLevel': _$SchoolLevelEnumMap[instance.schoolLevel],
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

const _$SchoolLevelEnumMap = {
  SchoolLevel.primary: 'primary',
  SchoolLevel.secondary: 'secondary',
  SchoolLevel.tertiary: 'tertiary',
};
