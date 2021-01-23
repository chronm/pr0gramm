import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pr0gramm_api/pr0gramm_api.dart';

part 'stelz_service.g.dart';

@immutable
@JsonSerializable(explicitToJson: true)
class StelzState {
  final bool enabled;
  final Map<int, FollowState> stelz;

  factory StelzState.init() => StelzState({}, false);

  StelzState(this.stelz, this.enabled);

  StelzState withEnabled() => StelzState(stelz, true);

  StelzState withDisabled() => StelzState(stelz, false);
}

class StelzService extends HydratedCubit<StelzState> {
  StelzService() : super(StelzState.init());

  void updateStelz(Map<int, FollowState> stelz) => emit(StelzState(state.stelz..addAll(stelz), true));

  void enableStelz() => emit(state.withEnabled());

  void disableStelz() => emit(state.withDisabled());

  @override
  StelzState fromJson(Map<String, dynamic> json) => _$StelzStateFromJson(json);

  @override
  Map<String, dynamic> toJson(StelzState state) => _$StelzStateToJson(state);
}
