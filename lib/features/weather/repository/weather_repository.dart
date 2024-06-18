import 'package:dio/dio.dart';
import '../../../utils/helpers/weather_parser.dart';
import '../../../utils/network/dio_interceptor.dart';
import '../model/weather.dart';

class WeatherRepository {
  final Dio _dio = DioInterceptor.getDio('http://api.weatherapi.com/v1', null);

  WeatherRepository();

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

      Map<String, dynamic> queryParameters = {
        'key': '95b9d203c778474cb7e80120241406',
        'days': '7'
      };

      if (lat != null && lon != null) {
        queryParameters['q'] = '$lat,$lon';
      } else if (cityName != null) {
        queryParameters['q'] = cityName;
      }

      final response = await _dio.get(
        '/forecast.json',
        queryParameters: queryParameters,
      );
      return parseWeatherData(response.data);
    } on DioException catch (e) {
      //  Dio HTTP errors
      print('Dio error: $e');
      throw Exception('Failed to load weather data');
    } catch (error) {
      //  other types of errors
      print('Error: $error');
      throw Exception('Failed to load weather data');
    }
  }
}
