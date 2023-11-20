import 'package:dio/dio.dart';
import 'package:flutter_tutorial/qiita/model/article_state/article_state.dart';
import 'package:retrofit/retrofit.dart';

part 'api.g.dart';

@RestApi(baseUrl: "https://qiita.com/api/v2")
abstract class Api {
  factory Api(Dio dio, {String baseUrl}) = _Api;

  @GET('/tags/{tag}/items')
  Future<List<Article>> fetchArticles(
    @Path('tag') String tag,
  );
}
