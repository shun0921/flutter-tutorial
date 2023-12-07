import 'package:flutter/material.dart';
import 'package:flutter_tutorial/mercari/model/item.dart';

class ItemList extends StatelessWidget {
  const ItemList({super.key, required this.item});
  final Item item;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.withOpacity(0.3)),
        ),
      ),
      child: ListTile(
        leading: Image.network(
          item.imageUrl,
          width: 100,
        ),
        trailing: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            backgroundColor: Colors.red,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
          ),
          child: const Text(
            '出品する',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 11,
            ),
          ),
        ),
        title: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.title,
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
            Text(
              item.price,
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
          ],
        ),
        subtitle: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.local_fire_department,
              size: 15,
              color: Colors.blue,
            ),
            Text(
              item.watch,
            ),
          ],
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 5),
      ),
    );
  }
}
