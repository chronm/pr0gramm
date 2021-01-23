import 'package:flutter_modular/flutter_modular.dart';
import 'package:pr0gramm/modules/home/item_page.dart';
import 'package:pr0gramm/modules/home/items_page.dart';
import 'package:pr0gramm/widget/item_grid/bloc/items_cubit.dart';
import 'package:pr0gramm_api/pr0gramm_api.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((_) => ItemsCubit(Modular.get<Pr0gramm>())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, __) => ItemsPage()),
        ModularRouter('/:id', child: (_, args) => ItemPage(item: args.data)),
      ];
}
