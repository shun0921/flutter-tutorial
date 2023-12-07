import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tutorial/weather/view/page/result_weather.dart';
import 'package:flutter_tutorial/weather/viewmodel/weather_provider.dart';

class GetWeatherButton extends ConsumerWidget {
  const GetWeatherButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherViewModel = ref.watch(weatherViewModelProvider.notifier);
    final weatherState = ref.watch(weatherViewModelProvider);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange,
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
      ),
      onPressed: () async {
        await weatherViewModel.fetchWeather();
        // ignore: inference_failure_on_instance_creation
        await Future.delayed(Duration.zero);
        final updatedWeatherState = ref.read(weatherViewModelProvider);
        if (updatedWeatherState.isNavigationNeeded) {
          // ignore: use_build_context_synchronously
          await Navigator.push(
            context,
            MaterialPageRoute<ResultWeatherPage>(
              builder: (context) => ResultWeatherPage(
                forecasts: weatherState.weatherResponse?.dailyForecasts ?? [],
                city: weatherState.selectedCity.name,
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
