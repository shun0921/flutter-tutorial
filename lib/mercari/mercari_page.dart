import 'package:flutter/material.dart';

class ItemDetail {
  final String imageUrl;
  final String title;
  final String price;
  final String watch;

  ItemDetail({
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.watch,
  });
}

class Mercari extends StatefulWidget {
  const Mercari({Key? key}) : super(key: key);

  @override
  State<Mercari> createState() => _mercariState();
}

class _mercariState extends State<Mercari> {
  final List<ItemDetail> _itemData = [
    ItemDetail(
      imageUrl:
          'https://tokyobike.com/wp-content/uploads/2022/04/thu_leger_coalgrey-730x487.jpg',
      title: 'TOKYO BIKE',
      price: '¥2,8000',
      watch: '5人が探してます',
    ),
    ItemDetail(
      imageUrl:
          'https://kddi-h.assetsadobe3.com/is/image/content/dam/au-com/extlib/iphone/product/iphone-15/images/slider/iPhone_15_Blue_01.jpg?scl=1&qlt=90',
      title: 'iphone15plus',
      price: '¥12,8000',
      watch: '1000人が探してます',
    ),
    ItemDetail(
      imageUrl:
          'https://tshop.r10s.jp/magcruise/cabinet/magride/thumbnail186.jpg',
      title: '子供用ヘルメット',
      price: '¥280',
      watch: '12人が探してます',
    ),
    ItemDetail(
      imageUrl:
          'https://kddi-h.assetsadobe3.com/is/image/content/dam/au-com/extlib/iphone/product/iphone-15/images/slider/iPhone_15_Blue_01.jpg?scl=1&qlt=90',
      title: 'iphone15plus',
      price: '¥12,8000',
      watch: '1000人が探してます',
    ),
    ItemDetail(
      imageUrl:
          'https://jp.images-monotaro.com/Monotaro3/pi/full/mono24923476-230405-02.jpg',
      title: 'ヘルメット',
      price: '¥2,800',
      watch: '1人が探してます',
    ),
    ItemDetail(
      imageUrl:
          'https://kddi-h.assetsadobe3.com/is/image/content/dam/au-com/extlib/iphone/product/iphone-15/images/slider/iPhone_15_Blue_01.jpg?scl=1&qlt=90',
      title: 'iphone15plus',
      price: '¥12,8000',
      watch: '1000人が探してます',
    ),
  ];

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
      body: SingleChildScrollView(
        child: Column(
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
            ListView.builder(
                itemCount: _itemData.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext cotext, int index) {
                  return ItemList(itemDetail: _itemData[index]);
                }),
          ],
        ),
      ),
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

class ItemList extends StatelessWidget {
  final ItemDetail itemDetail;
  const ItemList({Key? key, required this.itemDetail}) : super(key: key);

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
          itemDetail.imageUrl,
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
        title: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              itemDetail.title,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            Text(
              itemDetail.price,
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
              itemDetail.watch,
            ),
          ],
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 5.0),
      ),
    );
  }
}
