import 'package:flutter/material.dart';
import 'package:flutter_tutorial/animation/animation_page.dart';
import 'package:flutter_tutorial/building/building_layout_page.dart';
import 'package:flutter_tutorial/mercari/mercari_page.dart';
import 'package:flutter_tutorial/qiita/view/qiita_home_page.dart';
import 'package:flutter_tutorial/residence/residence_page.dart';
import 'package:flutter_tutorial/weather/view/page/choice_location_page.dart';
import 'package:flutter_tutorial/youtube/youtube_page.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<BuildingLayoutPage>(
                    builder: (context) => const BuildingLayoutPage(),
                  ),
                );
              },
              child: const Text('Tutorial1'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<AnimationPage>(
                    builder: (context) => const AnimationPage(),
                  ),
                );
              },
              child: const Text('Tutorial1-1'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<YoutubePage>(
                    builder: (context) => const YoutubePage(),
                  ),
                );
              },
              child: const Text('YouTubeボタン'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<RegidencePage>(
                    builder: (context) => const RegidencePage(),
                  ),
                );
              },
              child: const Text('Regidence'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const QiitaHomePage(),
                  ),
                );
              },
              child: const Text('Qiita'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<Mercari>(
                    builder: (context) => const Mercari(),
                  ),
                );
              },
              child: const Text('Mercari'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<ChoiceLocationPage>(
                    builder: (context) => const ChoiceLocationPage(),
                  ),
                );
              },
              child: const Text('Weather'),
            ),
          ],
        ),
      ),
    );
  }
}
