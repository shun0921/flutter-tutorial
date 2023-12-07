import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tutorial/mercari/api/api.dart';
import 'package:flutter_tutorial/mercari/model/item.dart';

final itemListProvider = StateNotifierProvider<ItemListNotifier, ItemListState>(
  (ref) => ItemListNotifier(),
);

class ItemListNotifier extends StateNotifier<ItemListState> {
  ItemListNotifier() : super(ItemListState()) {
    fetchItems();
  }

  Future<void> fetchItems() async {
    state = state.copyWith(isLoading: true);

    final dio = Dio();
    final api = Api(dio);

    try {
      final items = await api.getItemks();
      state = state.copyWith(items: items, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false);
    }
  }
}

class ItemListState {
  ItemListState({this.items = const [], this.isLoading = false});

  final List<Item> items;
  final bool isLoading;

  ItemListState copyWith({List<Item>? items, bool? isLoading}) {
    return ItemListState(
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
