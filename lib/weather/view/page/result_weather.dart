import 'package:flutter/material.dart';
import 'package:flutter_tutorial/weather/model/weather_item/weather_data.dart';
import 'package:flutter_tutorial/weather/view/ui_components/appbar.dart';
import 'package:flutter_tutorial/weather/view/ui_components/result_weather_card.dart';
import 'package:flutter_tutorial/weather/view/ui_components/today_clothing_card.dart';
import 'package:flutter_tutorial/weather/viewmodel/weather_provider.dart';
import 'package:provider/provider.dart';

class ResultWeatherPage extends StatelessWidget {
  const ResultWeatherPage({
    super.key,
    required this.forecasts,
    required this.city,
  });

  final List<WeatherForecast> forecasts;
  final String city;

  @override
  Widget build(BuildContext context) {
    final todayForecast = forecasts.isNotEmpty ? forecasts.first : null;
    final weatherViewModel =
        Provider.of<WeatherViewModel>(context, listen: false);
    // ignore: lines_longer_than_80_chars
    final clothingRecommendation = weatherViewModel
        .clothingRecommendByTemperature(todayForecast?.temp?.day);

    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(
                  width: 10,
                ),
                Text(
                  city,
                  style: const TextStyle(
                    fontSize: 35,
                  ),
                ),
                const Text(
                  '  の天気',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                width: 120,
                child: Text(
                  '今日',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 120,
                child: Text(
                  '明日',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 120,
                child: Text(
                  '明後日',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
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
