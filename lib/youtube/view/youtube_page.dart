import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/youtube/api/api.dart';
import 'package:flutter_tutorial/youtube/model/movie.dart';

class YoutubePage extends StatefulWidget {
  const YoutubePage({super.key});

  @override
  State<YoutubePage> createState() => _YoutubePageState();
}

class _YoutubePageState extends State<YoutubePage> {
  int _selectedIndex = 0;
  List<Movie> _movies = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchMovies();
  }

  Future<void> _fetchMovies() async {
    setState(() {
      isLoading = true; // ローディング開始
    });

    final dio = Dio();
    final api = Api(dio);

    try {
      final movies = await api.getMovies();
      setState(() {
        _movies = movies;
        isLoading = false; // ローディング終了
      });
    } catch (e) {
      setState(() {
        isLoading = false; // エラー時もローディング終了
      });
    }
  }

  final List<CustomButton> buttons = [
    const CustomButton(
        icon: Icons.local_fire_department, label: "急上昇", color: Colors.red),
    const CustomButton(icon: Icons.music_note, label: "音楽", color: Colors.teal),
    const CustomButton(
        icon: Icons.gamepad_rounded, label: "ゲーム", color: Colors.pinkAccent),
    const CustomButton(
        icon: Icons.menu_sharp, label: "ニュース", color: Colors.indigo),
    const CustomButton(
        icon: Icons.menu_sharp, label: "学び", color: Colors.green),
    const CustomButton(
        icon: Icons.live_tv, label: "ライブ", color: Colors.deepOrangeAccent),
    const CustomButton(
        icon: Icons.play_circle_fill, label: "スポーツ", color: Colors.cyan),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
        backgroundColor: Colors.black.withOpacity(0.8),
        centerTitle: false,
        leading: const Icon(
          Icons.play_circle_filled_outlined,
          color: Colors.red,
          size: 30,
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ColoredBox(
              color: Colors.black,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ColoredBox(
                      color: Colors.black87,
                      child: Column(
                        children: [
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: buttons.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 3.2,
                              mainAxisSpacing: 8.0,
                              crossAxisSpacing: 12.0,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return buttons[index];
                            },
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.all(20.0),
                            child: const Text("急上昇動画",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20)),
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _movies.length,
                      itemBuilder: (BuildContext context, int index) {
                        final movie = _movies[index];
                        return Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              height: 180,
                              child: Image.network(
                                movie.imagePath,
                                fit: BoxFit.cover,
                              ),
                            ),
                            ListTile(
                              title: Text(
                                movie.title,
                                style: const TextStyle(color: Colors.white),
                              ),
                              subtitle: Text(
                                movie.channelName,
                                style: const TextStyle(color: Colors.white54),
                              ),
                              leading: const Icon(
                                Icons.circle,
                                size: 60,
                                color: Colors.white,
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
        selectedLabelStyle: const TextStyle(fontSize: 10),
        selectedItemColor: Colors.white,
        unselectedLabelStyle: const TextStyle(fontSize: 10),
        unselectedItemColor: Colors.white.withOpacity(0.9),
        backgroundColor: Colors.black,
        items: const [
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

  const CustomButton({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(width: 5),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }
}
