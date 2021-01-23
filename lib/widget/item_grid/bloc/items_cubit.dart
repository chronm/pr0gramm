import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pr0gramm_api/pr0gramm_api.dart';
import 'package:pr0gramm_api/src/pr0gramm_facade.dart';

part 'items_state.dart';

class ItemsCubit extends HydratedCubit<ItemsState> {
  final Pr0gramm _pr0gramm;

  ItemsCubit(this._pr0gramm) : super(InitialItemsState()) {
    init();
  }

  void init() async {
    if (state is InitialItemsState) {
      emit(LoadedItems((await _pr0gramm.getItems()).items));
    }
  }

  @override
  ItemsState fromJson(Map<String, dynamic> json) => ItemsState.fromJson(json);

  @override
  Map<String, dynamic> toJson(ItemsState state) => state.toJson();
}
