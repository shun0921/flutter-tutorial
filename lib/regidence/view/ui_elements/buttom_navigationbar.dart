// ignore_for_file: inference_failure_on_function_return_type

import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });
  final int selectedIndex;
  final Function(int) onItemTapped;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: selectedIndex,
      onTap: onItemTapped,
      selectedLabelStyle: const TextStyle(fontSize: 10),
      selectedItemColor: Colors.teal,
      unselectedLabelStyle: const TextStyle(fontSize: 10),
      unselectedItemColor: Colors.grey.withOpacity(0.9),
      backgroundColor: Colors.white,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'ホーム',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          label: 'お気にいり',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.messenger_outline),
          label: 'メッセージ',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'マイページ',
        ),
      ],
    );
  }
}
