import 'package:flutter/material.dart';
import 'package:flutter_tutorial/animation/animation_page.dart';
import 'package:flutter_tutorial/building/building_layout_page.dart';
import 'package:flutter_tutorial/mercari/mercari_page.dart';
import 'package:flutter_tutorial/residence/residence_page.dart';
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
                  // ignore: inference_failure_on_instance_creation
                  MaterialPageRoute(
                    builder: (context) => const BuildingLayoutPage(),
                  ),
                );
              },
              child: const Text('Tutorial1'),
            ),
            ElevatedButton(
              onPressed: () {
                // ignore: lines_longer_than_80_chars
                Navigator.push(
                  context,
                  // ignore: inference_failure_on_instance_creation
                  MaterialPageRoute(
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
                  // ignore: inference_failure_on_instance_creation
                  MaterialPageRoute(builder: (context) => const YoutubePage()),
                );
              },
              child: const Text('YouTubeボタン'),
            ),
          ],
        ),
      ),
    );
  }
}
