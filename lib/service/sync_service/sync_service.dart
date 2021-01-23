import 'dart:async';

import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pr0gramm/service/collection_service/collection_service.dart';
import 'package:pr0gramm/service/stelz_service/stelz_service.dart';
import 'package:pr0gramm/service/vote_service/vote_service.dart';
import 'package:pr0gramm_api/pr0gramm_api.dart';

part 'sync_service.g.dart';
part 'sync_state.dart';

class SyncService extends Cubit<SyncState> {
  final Pr0gramm _pr0gramm;
  final VoteService _voteService;
  final CollectionService _collectionService;
  final StelzService _stelzService;

  int _logLength = 0;
  Timer _timer;

  SyncService(this._pr0gramm, this._voteService, this._collectionService, this._stelzService) : super(NoSync());

  void startSync() {
    _voteService.enableVotes();
    _collectionService.enableCollections();
    _stelzService.enableStelz();
    _timer = Timer.periodic(Duration(seconds: 30), (timer) async {
      var sync = await _pr0gramm.sync(_logLength);
      _logLength = sync.logLength;
      _voteService.updateVotes(sync.votedTags, sync.votedComments, sync.votedItems);
      _collectionService.updateCollections(sync.collectedItems);
      _stelzService.updateStelz(sync.follows);
    });
  }

  void stopSync() {
    _voteService.disableVotes();
    _collectionService.disableCollections();
    _stelzService.disableStelz();
    _timer.cancel();
  }

  @override
  SyncState fromJson(Map<String, dynamic> json) {
    switch (EnumToString.fromString(_SyncState.values, json["state"])) {
      case _SyncState.NO_SYNC:
        return _$NoSyncFromJson(json);
      case _SyncState.SYNCED:
        return _$SyncedFromJson(json);
    }
    return null;
  }

  @override
  Map<String, dynamic> toJson(SyncState state) => state.toJson();
}
