// ignore_for_file: avoid_catches_without_on_clauses

import 'package:flutter_tutorial/weather/model/api/weather_api_client.dart';
import 'package:flutter_tutorial/weather/model/weather_item/weather_response.dart';

class WeatherRepository {
  WeatherRepository(this._apiService);
  final WeathersApiClient _apiService;

  Future<WeatherResponse> fetchWeather(
    double latitude,
    double longitude,
    String apiKey,
  ) async {
    try {
      final response = await _apiService.getWeather(
        latitude: latitude,
        longitude: longitude,
        apiKey: apiKey,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
