import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tutorial/youtube/view/ui_elements/appbar.dart';
import 'package:flutter_tutorial/youtube/view/ui_elements/custom_bottom_navigation_bar.dart';
import 'package:flutter_tutorial/youtube/view/ui_elements/custom_buttons.dart';
import 'package:flutter_tutorial/youtube/view_model/youtube_viewmodel.dart';

class YoutubePage extends ConsumerWidget {
  const YoutubePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final youtubeState = ref.watch(youtubeStateNotifierProvider);
    return Scaffold(
      appBar: customAppBar(),
      body: youtubeState.isLoading
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
                            itemCount: customButtons.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 3.2,
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 12,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return customButtons[index];
                            },
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.all(20),
                            child: const Text(
                              '急上昇動画',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: youtubeState.movies.length,
                      itemBuilder: (BuildContext context, int index) {
                        final movie = youtubeState.movies[index];
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
      bottomNavigationBar: buildBottomNavigationBar(youtubeState, ref),
    );
  }
}
