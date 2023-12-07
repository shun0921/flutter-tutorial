import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_data.freezed.dart';
part 'weather_data.g.dart';

@freezed
class WeatherForecast with _$WeatherForecast {
  factory WeatherForecast({
    @JsonKey(name: 'temp') Temperature? temp,
    @JsonKey(name: 'weather') List<WeatherDescription>? weather,
  }) = _WeatherForecast;

  factory WeatherForecast.fromJson(Map<String, dynamic> json) =>
      _$WeatherForecastFromJson(json);
}

@freezed
class Temperature with _$Temperature {
  factory Temperature({
    double? day,
    double? min,
    double? max,
  }) = _Temperature;

  factory Temperature.fromJson(Map<String, dynamic> json) =>
      _$TemperatureFromJson(json);
}

@freezed
class WeatherDescription with _$WeatherDescription {
  factory WeatherDescription({
    String? main,
    String? description,
    String? icon,
  }) = _WeatherDescription;

  factory WeatherDescription.fromJson(Map<String, dynamic> json) =>
      _$WeatherDescriptionFromJson(json);
}
