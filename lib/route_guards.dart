import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ModularChild extends StatelessWidget {
  final Widget child;
  final Function action;

  const ModularChild({Key key, this.child, this.action}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.microtask(action);
    return child;
  }
}

class ActionGuard implements RouteGuard {
  final Function action;

  ActionGuard(this.action);

  @override
  bool canActivate(String url) {
    action.call();
    return true;
  }

  @override
  List<GuardExecutor> get executors => [];
}
