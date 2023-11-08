import 'package:flutter/material.dart';

class Mercari extends StatefulWidget {
  const Mercari({Key? key}) : super(key: key);

  @override
  State<Mercari> createState() => _mercariState();
}

class _mercariState extends State<Mercari> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          '出品',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: ListView(children: [
        Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Shortcut(),
            ),
            Container(
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
                        size: 16.0,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const ItemList(),
            const ItemList(),
            const ItemList(),
            const ItemList(),
            const ItemList(),
          ],
        ),
      ]),
    );
  }
}

class Shortcut extends StatelessWidget {
  const Shortcut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.withOpacity(0.2),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Image.network(
                'https://static.jp.mercari.com/assets/img/guide/beginner/ogp.png'),
            const Padding(
              padding: EdgeInsets.all(14.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '出品へのショートカット',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 80,
                  height: 90,
                  color: Colors.white,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.camera_alt,
                      ),
                      Text(
                        '写真を撮る',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 80,
                  height: 90,
                  color: Colors.white,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.photo_album_outlined),
                      Text(
                        'アルバム',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 80,
                  height: 90,
                  color: Colors.white,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.barcode_reader),
                      Text(
                        'バーコード',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        '(本・コスメ)',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 80,
                  height: 90,
                  color: Colors.white,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.sticky_note_2_sharp),
                      Text(
                        '下書き一覧',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ItemList extends StatefulWidget {
  const ItemList({Key? key}) : super(key: key);

  @override
  State<ItemList> createState() => _itemlistState();
}

class _itemlistState extends State<ItemList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.withOpacity(0.3)),
        ),
      ),
      child: ListTile(
        leading: Image.network(
          'https://sakidorico.s3.amazonaws.com/wp/wp-content/uploads/2023/02/63f470cb198fe-750x563.jpg',
          width: 100,
        ),
        trailing: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            primary: Colors.red,
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
        title: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'NikonD5500',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            Text(
              '¥51,000',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ],
        ),
        subtitle: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.local_fire_department,
              size: 15,
              color: Colors.blue,
            ),
            Text(
              ('446人が探しています'),
            ),
          ],
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 5.0),
      ),
    );
  }
}
