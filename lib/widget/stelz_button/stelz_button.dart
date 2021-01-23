import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pr0gramm/service/stelz_service/stelz_service.dart';
import 'package:pr0gramm_api/pr0gramm_api.dart';

class StelzButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final int id;

  const StelzButton({Key key, this.onTap, this.id}) : super(key: key);

  Color _colorForIcon(StelzState state, BuildContext context) {
    if (state.stelz[id] == FollowState.SUBSCRIBED || state.stelz[id] == FollowState.FOLLOW) return Theme.of(context).accentColor;

    return IconTheme.of(context).color;
  }

  IconData _icon(StelzState state, BuildContext context) {
    if (!state.enabled) return Icons.notifications_off_outlined;

    switch (state.stelz[id]) {
      case FollowState.FOLLOW:
        return Icons.notifications_active;
      case FollowState.NONE:
        return Icons.notifications_off_outlined;
      case FollowState.SUBSCRIBED:
        return Icons.notifications_none;
    }

    return Icons.notifications_off_outlined;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.0),
      child: SizedBox(
        height: 24,
        width: 24,
        child: BlocBuilder<StelzService, StelzState>(
          cubit: Modular.get<StelzService>(),
          builder: (context, state) {
            return IconButton(
              icon: Icon(
                _icon(state, context),
                size: 24,
                color: _colorForIcon(state, context),
              ),
              padding: EdgeInsets.all(0),
              onPressed: state.enabled ? onTap : null,
            );
          },
        ),
      ),
    );
  }
}
