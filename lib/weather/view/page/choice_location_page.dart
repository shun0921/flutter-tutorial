import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tutorial/weather/view/ui_components/appbar.dart';
import 'package:flutter_tutorial/weather/view/ui_components/city.dart';
import 'package:flutter_tutorial/weather/view/ui_components/get_weather_button.dart';
import 'package:flutter_tutorial/weather/view/ui_components/loading.dart';
import 'package:flutter_tutorial/weather/view/ui_components/place_pulldownlist.dart';
import 'package:flutter_tutorial/weather/view/ui_components/weather_icons.dart';
import 'package:flutter_tutorial/weather/viewmodel/weather_provider.dart';

class ChoiceLocationPage extends ConsumerWidget {
  const ChoiceLocationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherState = ref.watch(weatherViewModelProvider);

    return Scaffold(
      appBar: const CustomAppBar(),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 100),
                    iconRow(),
                    const SizedBox(height: 50),
                    const Text(
                      '都市を選択して天気を確認',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 50),
                    PlacePullDown(
                      selectedCity: weatherState.selectedCity,
                      onCityChanged: (City newCity) {
                        ref
                            .read(weatherViewModelProvider.notifier)
                            .setSelectedCity(newCity);
                      },
                    ),
                    const SizedBox(height: 140),
                    const GetWeatherButton(),
                  ],
                ),
              ),
            ),
          ),
          if (weatherState.isLoading) const Loading(),
        ],
      ),
    );
  }
}
