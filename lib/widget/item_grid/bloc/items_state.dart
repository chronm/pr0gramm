part of 'items_cubit.dart';

@immutable
abstract class ItemsState {
  static ItemsState fromJson(Map<String, dynamic> json) {
    final key = json.keys.first;
    if (key == "InitialHomeState") return InitialItemsState();
    if (key == "LoadedItems") return LoadedItems.fromJson(json["LoadedItems"]);
    return null;
  }

  Map<String, dynamic> toJson();
}

class InitialItemsState extends ItemsState {
  @override
  Map<String, dynamic> toJson() => {"InitialHomeState": ""};
}

class LoadedItems extends ItemsState {
  final List<Item> items;

  LoadedItems(this.items);

  @override
  factory LoadedItems.fromJson(dynamic json) => LoadedItems((json as List).map((e) => Item.fromJson(e)).toList());

  @override
  Map<String, dynamic> toJson() => {"LoadedItems": items.map((e) => e.toJson()).toList()};
}
