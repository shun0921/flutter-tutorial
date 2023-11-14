import 'package:dio/dio.dart';

import 'qiita_article.dart';

class QiitaRepository {
  final Dio dio = Dio();

  Future<List<QiitaArticle>> fetchQiitaArticles(String tag) async {
    dio.options.headers['Authorization'] =
        'Bearer 359084ed5b00eb056ac5b9411b9791eb44fe8228';
    final response =
        await dio.get('https://qiita.com/api/v2/items?query=tag:$tag');
    return (response.data as List)
        .map((e) => QiitaArticle.fromJson(e))
        .toList();
  }
}
