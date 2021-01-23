import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pr0gramm/service/collection_service/collection_service.dart';

class CollectionButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final int id;

  const CollectionButton({Key key, this.onTap, this.id}) : super(key: key);

  Color _colorForIcon(CollectionState state, BuildContext context) {
    if (!state.enabled) return IconTheme.of(context).color;

    if (state.collectedItems[id].collect) {
      return Theme.of(context).accentColor;
    }

    return IconTheme.of(context).color;
  }

  IconData _icon(CollectionState state, BuildContext context) {
    if (state.enabled && state.collectedItems[id].collect) return Icons.bookmarks;

    return Icons.bookmarks_outlined;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.0),
      child: SizedBox(
        height: 24,
        width: 24,
        child: BlocBuilder<CollectionService, CollectionState>(
          cubit: Modular.get<CollectionService>(),
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
