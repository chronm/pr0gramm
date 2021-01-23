// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stelz_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StelzState _$StelzStateFromJson(Map<String, dynamic> json) {
  return StelzState(
    (json['stelz'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), _$enumDecodeNullable(_$FollowStateEnumMap, e)),
    ),
    json['enabled'] as bool,
  );
}

Map<String, dynamic> _$StelzStateToJson(StelzState instance) => <String, dynamic>{
      'enabled': instance.enabled,
      'stelz': instance.stelz?.map((k, e) => MapEntry(k.toString(), _$FollowStateEnumMap[e])),
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

const _$FollowStateEnumMap = {
  FollowState.FOLLOW: 'FOLLOW',
  FollowState.NONE: 'NONE',
  FollowState.SUBSCRIBED: 'SUBSCRIBED',
};
