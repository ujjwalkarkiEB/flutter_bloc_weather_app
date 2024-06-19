import 'package:freezed_annotation/freezed_annotation.dart';

import 'forecast.dart';

part 'weather.freezed.dart';
part 'weather.g.dart';

@freezed
class Weather with _$Weather {
  const factory Weather({
    required String city,
    required double temperature,
    required double maxTemp,
    required double minTemp,
    required String icon,
    required double humidity,
    required String type,
    required String lastUpdated,
    required List<Forecast> weeklyForecasts,
    required List<Forecast> hourlyForecasts,
  }) = _Weather;

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
}
