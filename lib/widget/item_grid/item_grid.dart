import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'bloc/items_cubit.dart';

class ItemGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemsCubit, ItemsState>(
      cubit: Modular.get<ItemsCubit>(),
      builder: (context, state) {
        if (state is LoadedItems) {
          return GridView.builder(
            itemCount: state.items.length,
            itemBuilder: (context, index) => Card(
              margin: EdgeInsets.all(1.5),
              child: GestureDetector(
                onTap: () => Modular.link.pushNamed("${state.items[index].id}", arguments: state.items[index]),
                child: Image.network(
                  state.items[index].thumb,
                ),
              ),
            ),
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          );
        }
        return Container(
          child: Center(child: Text('¯\\_(ツ)_/¯')),
        );
      },
    );
  }
}
