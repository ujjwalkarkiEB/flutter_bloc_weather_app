import 'package:dio/dio.dart';

import '../model/weather.dart';

class WeatherRepository {
  final Dio _dio = Dio();
  final String _apiKey =
      '95b9d203c778474cb7e80120241406'; // Replace with your Weather API key

  Future<Weather> getWeather({
    double? lat,
    double? lon,
    String? cityName,
  }) async {
    try {
      if ((lat == null || lon == null) && cityName == null) {
        throw ArgumentError(
            'Either latitude and longitude or city name must be provided.');
      }

      Map<String, dynamic> queryParameters = {'key': _apiKey, 'days': '7'};

      if (lat != null && lon != null) {
        queryParameters['q'] = '$lat,$lon';
      } else if (cityName != null) {
        queryParameters['q'] = cityName;
      }

      final response = await _dio.get(
        'http://api.weatherapi.com/v1/forecast.json',
        queryParameters: queryParameters,
      );

      return Weather.fromJson(response.data);
    } catch (error) {
      throw Exception('Failed to load weather data');
    }
  }
}
