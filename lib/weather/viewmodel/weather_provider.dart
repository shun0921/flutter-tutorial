import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_tutorial/weather/model/api/weather_api_client.dart';
import 'package:flutter_tutorial/weather/model/repository/repository.dart';
import 'package:flutter_tutorial/weather/model/weather_item/weather_data.dart';
import 'package:flutter_tutorial/weather/model/weather_item/weather_response.dart';
import 'package:flutter_tutorial/weather/view/ui_components/place_pulldownlist.dart';

class WeatherViewModel with ChangeNotifier {
  WeatherViewModel()
      : _repository = WeatherRepository(WeathersApiClient(Dio()));
  final WeatherRepository _repository;
  WeatherResponse? weatherResponse;
  bool _isLoading = false;
  bool _isNavigationNeeded = false;
  bool get isLoading => _isLoading;
  bool get isNavigationNeeded => _isNavigationNeeded;
  City _selectedCity = City(name: '東京', latitude: 35.6895, longitude: 139.6917);
  City get selectedCity => _selectedCity;

  set selectedCity(City newValue) {
    if (_selectedCity == newValue) {
      return;
    }
    _selectedCity = newValue;
    notifyListeners();
  }

  Future<void> fetchWeather(
    double latitude,
    double longitude,
    String apiKey,
  ) async {
    _isLoading = true;
    _isNavigationNeeded = false;
    notifyListeners();

    try {
      final response =
          await _repository.fetchWeather(latitude, longitude, apiKey);

      if (response.dailyForecasts != null) {
        weatherResponse = WeatherResponse(
          dailyForecasts: response.dailyForecasts!.take(3).toList(),
        );
        _isNavigationNeeded = true;
      } else {
        weatherResponse = response;
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  String clothingRecommendByTemperature(double? temperture) {
    if (temperture == null) {
      return '服装のおすすめ: 情報なし';
    }
    final recommendations = {
      3: '厚めのダウン\n厚めのセーター\n裏起毛のズボン\nとにかく暖かい格好',
      6: '厚めのアウター、セーター\n暖かいズボン\n手袋、ニット帽、マフラー',
      9: '風を通さないアウターコート\nトレーナー\n厚めのズボン',
      12: 'ライトコート\nトレーナー\n薄手のニット',
      15: 'トレーナーや厚手のニット\nヒートテックや薄手のアウター',
      18: '長袖シャツ\n脱ぎ着できるアイテムがあると◎',
      21: 'Tシャツ\n薄めパンツや軽いスカート',
      24: '半袖シャツ\n薄めのズボンやショートパンツ\nサンダル',
      27: '半袖シャツ\n短パン\n開放的なサンダル\n日焼け防止帽子',
      30: '軽装&通気性\n日焼け防止を重視',
    };
    for (final threshold in recommendations.keys) {
      if (temperture <= threshold) {
        return recommendations[threshold]!;
      }
    }
    return '服装のおすすめ: データに基づくおすすめが利用できません';
  }

  List<WeatherForecast>? get dailyForecasts => weatherResponse?.dailyForecasts;
}
