part of 'sync_service.dart';

enum _SyncState { NO_SYNC, SYNCED }

@JsonSerializable(createFactory: false)
abstract class SyncState {
  final _SyncState state;

  SyncState(this.state);

  Map<String, dynamic> toJson() => _$SyncStateToJson(this);
}

@immutable
@JsonSerializable(explicitToJson: true)
class Synced extends SyncState {
  final Inbox inbox;
  final int logLength;
  final int log;
  final Map<int, Vote> votedItems;
  final Map<int, Vote> votedComments;
  final Map<int, Vote> votedTags;
  final Map<int, FollowState> follows;
  final Map<int, bool> commentFavs;
  final Map<int, ItemInCollection> collectedItems;

  Synced(this.inbox, this.logLength, this.log, this.votedItems, this.votedComments, this.votedTags, this.follows, this.commentFavs, this.collectedItems) : super(_SyncState.SYNCED);

  Map<String, dynamic> toJson() => _$SyncedToJson(this)..addAll(super.toJson());
}

@immutable
@JsonSerializable(explicitToJson: true)
class NoSync extends SyncState {
  NoSync() : super(_SyncState.NO_SYNC);

  Map<String, dynamic> toJson() => _$NoSyncToJson(this)..addAll(super.toJson());
}
