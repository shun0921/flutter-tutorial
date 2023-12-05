import 'package:flutter/material.dart';
import 'package:flutter_tutorial/weather/view/page/result_weather.dart';
import 'package:flutter_tutorial/weather/viewmodel/weather_provider.dart';

class GetWeatherButton extends StatelessWidget {
  const GetWeatherButton({super.key, required this.weatherViewModel});

  final WeatherViewModel weatherViewModel;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange,
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
      ),
      onPressed: () async {
        const apiKey = '4b0e4756a7f3015c0d08c2f0263c224a';
        await weatherViewModel.fetchWeather(
          weatherViewModel.selectedCity.latitude,
          weatherViewModel.selectedCity.longitude,
          apiKey,
        );
        if (weatherViewModel.isNavigationNeeded) {
          // ignore: use_build_context_synchronously
          await Navigator.push(
            context,
            MaterialPageRoute<ResultWeatherPage>(
              builder: (context) => ResultWeatherPage(
                forecasts: weatherViewModel.dailyForecasts!,
                city: weatherViewModel.selectedCity.name,
              ),
            ),
          );
        }
      },
      child: const Text(
        '天気を取得',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.black.withOpacity(0.5),
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
