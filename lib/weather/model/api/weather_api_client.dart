import 'package:dio/dio.dart';
import 'package:flutter_tutorial/weather/model/weather_item/weather_response.dart';
import 'package:retrofit/retrofit.dart';

part 'weather_api_client.g.dart';

@RestApi(baseUrl: 'https://api.openweathermap.org/data/2.5')
abstract class WeathersApiClient {
  factory WeathersApiClient(Dio dio, {String baseUrl}) = _WeathersApiClient;

  @GET('/onecall')
  Future<WeatherResponse> getWeather({
    @Query('lat') required double latitude,
    @Query('lon') required double longitude,
    @Query('appid') required String apiKey,
    @Query('units') String units = 'metric',
    @Query('lang') String lang = 'ja',
  });
}
