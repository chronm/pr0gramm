// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$SyncStateToJson(SyncState instance) => <String, dynamic>{
      'state': _$_SyncStateEnumMap[instance.state],
    };

const _$_SyncStateEnumMap = {
  _SyncState.NO_SYNC: 'NO_SYNC',
  _SyncState.SYNCED: 'SYNCED',
};

Synced _$SyncedFromJson(Map<String, dynamic> json) {
  return Synced(
    json['inbox'] == null ? null : Inbox.fromJson(json['inbox'] as Map<String, dynamic>),
    json['logLength'] as int,
    json['log'] as int,
    (json['votedItems'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), _$enumDecodeNullable(_$VoteEnumMap, e)),
    ),
    (json['votedComments'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), _$enumDecodeNullable(_$VoteEnumMap, e)),
    ),
    (json['votedTags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), _$enumDecodeNullable(_$VoteEnumMap, e)),
    ),
    (json['follows'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), _$enumDecodeNullable(_$FollowStateEnumMap, e)),
    ),
    (json['commentFavs'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), e as bool),
    ),
    (json['collectedItems'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), e == null ? null : ItemInCollection.fromJson(e as Map<String, dynamic>)),
    ),
  );
}

Map<String, dynamic> _$SyncedToJson(Synced instance) => <String, dynamic>{
      'inbox': instance.inbox?.toJson(),
      'logLength': instance.logLength,
      'log': instance.log,
      'votedItems': instance.votedItems?.map((k, e) => MapEntry(k.toString(), _$VoteEnumMap[e])),
      'votedComments': instance.votedComments?.map((k, e) => MapEntry(k.toString(), _$VoteEnumMap[e])),
      'votedTags': instance.votedTags?.map((k, e) => MapEntry(k.toString(), _$VoteEnumMap[e])),
      'follows': instance.follows?.map((k, e) => MapEntry(k.toString(), _$FollowStateEnumMap[e])),
      'commentFavs': instance.commentFavs?.map((k, e) => MapEntry(k.toString(), e)),
      'collectedItems': instance.collectedItems?.map((k, e) => MapEntry(k.toString(), e?.toJson())),
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

const _$FollowStateEnumMap = {
  FollowState.FOLLOW: 'FOLLOW',
  FollowState.NONE: 'NONE',
  FollowState.SUBSCRIBED: 'SUBSCRIBED',
};

NoSync _$NoSyncFromJson(Map<String, dynamic> json) {
  return NoSync();
}

Map<String, dynamic> _$NoSyncToJson(NoSync instance) => <String, dynamic>{};
