// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionState _$CollectionStateFromJson(Map<String, dynamic> json) {
  return CollectionState(
    (json['collectedItems'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), e == null ? null : ItemInCollection.fromJson(e as Map<String, dynamic>)),
    ),
    json['enabled'] as bool,
  );
}

Map<String, dynamic> _$CollectionStateToJson(CollectionState instance) => <String, dynamic>{
      'enabled': instance.enabled,
      'collectedItems': instance.collectedItems?.map((k, e) => MapEntry(k.toString(), e?.toJson())),
    };
