import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tutorial/qiita_article.dart';
import 'package:flutter_tutorial/qiita_repository.dart';

final qiitaProvider = ChangeNotifierProvider<QiitaProvider>((ref) {
  return QiitaProvider();
});

class QiitaProvider with ChangeNotifier {
  final QiitaRepository _repository = QiitaRepository();
  List<QiitaArticle> _articles = [];
  List<QiitaArticle> get articles => _articles;

  Future<void> fetchArticles(String tag) async {
    _articles = await _repository.fetchQiitaArticles(tag);
    notifyListeners();
  }
}
