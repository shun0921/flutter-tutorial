import 'package:dio/dio.dart';
import 'package:flutter_tutorial/youtube/model/movie.dart';
import 'package:retrofit/retrofit.dart';

part 'api.g.dart';

@RestApi(baseUrl: 'https://fluttertutorial-3b89d.web.app/api/v1/')
abstract class Api {
  factory Api(Dio dio, {String baseUrl}) = _Api;

  @GET('Youtube/youtube.json') // JSONファイルへの正しいパスを指定
  Future<List<Movie>> getMovies();
}
