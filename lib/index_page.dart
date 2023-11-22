import 'package:flutter/material.dart';
import 'package:flutter_tutorial/animation/animation_page.dart';
import 'package:flutter_tutorial/building/building_layout_page.dart';
import 'package:flutter_tutorial/mercari/mercari_page.dart';
import 'package:flutter_tutorial/regidence/regidence_page.dart';
import 'package:flutter_tutorial/todo_list/model/todos.dart';
import 'package:flutter_tutorial/todo_list/view/todo_view.dart';
import 'package:flutter_tutorial/youtube/youtube_page.dart';

class IndexPage extends StatelessWidget {
  final MyDatabase database;
  IndexPage({
    Key? key,
    required this.database,
  }) : super(key: key);

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
                    MaterialPageRoute(
                        builder: (context) => BuildingLayoutPage()),
                  );
                },
                child: Text('Tutorial1')),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AnimationPage()),
                );
              },
              child: Text('Tutorial1-1'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => YoutubePage()),
                );
              },
              child: Text('YouTubeボタン'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegidencePage()),
                );
              },
              child: Text('Regidence'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Mercari()),
                );
              },
              child: Text('Mercari'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TodoView(database: database),
                  ),
                );
              },
              child: Text('Todo'),
            ),
          ],
        ),
      ),
    );
  }
}
