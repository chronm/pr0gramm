import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pr0gramm_api/pr0gramm_api.dart';

part 'vote_service.g.dart';

@immutable
@JsonSerializable(explicitToJson: true)
class VoteState {
  final enabled;
  final Map<int, Vote> items;
  final Map<int, Vote> comments;
  final Map<int, Vote> tags;

  factory VoteState.init() => VoteState({}, {}, {}, false);

  VoteState(this.items, this.comments, this.tags, this.enabled);

  VoteState withDisabled() => VoteState(items, comments, tags, false);

  VoteState withEnabled() => VoteState(items, comments, tags, true);
}

class VoteService extends HydratedCubit<VoteState> {
  VoteService() : super(VoteState.init());

  void updateVotes(Map<int, Vote> votedItems, Map<int, Vote> votedComments, Map<int, Vote> votedTags) =>
      emit(VoteState(state.items..addAll(votedItems), state.comments..addAll(votedComments), state.tags..addAll(votedItems), true));

  void enableVotes() => emit(state.withEnabled());

  void disableVotes() => emit(state.withDisabled());

  @override
  VoteState fromJson(Map<String, dynamic> json) => _$VoteStateFromJson(json);

  @override
  Map<String, dynamic> toJson(VoteState state) => _$VoteStateToJson(state);
}
