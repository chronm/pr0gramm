// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$LoginStateToJson(LoginState instance) => <String, dynamic>{
      'state': _$_LoginStateEnumMap[instance.state],
    };

const _$_LoginStateEnumMap = {
  _LoginState.NO_LOGIN: 'NO_LOGIN',
  _LoginState.LOGIN_SUCCESSFUL: 'LOGIN_SUCCESSFUL',
  _LoginState.LOGIN_FAILED: 'LOGIN_FAILED',
};

NoLogin _$NoLoginFromJson(Map<String, dynamic> json) {
  return NoLogin();
}

Map<String, dynamic> _$NoLoginToJson(NoLogin instance) => <String, dynamic>{};

LoginSuccessful _$LoginSuccessfulFromJson(Map<String, dynamic> json) {
  return LoginSuccessful(
    banInfo: json['banInfo'] == null ? null : BanInfo.fromJson(json['banInfo'] as Map<String, dynamic>),
    id: json['id'] as String,
    nonce: json['nonce'] as String,
    paid: json['paid'] as bool,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$LoginSuccessfulToJson(LoginSuccessful instance) => <String, dynamic>{
      'banInfo': instance.banInfo?.toJson(),
      'id': instance.id,
      'nonce': instance.nonce,
      'paid': instance.paid,
      'name': instance.name,
    };

LoginFailed _$LoginFailedFromJson(Map<String, dynamic> json) {
  return LoginFailed(
    error: json['error'] as String,
  );
}

Map<String, dynamic> _$LoginFailedToJson(LoginFailed instance) => <String, dynamic>{
      'error': instance.error,
    };
