import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tutorial/weather/model/weather_item/weather_data.dart';
import 'package:flutter_tutorial/weather/view/ui_components/appbar.dart';
import 'package:flutter_tutorial/weather/view/ui_components/date.dart';
import 'package:flutter_tutorial/weather/view/ui_components/result_weather_card.dart';
import 'package:flutter_tutorial/weather/view/ui_components/today_clothing_card.dart';
import 'package:flutter_tutorial/weather/view/ui_components/weather_of_selected_city.dart';
import 'package:flutter_tutorial/weather/viewmodel/weather_provider.dart';

class ResultWeatherPage extends ConsumerWidget {
  const ResultWeatherPage({
    super.key,
    required this.forecasts,
    required this.city,
  });

  final List<WeatherForecast> forecasts;
  final String city;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todayForecast = forecasts.isNotEmpty ? forecasts.first : null;
    final weatherViewModel = ref.watch(weatherViewModelProvider.notifier);
    final weatherState = ref.watch(weatherViewModelProvider);
    if (weatherState.isLoading) {
      return const CircularProgressIndicator();
    }
    final clothingRecommendation = todayForecast != null
        ? weatherViewModel
            .clothingRecommendByTemperature(todayForecast.temp?.day)
        : '服装のおすすめ: 情報なし';

    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          WeatherOfSelectedCity(
            city: city,
          ),
          const SizedBox(
            height: 50,
          ),
          const DateRow(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: forecasts
                .map(
                  (forecast) => ResultWeatherCard(
                    forecast: forecast,
                    clothingRecommendation: clothingRecommendation,
                  ),
                )
                .toList(),
          ),
          const SizedBox(
            height: 20,
          ),
          todayClothing(clothingRecommendation),
        ],
      ),
    );
  }
}
