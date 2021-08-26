// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'run_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RunDetails _$_$_RunDetailsFromJson(Map<String, dynamic> json) {
  return _$_RunDetails(
    longitudeList: (json['longitudeList'] as List<dynamic>?)
            ?.map((e) => (e as num).toDouble())
            .toList() ??
        [0.0],
    latitudeList: (json['latitudeList'] as List<dynamic>?)
            ?.map((e) => (e as num).toDouble())
            .toList() ??
        [0.0],
    distance: (json['distance'] as num?)?.toDouble() ?? 0,
    elapsedSeconds: (json['elapsedSeconds'] as num?)?.toDouble() ?? 0,
    pace: (json['pace'] as num?)?.toDouble() ?? 0,
    status: _$enumDecodeNullable(_$RunStatusEnumMap, json['status']) ??
        RunStatus.unknown,
  );
}

Map<String, dynamic> _$_$_RunDetailsToJson(_$_RunDetails instance) =>
    <String, dynamic>{
      'longitudeList': instance.longitudeList,
      'latitudeList': instance.latitudeList,
      'distance': instance.distance,
      'elapsedSeconds': instance.elapsedSeconds,
      'pace': instance.pace,
      'status': _$RunStatusEnumMap[instance.status],
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

const _$RunStatusEnumMap = {
  RunStatus.running: 'running',
  RunStatus.stopped: 'stopped',
  RunStatus.unknown: 'unknown',
};
