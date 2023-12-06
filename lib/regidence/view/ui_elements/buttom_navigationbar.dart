import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavigationBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

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
