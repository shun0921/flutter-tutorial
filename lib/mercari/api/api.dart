import 'package:dio/dio.dart';
import 'package:flutter_tutorial/mercari/model/item.dart';
import 'package:retrofit/retrofit.dart';

part 'api.g.dart';

@RestApi(baseUrl: 'https://fluttertutorial-3b89d.web.app/api/v1/')
abstract class Api {
  factory Api(Dio dio, {String baseUrl}) = _Api;

  @GET('Mercari/mercari.json')
  Future<List<Item>> getItemks();
}
