// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vote_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VoteState _$VoteStateFromJson(Map<String, dynamic> json) {
  return VoteState(
    (json['items'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), _$enumDecodeNullable(_$VoteEnumMap, e)),
    ),
    (json['comments'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), _$enumDecodeNullable(_$VoteEnumMap, e)),
    ),
    (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), _$enumDecodeNullable(_$VoteEnumMap, e)),
    ),
    json['enabled'],
  );
}

Map<String, dynamic> _$VoteStateToJson(VoteState instance) => <String, dynamic>{
      'enabled': instance.enabled,
      'items': instance.items?.map((k, e) => MapEntry(k.toString(), _$VoteEnumMap[e])),
      'comments': instance.comments?.map((k, e) => MapEntry(k.toString(), _$VoteEnumMap[e])),
      'tags': instance.tags?.map((k, e) => MapEntry(k.toString(), _$VoteEnumMap[e])),
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries.singleWhere((e) => e.value == source, orElse: () => null)?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$VoteEnumMap = {
  Vote.DOWN: 'DOWN',
  Vote.NEUTRAL: 'NEUTRAL',
  Vote.UP: 'UP',
};
