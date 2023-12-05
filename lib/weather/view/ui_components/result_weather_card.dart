import 'package:flutter/material.dart';
import 'package:flutter_tutorial/weather/model/weather_item/weather_data.dart';
import 'package:flutter_tutorial/weather/view/ui_components/weather_card.dart';

class ResultWeatherCard extends StatelessWidget {
  const ResultWeatherCard({
    super.key,
    required this.forecast,
    required this.clothingRecommendation,
  });
  final WeatherForecast forecast;
  final String clothingRecommendation;

  @override
  Widget build(BuildContext context) {
    final weather = forecast.weather?.first;
    final temp = forecast.temp;
    return weatherCard(weather, temp, clothingRecommendation);
  }
}
