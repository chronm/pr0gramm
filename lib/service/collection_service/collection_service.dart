import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pr0gramm_api/pr0gramm_api.dart';

part 'collection_service.g.dart';

@immutable
@JsonSerializable(explicitToJson: true)
class CollectionState {
  final bool enabled;
  final Map<int, ItemInCollection> collectedItems;

  factory CollectionState.init() => CollectionState({}, false);

  CollectionState(this.collectedItems, this.enabled);

  CollectionState withDisabled() => CollectionState(collectedItems, false);

  CollectionState withEnabled() => CollectionState(collectedItems, true);
}

class CollectionService extends Cubit<CollectionState> {
  CollectionService() : super(CollectionState.init());

  void updateCollections(Map<int, ItemInCollection> collectedItems) => emit(CollectionState(state.collectedItems..addAll(collectedItems), true));

  void enableCollections() => emit(state.withEnabled());

  void disableCollections() => emit(state.withDisabled());

  @override
  fromJson(Map<String, dynamic> json) => _$CollectionStateFromJson(json);

  @override
  Map<String, dynamic> toJson(state) => _$CollectionStateToJson(state);
}
