import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tutorial/mercari/view/ui_elements/custom_appbar.dart';
import 'package:flutter_tutorial/mercari/view/ui_elements/item_box.dart';
import 'package:flutter_tutorial/mercari/view/ui_elements/item_list.dart';
import 'package:flutter_tutorial/mercari/view/ui_elements/shortcut.dart';
import 'package:flutter_tutorial/mercari/viewmodel/item_list_notifier.dart';

class Mercari extends ConsumerWidget {
  const Mercari({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemListState = ref.watch(itemListProvider);

    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8),
              child: Shortcut(),
            ),
            ItemBox(),
            if (itemListState.isLoading)
              const Center(child: CircularProgressIndicator())
            else
              ListView.builder(
                itemCount: itemListState.items.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return ItemList(item: itemListState.items[index]);
                },
              ),
          ],
        ),
      ),
    );
  }
}
