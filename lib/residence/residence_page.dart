import 'package:flutter/material.dart';

enum Choice { recommend, refurbished }

class ResidenceInfo {
  ResidenceInfo({
    required this.imagePath,
    required this.buildingNamePath,
    required this.roomPrice,
    required this.nearStation,
    required this.roomSize,
    required this.buildingSize,
  });
  final List<String> imagePath;
  final String buildingNamePath;
  final String roomPrice;
  final String nearStation;
  final String roomSize;
  final String buildingSize;
}

class RegidencePage extends StatefulWidget {
  const RegidencePage({super.key});

  @override
  State<RegidencePage> createState() => _RegidencePageState();
}

class _RegidencePageState extends State<RegidencePage> {
  Choice selectedChoice = Choice.recommend;
  int _selectedIndex = 0;

  final List<ResidenceInfo> _residenseData = [
    ResidenceInfo(
      imagePath: [
        'https://d35omnrtvqomev.cloudfront.net/photo/article/article_part/image_path_1/528943/9e2e3a472ef6686b6d8425e0b56688.jpg',
        'https://s3-ap-northeast-1.amazonaws.com/ietate/folders/16294/images/136670/large.jpg?1645431157',
      ],
      buildingNamePath: 'みなとみらいタワマン',
      roomPrice: '9,800万円',
      nearStation: 'みなとみらい駅 徒歩10分',
      roomSize: '3LDK　南西向き',
      buildingSize: '33階/35階建',
    ),
    ResidenceInfo(
      imagePath: [
        'https://www.lettuceclub.net/i/N1/1014211/10120852.jpg',
        'https://www.madorizusakusei.com/images/case/case_2.jpg',
      ],
      buildingNamePath: 'アパート',
      roomPrice: '1,800万円',
      nearStation: '雑司ヶ谷 徒歩18分',
      roomSize: '1LDK　南西向き',
      buildingSize: '1階/2階建',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          automaticallyImplyLeading: false,
          title: Center(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Expanded(
                    child: _buildChoiceButton(Choice.recommend, 'カウルのおすすめ'),
                  ),
                ),
                Expanded(
                  child: _buildChoiceButtonSecond(
                    Choice.refurbished,
                    'リフォーム済みの物件',
                  ),
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
      body: ColoredBox(
        color: Colors.grey.withOpacity(0.2),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(5),
              child: Recommend(),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _residenseData.length,
                itemBuilder: (BuildContext context, index) {
                  return HouseDetailWidget(
                    residenceInfo: _residenseData[index],
                  );
                },
              ),
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
          fontSize: 13,
        ),
      ),
    );
  }

  Widget _buildChoiceButtonSecond(Choice choice, String text) {
    const notificationCount = '3';

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
              fontSize: 13,
            ),
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
            child: const Text(
              notificationCount,
              style: TextStyle(
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
  const Recommend({super.key});

  @override
  State<Recommend> createState() => _RecommendState();
}

class _RecommendState extends State<Recommend> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
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
                  '  カウルのおすすめ', //スペースはあえてつけてます
                  style: TextStyle(fontSize: 15),
                  overflow: TextOverflow.ellipsis,
                ),
                const Padding(
                  padding: EdgeInsets.all(8),
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
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                width: 400,
                color: Colors.grey.withOpacity(0.1),
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
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

class HouseDetailWidget extends StatelessWidget {
  const HouseDetailWidget({super.key, required this.residenceInfo});
  final ResidenceInfo residenceInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        width: 400,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Row(
              children: List.generate(
                residenceInfo.imagePath.length,
                (int imgIndex) => Expanded(
                  child: Image.network(residenceInfo.imagePath[imgIndex]),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 2, bottom: 1),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  residenceInfo.buildingNamePath,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 1, bottom: 4),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  residenceInfo.roomPrice,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 1, bottom: 4),
              child: Row(
                children: [
                  const Icon(Icons.train, size: 15),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      residenceInfo.nearStation,
                      style: const TextStyle(fontSize: 12),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 1, bottom: 4),
              child: Row(
                children: [
                  const Icon(Icons.menu, size: 15),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      residenceInfo.roomSize,
                      style: const TextStyle(fontSize: 12),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 1, bottom: 4),
              child: Row(
                children: [
                  const Icon(Icons.house_siding_sharp, size: 15),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      residenceInfo.buildingSize,
                      style: const TextStyle(fontSize: 12),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(9),
                    child: SizedBox(
                      width: 160,
                      height: 40,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: const BorderSide(
                            color: Colors.grey,
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
                    padding: const EdgeInsets.all(9),
                    child: SizedBox(
                      width: 160,
                      height: 40,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: const BorderSide(
                            color: Colors.grey,
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
