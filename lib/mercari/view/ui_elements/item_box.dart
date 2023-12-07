import 'package:flutter/material.dart';

DecoratedBox ItemBox() {
  return DecoratedBox(
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(color: Colors.grey.withOpacity(0.3)),
      ),
    ),
    child: ListTile(
      title: const Text(
        '売れやすい持ち物',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      subtitle: const Text(
        '使わないモノを出品してみよう！',
        style: TextStyle(
          fontSize: 13,
        ),
      ),
      trailing: TextButton(
        onPressed: () {},
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'すべて見る',
              style: TextStyle(color: Colors.blue),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    ),
  );
}
