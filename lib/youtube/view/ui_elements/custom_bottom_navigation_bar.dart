import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tutorial/youtube/view_model/youtube_viewmodel.dart';

BottomNavigationBar buildBottomNavigationBar(
  YoutubeState state,
  WidgetRef ref,
) {
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    currentIndex: state.selectedIndex,
    onTap: (int index) {
      ref.read(youtubeStateNotifierProvider.notifier).setSelectedIndex(index);
    },
    selectedLabelStyle: const TextStyle(fontSize: 10),
    selectedItemColor: Colors.white,
    unselectedLabelStyle: const TextStyle(fontSize: 10),
    unselectedItemColor: Colors.white.withOpacity(0.9),
    backgroundColor: Colors.black,
    items: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'ホーム',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.search),
        label: '検索',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.add_circle_outline,
          size: 45,
        ),
        label: '',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.subscriptions_outlined),
        label: '登録チャンネル',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.video_library),
        label: 'ライブラリ',
      ),
    ],
  );
}
