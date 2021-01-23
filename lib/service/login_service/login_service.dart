import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pr0gramm/service/sync_service/sync_service.dart';
import 'package:pr0gramm_api/pr0gramm_api.dart';

part 'login_service.g.dart';
part 'login_service_state.dart';

class LoginService extends Cubit<LoginState> {
  final Pr0gramm _pr0gramm;
  final SyncService _syncService;

  LoginService(this._pr0gramm, this._syncService) : super(NoLogin());

  void login(String username, String password) {
    _syncService.startSync();
  }

  void logout() {
    _syncService.stopSync();
  }

  @override
  LoginState fromJson(Map<String, dynamic> json) {
    switch (EnumToString.fromString(_LoginState.values, json["state"])) {
      case _LoginState.NO_LOGIN:
        return _$NoLoginFromJson(json);
      case _LoginState.LOGIN_SUCCESSFUL:
        return _$LoginSuccessfulFromJson(json);
      case _LoginState.LOGIN_FAILED:
        return _$LoginFailedFromJson(json);
    }
    return null;
  }

  @override
  Map<String, dynamic> toJson(LoginState state) => state.toJson();
}
