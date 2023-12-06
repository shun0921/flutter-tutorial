import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tutorial/qiita/model/api/api.dart';
import 'package:flutter_tutorial/qiita/model/article_state/article_state.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final dioProvider = Provider<Dio>((_) {
  return Dio()..interceptors.add(PrettyDioLogger());
});

final qiitaApiClientProvider = Provider((ref) {
  final dio = ref.read(dioProvider);
  return Api(dio);
});

final qiitaRepositoryProvider = Provider<QiitaRepository>(
  QiitaRepository.new,
);

class QiitaRepository {
  QiitaRepository(this._ref);

  final Ref _ref;

  Api get _apiClient => _ref.read(qiitaApiClientProvider);

  Future<List<Article>> fetchArticles(String tag) async {
    return _apiClient.fetchArticles(tag);
  }
}
