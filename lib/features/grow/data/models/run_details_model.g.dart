// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'run_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RunSession _$_$_RunSessionFromJson(Map<String, dynamic> json) {
  return _$_RunSession(
    longitudeList: (json['longitudeList'] as List<dynamic>?)
            ?.map((e) => (e as num).toDouble())
            .toList() ??
        [0.0],
    latitudeList: (json['latitudeList'] as List<dynamic>?)
            ?.map((e) => (e as num).toDouble())
            .toList() ??
        [0.0],
    distance: (json['distance'] as num?)?.toDouble() ?? 0,
    duration: (json['duration'] as num?)?.toDouble() ?? 0,
    pace: (json['pace'] as num?)?.toDouble() ?? 0,
    uid: json['uid'] as String? ?? '',
    timeStamp: DateTime.parse(json['timeStamp'] as String),
    status: _$enumDecodeNullable(_$RunStatusEnumMap, json['status']) ??
        RunStatus.unknown,
  );
}

Map<String, dynamic> _$_$_RunSessionToJson(_$_RunSession instance) =>
    <String, dynamic>{
      'longitudeList': instance.longitudeList,
      'latitudeList': instance.latitudeList,
      'distance': instance.distance,
      'duration': instance.duration,
      'pace': instance.pace,
      'uid': instance.uid,
      'timeStamp': instance.timeStamp.toIso8601String(),
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
