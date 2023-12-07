import 'package:flutter/material.dart';
import 'package:flutter_tutorial/youtube/view/ui_elements/custombutton.dart';

final List<CustomButton> customButtons = [
  const CustomButton(
    icon: Icons.local_fire_department,
    label: '急上昇',
    color: Colors.red,
  ),
  const CustomButton(icon: Icons.music_note, label: '音楽', color: Colors.teal),
  const CustomButton(
    icon: Icons.gamepad_rounded,
    label: 'ゲーム',
    color: Colors.pinkAccent,
  ),
  const CustomButton(
    icon: Icons.menu_sharp,
    label: 'ニュース',
    color: Colors.indigo,
  ),
  const CustomButton(icon: Icons.menu_sharp, label: '学び', color: Colors.green),
  const CustomButton(
    icon: Icons.live_tv,
    label: 'ライブ',
    color: Colors.deepOrangeAccent,
  ),
  const CustomButton(
    icon: Icons.play_circle_fill,
    label: 'スポーツ',
    color: Colors.cyan,
  ),
];
