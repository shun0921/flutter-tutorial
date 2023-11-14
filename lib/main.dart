import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tutorial/article_screen.dart';
import 'package:flutter_tutorial/qiita_provider.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Qiita記事取得',
      home: Scaffold(
        appBar: AppBar(title: const Text('Qiita記事取得')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () => fetchAndDisplayArticles(ref, 'iOS'),
                child: const Text('iOS'),
              ),
              ElevatedButton(
                onPressed: () => fetchAndDisplayArticles(ref, 'Android'),
                child: const Text('Android'),
              ),
              ElevatedButton(
                onPressed: () => fetchAndDisplayArticles(ref, 'Flutter'),
                child: const Text('Flutter'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void fetchAndDisplayArticles(WidgetRef ref, String tag) async {
    try {
      final qiitaProviderInstance = ref.read(qiitaProvider);
      await qiitaProviderInstance.fetchArticles(tag);
      navigatorKey.currentState!.push(
        MaterialPageRoute(builder: (context) => const ArticlesScreen()),
      );
      // ignore: empty_catches
    } catch (e) {}
  }
}
