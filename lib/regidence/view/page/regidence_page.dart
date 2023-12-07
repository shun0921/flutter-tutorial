import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tutorial/regidence/view/ui_elements/buttom_navigationbar.dart';
import 'package:flutter_tutorial/regidence/view/ui_elements/custom_appbar.dart';
import 'package:flutter_tutorial/regidence/view/ui_elements/house_detail.dart';
import 'package:flutter_tutorial/regidence/view/ui_elements/recommend_of_service.dart';
import 'package:flutter_tutorial/regidence/viewmodel/regidence_viewmodel.dart';

class RegidencePage extends ConsumerWidget {
  const RegidencePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final regidenceState = ref.watch(regidenceStateNotifierProvider);
    final selectedIndex = regidenceState.selectedIndex;

    return Scaffold(
      appBar: const CustomAppBar(),
      body: regidenceState.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ColoredBox(
              color: Colors.grey.withOpacity(0.2),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(5),
                    child: Recommend(),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: regidenceState.regidences.length,
                      itemBuilder: (BuildContext context, index) {
                        return HouseDetailWidget(
                          regidence: regidenceState.regidences[index],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: selectedIndex,
        onItemTapped: (index) {
          ref
              .read(regidenceStateNotifierProvider.notifier)
              .updateSelectedIndex(index);
        },
      ),
    );
  }
}
