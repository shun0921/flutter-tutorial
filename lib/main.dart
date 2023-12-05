import 'package:flutter/material.dart';
import 'package:flutter_tutorial/index_page.dart';
import 'package:flutter_tutorial/weather/viewmodel/weather_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<WeatherViewModel>(
      create: (_) => WeatherViewModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const IndexPage(),
    );
  }
}
