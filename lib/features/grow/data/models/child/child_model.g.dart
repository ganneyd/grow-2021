// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'child_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChildModel _$_$_ChildModelFromJson(Map<String, dynamic> json) {
  return _$_ChildModel(
    username: json['username'] as String? ?? 'username',
    firstname: json['firstname'] as String? ?? 'firstname',
    lastname: json['lastname'] as String? ?? 'lastname',
    gender:
        _$enumDecodeNullable(_$GenderEnumMap, json['gender']) ?? Gender.unknown,
    dateOfBirth: json['dateOfBirth'] == null
        ? null
        : DateTime.parse(json['dateOfBirth'] as String),
    gradeLevel: json['gradeLevel'] as int? ?? 0,
    schoolID: json['schoolID'] as String? ?? 'no-schoolID',
  );
}

Map<String, dynamic> _$_$_ChildModelToJson(_$_ChildModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'gender': _$GenderEnumMap[instance.gender],
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'gradeLevel': instance.gradeLevel,
      'schoolID': instance.schoolID,
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

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
  Gender.unknown: 'unknown',
  Gender.not_specified: 'not_specified',
};
