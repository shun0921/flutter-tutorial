import 'package:flutter/material.dart';

enum Choice { recommend, refurbished }

class RegidencePage extends StatefulWidget {
  const RegidencePage({Key? key}) : super(key: key);

  @override
  State<RegidencePage> createState() => _RegidencePageState();
}

class _RegidencePageState extends State<RegidencePage> {
  Choice selectedChoice = Choice.recommend;
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          title: Center(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Expanded(
                    child: _buildChoiceButton(Choice.recommend, 'カウルのおすすめ'),
                  ),
                ),
                Expanded(
                  child: _buildChoiceButtonSecond(
                      Choice.refurbished, 'リフォーム済みの物件'),
                ),
                const SizedBox(
                  width: 40,
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.teal,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {},
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.grey.withOpacity(0.2),
        child: ListView(
          children: const [
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Recommend(),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: HouseDetail(),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: HouseDetail(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedLabelStyle: const TextStyle(fontSize: 10),
        selectedItemColor: Colors.teal,
        unselectedLabelStyle: const TextStyle(fontSize: 10),
        unselectedItemColor: Colors.grey.withOpacity(0.9),
        backgroundColor: Colors.white,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'ホーム',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'お気にいり',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                const Icon(Icons.messenger_outline),
                Positioned(
                  top: -5,
                  right: -5,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(9),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 18,
                      minHeight: 18,
                    ),
                    child: const Text(
                      '1',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            label: 'メッセージ',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'マイページ',
          ),
        ],
      ),
    );
  }

  Widget _buildChoiceButton(Choice choice, String text) {
    return ElevatedButton(
      onPressed: () => setState(() {
        selectedChoice = choice;
      }),
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(const Size(100, 40)),
        padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
      ),
      child: Text(
        text,
        overflow: TextOverflow.ellipsis,
        softWrap: false,
        style: TextStyle(
            color: selectedChoice == choice ? Colors.teal : Colors.black,
            fontSize: 13),
      ),
    );
  }

  Widget _buildChoiceButtonSecond(Choice choice, String text) {
    String notificationCount = '3';

    return Stack(
      clipBehavior: Clip.none,
      children: [
        ElevatedButton(
          onPressed: () => setState(() {
            selectedChoice = choice;
          }),
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(const Size(100, 40)),
            padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
          ),
          child: Text(
            text,
            overflow: TextOverflow.ellipsis,
            softWrap: false,
            style: TextStyle(
                color: selectedChoice == choice ? Colors.teal : Colors.black,
                fontSize: 13),
          ),
        ),
        Positioned(
          right: 0,
          top: 2,
          child: Container(
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(9),
            ),
            constraints: const BoxConstraints(
              minWidth: 18,
              minHeight: 18,
            ),
            child: Text(
              notificationCount,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}

class Recommend extends StatefulWidget {
  const Recommend({Key? key}) : super(key: key);

  @override
  State<Recommend> createState() => _RecommendState();
}

class _RecommendState extends State<Recommend> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const Text(
                  '  カウルのおすすめ',
                  style: TextStyle(fontSize: 15),
                  overflow: TextOverflow.ellipsis,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '新着3件',
                    style: TextStyle(fontSize: 15, color: Colors.red),
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(0, 0),
                  ),
                  child: const Text(
                    '編集',
                    style: TextStyle(color: Colors.teal),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.teal,
                  ),
                  padding: const EdgeInsets.all(0),
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 400,
                color: Colors.grey.withOpacity(0.1),
                child: const Column(
                  mainAxisSize: MainAxisSize.min, // Columnのサイズを子に合わせる
                  children: [
                    Row(
                      children: [
                        Icon(Icons.train, size: 15),
                        Expanded(
                          child: Text(
                            '東京駅・品川駅・川崎駅・横浜駅・目黒駅・恵比寿駅・渋谷駅・',
                            style: TextStyle(fontSize: 12),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.currency_yen, size: 15),
                        Expanded(
                          child: Text(
                            '下限なし〜2,000万円',
                            style: TextStyle(fontSize: 12),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.info, size: 15),
                        Expanded(
                          child: Text(
                            '1R ~ 4LDK / 10m2以上 / 徒歩20分',
                            style: TextStyle(fontSize: 12),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HouseDetail extends StatefulWidget {
  const HouseDetail({Key? key}) : super(key: key);

  @override
  State<HouseDetail> createState() => _HouseDetailState();
}

class _HouseDetailState extends State<HouseDetail> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: 400,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Image.network(
                      'https://thumb.ac-illust.com/18/185fe60d543230116f69f3b41238a90d_t.jpeg'),
                ),
                Expanded(
                  child: Image.network(
                      'https://www.sakai-iin.com/_p/acre/25978/images/pc/smart_phone_8ec92575.jpg'),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8.0, top: 2.0, bottom: 1.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Rising place川崎',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8.0, top: 1.0, bottom: 4.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '2,000万円',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8.0, top: 1.0, bottom: 4.0),
              child: Row(
                children: [
                  Icon(Icons.train, size: 15),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      '京急本線 京急川崎駅より 徒歩9分',
                      style: TextStyle(fontSize: 12),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8.0, top: 1.0, bottom: 4.0),
              child: Row(
                children: [
                  Icon(Icons.menu, size: 15),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      '1k/ 21.24m2 南西向き',
                      style: TextStyle(fontSize: 12),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8.0, top: 1.0, bottom: 4.0),
              child: Row(
                children: [
                  Icon(Icons.house_siding_sharp, size: 15),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      '2階/15階建 築5年',
                      style: TextStyle(fontSize: 12),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: SizedBox(
                      width: 160,
                      height: 40,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: const BorderSide(
                            color: Colors.grey,
                            width: 1,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 0,
                        ),
                        icon: const Icon(
                          Icons.restore_from_trash,
                          color: Colors.grey,
                        ),
                        label: const Text(
                          '興味なし',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: SizedBox(
                      width: 160,
                      height: 40,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: const BorderSide(
                            color: Colors.grey,
                            width: 1,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 0,
                        ),
                        icon: const Icon(
                          Icons.favorite_border,
                          color: Colors.grey,
                        ),
                        label: const Text(
                          'お気に入り',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
