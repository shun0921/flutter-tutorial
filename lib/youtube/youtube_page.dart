import 'package:flutter/material.dart';

class MovieInfo {
  final String imagePath;
  final String iconPath;
  final String title;
  final String subTitle;

  MovieInfo({
    required this.imagePath,
    required this.iconPath,
    required this.title,
    required this.subTitle,
  });
}

class YoutubePage extends StatefulWidget {
  const YoutubePage({Key? key}) : super(key: key);

  @override
  State<YoutubePage> createState() => _YoutubePageState();
}

class _YoutubePageState extends State<YoutubePage> {
  int _selectedIndex = 0;

  final List<MovieInfo> _MovieData = [
    MovieInfo(
      imagePath:
          'https://cgsc.info/cgsc2020/wp-content/uploads/2020/12/image.png',
      iconPath: 'Icons.circle',
      title: 'testtesttesttesttesttest',
      subTitle: '嵐の動画のはず',
    ),
    MovieInfo(
        imagePath:
            'https://www.chipublib.org/wp-content/uploads/sites/3/2022/09/36079964425_7b3042d5e1_k.jpg',
        iconPath: 'Icons.circle',
        title: 'musicmusicmusic',
        subTitle: 'this is Eminem'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'YouTube',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.connected_tv,
              size: 25,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.notifications_none,
              size: 28,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.search_rounded,
              size: 25,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            onPressed: () {},
            icon: Stack(
              alignment: Alignment.center,
              children: [
                Icon(
                  Icons.circle,
                  size: 40,
                  color: Colors.deepPurple,
                ),
                Text(
                  'T',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ],
        backgroundColor: Colors.black.withOpacity(0.8),
        centerTitle: false,
        leading: Icon(
          Icons.play_circle_filled_outlined,
          color: Colors.red,
          size: 30,
        ),
      ),
      body: Container(
        color: Colors.black,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.black87,
                child: Column(
                  children: [
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 7,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 3.2,
                        mainAxisSpacing: 8.0,
                        crossAxisSpacing: 12.0,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        List<CustomButton> buttons = [
                          CustomButton(
                              icon: Icons.local_fire_department,
                              label: "急上昇",
                              color: Colors.red),
                          CustomButton(
                              icon: Icons.music_note,
                              label: "音楽",
                              color: Colors.teal),
                          CustomButton(
                              icon: Icons.gamepad_rounded,
                              label: "ゲーム",
                              color: Colors.pinkAccent),
                          CustomButton(
                              icon: Icons.menu_sharp,
                              label: "ニュース",
                              color: Colors.indigo),
                          CustomButton(
                              icon: Icons.menu_sharp,
                              label: "学び",
                              color: Colors.green),
                          CustomButton(
                              icon: Icons.live_tv,
                              label: "ライブ",
                              color: Colors.deepOrangeAccent),
                          CustomButton(
                              icon: Icons.play_circle_fill,
                              label: "スポーツ",
                              color: Colors.cyan),
                        ];
                        return buttons[index];
                      },
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.all(20.0),
                      child: Text("急上昇動画",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _MovieData.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 180,
                        child: Image.network(
                          _MovieData[index].imagePath,
                          fit: BoxFit.cover,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          _MovieData[index].title,
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          _MovieData[index].subTitle,
                          style: TextStyle(color: Colors.white54),
                        ),
                        leading: Stack(
                          alignment: Alignment.center,
                          children: [
                            Icon(
                              Icons.circle,
                              size: 60,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
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
        selectedLabelStyle: TextStyle(fontSize: 10),
        selectedItemColor: Colors.white,
        unselectedLabelStyle: TextStyle(fontSize: 10),
        unselectedItemColor: Colors.white.withOpacity(0.9),
        backgroundColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'ホーム',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '検索',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle_outline,
              size: 45,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.subscriptions_outlined),
            label: '登録チャンネル',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            label: 'ライブラリ',
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  CustomButton({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 1.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white),
          SizedBox(width: 5.0),
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }
}
