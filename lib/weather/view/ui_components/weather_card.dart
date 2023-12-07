import 'package:flutter/material.dart';
import 'package:flutter_tutorial/weather/model/weather_item/weather_data.dart';

Flexible weatherCard(
  WeatherDescription? weather,
  Temperature? temp,
  String clothingRecommendation,
) {
  return Flexible(
    child: Center(
      child: SizedBox(
        height: 250,
        child: Card(
          child: Center(
            child: Column(
              children: [
                if (weather?.icon != null) const SizedBox(height: 10),
                Image.network(
                  'http://openweathermap.org/img/wn/${weather!.icon}@2x.png',
                  height: 100,
                  width: 100,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text('平均気温: ${temp?.day?.toStringAsFixed(1) ?? '不明'}°C'),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('max  /  min'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${temp?.max?.toStringAsFixed(1) ?? '不明'}°C / ${temp?.min?.toStringAsFixed(1) ?? '不明'}°C',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Text('今日の天気:${weather.description ?? '不明'}'),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
