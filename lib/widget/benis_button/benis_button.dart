import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pr0gramm/service/vote_service/vote_service.dart';
import 'package:pr0gramm_api/pr0gramm_api.dart';

class BenisButton extends StatelessWidget {
  final IconData icon;
  final GestureTapCallback onTap;
  final VoteTarget target;
  final int id;

  const BenisButton.up({Key key, this.onTap, this.target, this.id})
      : icon = Icons.add_circle_outline,
        super(key: key);

  const BenisButton.down({Key key, this.onTap, this.target, this.id})
      : icon = Icons.remove_circle_outline,
        super(key: key);

  Color _colorForIcon(VoteState state, BuildContext context) {
    if (!state.enabled) return IconTheme.of(context).color;

    var vote;
    switch (target) {
      case VoteTarget.ITEM:
        vote = state.items[id];
        break;
      case VoteTarget.COMMENT:
        vote = state.comments[id];
        break;
      case VoteTarget.TAG:
        vote = state.tags[id];
        break;
    }

    switch (vote) {
      case Vote.NEUTRAL:
        return IconTheme.of(context).color;
      case Vote.DOWN:
        return Colors.white60;
      case Vote.UP:
        return Theme.of(context).accentColor;
    }

    return IconTheme.of(context).color;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.0),
      child: SizedBox(
        height: 24,
        width: 24,
        child: BlocBuilder<VoteService, VoteState>(
          cubit: Modular.get<VoteService>(),
          builder: (context, state) {
            return IconButton(
              icon: Icon(
                icon,
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
