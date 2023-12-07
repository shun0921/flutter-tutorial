import 'package:flutter/material.dart';

class WeatherOfSelectedCity extends StatelessWidget {
  const WeatherOfSelectedCity({super.key, required this.city});
  final String city;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
