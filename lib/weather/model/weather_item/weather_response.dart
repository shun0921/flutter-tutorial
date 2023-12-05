import 'package:freezed_annotation/freezed_annotation.dart';

import 'weather_data.dart';

part 'weather_response.freezed.dart';
part 'weather_response.g.dart';

@freezed
class WeatherResponse with _$WeatherResponse {
  factory WeatherResponse({
    @JsonKey(name: 'daily') List<WeatherForecast>? dailyForecasts,
  }) = _WeatherResponse;

  factory WeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseFromJson(json);
}
