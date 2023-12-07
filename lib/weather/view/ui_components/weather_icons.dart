import 'package:flutter/material.dart';

Row iconRow() {
  return const Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Icon(Icons.sunny, size: 100, color: Colors.orange),
      Icon(Icons.cloud, size: 100, color: Colors.orange),
      Icon(Icons.umbrella, size: 100, color: Colors.orange),
    ],
  );
}
