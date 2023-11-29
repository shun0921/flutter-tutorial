import 'package:flutter/material.dart';

AppBar customAppBar() {
  return AppBar(
    title: const Text(
      'YouTube',
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
    actions: [
      IconButton(
        icon: const Icon(
          Icons.connected_tv,
          size: 25,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
      IconButton(
        icon: const Icon(
          Icons.notifications_none,
          size: 28,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
      IconButton(
        icon: const Icon(
          Icons.search_rounded,
          size: 25,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
      IconButton(
        onPressed: () {},
        icon: const Stack(
          alignment: Alignment.center,
          children: [
            Icon(
              Icons.circle,
              size: 40,
              color: Colors.deepPurple,
            ),
            Text(
              'T',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      )
    ],
    backgroundColor: Colors.black.withOpacity(0.8),
    centerTitle: false,
    leading: const Icon(
      Icons.play_circle_filled_outlined,
      color: Colors.red,
      size: 30,
    ),
  );
}
