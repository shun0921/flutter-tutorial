import 'package:flutter/material.dart';

class mercari extends StatefulWidget {
  const mercari({Key? key}) : super(key: key);

  @override
  State<mercari> createState() => _mercariState();
}

class _mercariState extends State<mercari> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: shortcut(),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey.withOpacity(0.3)),
                ),
              ),
              child: ListTile(
                title: Text(
                  '売れやすい持ち物',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                subtitle: Text(
                  '使わないモノを出品してみよう！',
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
                trailing: TextButton(
                  onPressed: () {
                    // ボタンがタップされたときの処理
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min, // Rowのサイズを子のサイズに合わせる
                    children: [
                      Text(
                        'すべて見る',
                        style: TextStyle(color: Colors.blue),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16.0, // アイコンのサイズを小さくする
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            itemlist(),
            itemlist(),
            itemlist(),
            itemlist(),
            itemlist(),
          ],
        ),
      ]),
    );
  }
}

class shortcut extends StatelessWidget {
  const shortcut({Key? key}) : super(key: key);

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
            Padding(
              padding: const EdgeInsets.all(14.0),
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
                  child: Column(
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
                  child: Column(
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
                  child: Column(
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
                  child: Column(
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

class itemlist extends StatefulWidget {
  const itemlist({Key? key}) : super(key: key);

  @override
  State<itemlist> createState() => _itemlistState();
}

class _itemlistState extends State<itemlist> {
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
          child: Text(
            '出品する',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 11,
            ),
          ),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            primary: Colors.red,
          ),
        ),
        title: Column(
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
        subtitle: Row(
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
        contentPadding: EdgeInsets.symmetric(horizontal: 5.0),
      ),
    );
  }
}
