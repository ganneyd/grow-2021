// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parent_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ParentModel _$_$_ParentModelFromJson(Map<String, dynamic> json) {
  return _$_ParentModel(
    uid: json['uid'] as String? ?? 'no-id',
    firstname: json['firstname'] as String? ?? 'firstname',
    lastname: json['lastname'] as String? ?? 'lastname',
    childrenIDs: (json['childrenIDs'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    phonenumber: json['phonenumber'] as String? ?? '0000000000',
    dateOfBirth: json['dateOfBirth'] == null
        ? null
        : DateTime.parse(json['dateOfBirth'] as String),
    gender:
        _$enumDecodeNullable(_$GenderEnumMap, json['gender']) ?? Gender.unknown,
  );
}

Map<String, dynamic> _$_$_ParentModelToJson(_$_ParentModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'childrenIDs': instance.childrenIDs,
      'phonenumber': instance.phonenumber,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'gender': _$GenderEnumMap[instance.gender],
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
