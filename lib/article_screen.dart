import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tutorial/qiita_provider.dart';

class ArticlesScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(qiitaProvider);

    return Scaffold(
      appBar: AppBar(title: Text('記事')),
      body: provider.articles.isEmpty
          ? Center(child: Text("No found"))
          : ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: provider.articles.length,
              itemBuilder: (context, index) {
                final article = provider.articles[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                      vertical: 4.0, horizontal: 8.0),
                  child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          'https://www.hokkaisozai.com/wp-content/uploads/top_concept.jpg',
                        ),
                      ),
                      title: Text(article.title),
                      subtitle: Text(article.url),
                      onTap: () {}),
                );
              },
            ),
    );
  }
}
