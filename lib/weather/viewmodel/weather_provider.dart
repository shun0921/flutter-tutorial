import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tutorial/weather/model/weather_item/weather_response.dart';
import 'package:flutter_tutorial/weather/view/ui_components/city.dart';

import '../model/api/weather_api_client.dart';
import '../model/repository/repository.dart';

final weatherViewModelProvider =
    StateNotifierProvider<WeatherViewModel, WeatherState>((ref) {
  return WeatherViewModel();
});

class WeatherState {
  WeatherState({
    this.weatherResponse,
    this.isLoading = false,
    this.isNavigationNeeded = false,
    this.errorMessage,
    this.selectedCity = City.tokyo,
  });
  final WeatherResponse? weatherResponse;
  final bool isLoading;
  final bool isNavigationNeeded;
  final String? errorMessage;
  final City selectedCity;

  WeatherState copyWith({
    WeatherResponse? weatherResponse,
    bool? isLoading,
    bool? isNavigationNeeded,
    String? errorMessage,
    City? selectedCity,
  }) {
    return WeatherState(
      weatherResponse: weatherResponse ?? this.weatherResponse,
      isLoading: isLoading ?? this.isLoading,
      isNavigationNeeded: isNavigationNeeded ?? this.isNavigationNeeded,
      errorMessage: errorMessage ?? this.errorMessage,
      selectedCity: selectedCity ?? this.selectedCity,
    );
  }
}

class WeatherViewModel extends StateNotifier<WeatherState> {
  WeatherViewModel() : super(WeatherState()) {
    _repository = WeatherRepository(WeathersApiClient(Dio()));
  }

  late final WeatherRepository _repository;
  final String apiKey = '4b0e4756a7f3015c0d08c2f0263c224a';

  Future<void> fetchWeather() async {
    final city = state.selectedCity;
    state = state.copyWith(isLoading: true);
    try {
      final response =
          await _repository.fetchWeather(city.latitude, city.longitude, apiKey);

      if (response.dailyForecasts != null) {
        state = state.copyWith(
          weatherResponse: WeatherResponse(
            dailyForecasts: response.dailyForecasts!.take(3).toList(),
          ),
          isNavigationNeeded: true,
          isLoading: false,
        );
      } else {
        state = state.copyWith(
          weatherResponse: response,
          isLoading: false,
        );
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: 'データの取得に失敗しました。');
    }
  }

  void setSelectedCity(City newCity) {
    if (state.selectedCity == newCity) {
      return;
    }
    state = state.copyWith(selectedCity: newCity);
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
}
