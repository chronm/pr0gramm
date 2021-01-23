part of 'login_service.dart';

enum _LoginState { NO_LOGIN, LOGIN_SUCCESSFUL, LOGIN_FAILED }

@JsonSerializable(createFactory: false)
abstract class LoginState {
  final _LoginState state;

  LoginState(this.state);

  Map<String, dynamic> toJson() => _$LoginStateToJson(this);
}

@JsonSerializable(explicitToJson: true)
class NoLogin extends LoginState {
  NoLogin() : super(_LoginState.NO_LOGIN);

  @override
  Map<String, dynamic> toJson() => _$NoLoginToJson(this)..addAll(super.toJson());
}

@immutable
@JsonSerializable(explicitToJson: true)
class LoginSuccessful extends LoginState {
  final BanInfo banInfo;
  final String id;
  final String nonce;
  final bool paid;
  final String name;

  LoginSuccessful({this.banInfo, this.id, this.nonce, this.paid, this.name}) : super(_LoginState.LOGIN_SUCCESSFUL);

  @override
  Map<String, dynamic> toJson() => _$LoginSuccessfulToJson(this)..addAll(super.toJson());
}

@immutable
@JsonSerializable(explicitToJson: true)
class LoginFailed extends LoginState {
  final String error;

  LoginFailed({this.error}) : super(_LoginState.LOGIN_FAILED);

  Map<String, dynamic> toJson() => _$LoginFailedToJson(this)..addAll(super.toJson());
}
