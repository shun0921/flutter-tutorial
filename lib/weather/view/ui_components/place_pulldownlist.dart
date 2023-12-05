import 'package:flutter/material.dart';

class City {
  City({required this.name, required this.latitude, required this.longitude});
  final String name;
  final double latitude;
  final double longitude;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    return other is City && other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}

class PlacePullDown extends StatefulWidget {
  const PlacePullDown({
    super.key,
    required this.selectedCity,
    required this.onCityChanged,
  });
  final City selectedCity;
  final void Function(City) onCityChanged;

  @override
  State<PlacePullDown> createState() => _PlacePullDownState();
}

class _PlacePullDownState extends State<PlacePullDown> {
  @override
  Widget build(BuildContext context) {
    final cities = <City>[
      City(name: '東京', latitude: 35.6895, longitude: 139.6917),
      City(name: '北海道', latitude: 43.0642, longitude: 141.3468),
      City(name: '仙台', latitude: 38.2688, longitude: 140.8719),
      City(name: '名古屋', latitude: 35.1815, longitude: 136.9066),
      City(name: '大阪', latitude: 34.6937, longitude: 135.5023),
      City(name: '松山', latitude: 33.8392, longitude: 132.7657),
      City(name: '高松', latitude: 34.3428, longitude: 134.0466),
      City(name: '熊本', latitude: 32.8032, longitude: 130.7079),
      City(name: '福岡', latitude: 33.6064, longitude: 130.4181),
      City(name: '沖縄', latitude: 26.5013, longitude: 127.9454),
      City(name: 'バンクーバー', latitude: 49.2827, longitude: -123.1207),
      City(name: 'ロサンゼルス', latitude: 34.0522, longitude: -118.2437),
      City(name: 'ニューヨーク', latitude: 40.7128, longitude: -74.0060),
      City(name: 'ロンドン', latitude: 51.5074, longitude: -0.1278),
      City(name: 'フランクフルト', latitude: 50.1109, longitude: 8.6821),
      City(name: 'パリ', latitude: 48.8566, longitude: 2.3522),
      City(name: 'ソウル', latitude: 37.5665, longitude: 126.9780),
      City(name: '上海', latitude: 31.2304, longitude: 121.4737),
      City(name: '北京', latitude: 39.9042, longitude: 116.4074),
      City(name: 'デリー', latitude: 28.7041, longitude: 77.1025),
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<City>(
          value: widget.selectedCity,
          isExpanded: true,
          onChanged: (City? newValue) {
            if (newValue != null) {
              widget.onCityChanged(newValue);
            }
          },
          items: cities.map<DropdownMenuItem<City>>((City city) {
            return DropdownMenuItem<City>(
              value: city,
              child: Center(
                child: Text(
                  city.name,
                  style: const TextStyle(fontSize: 25),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
