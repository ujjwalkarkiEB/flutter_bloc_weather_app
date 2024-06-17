import 'forecast.dart';

class Weather {
  final String city;
  final double temperature;
  final double maxTemp;
  final double minTemp;

  final String icon;
  final double humidity;
  final String type;
  final String lastUpdated;
  final List<Forecast> weeklyForecasts;
  final List<Forecast> hourlyForecasts;

  Weather({
    required this.maxTemp,
    required this.minTemp,
    required this.city,
    required this.temperature,
    required this.icon,
    required this.humidity,
    required this.type,
    required this.lastUpdated,
    required this.weeklyForecasts,
    required this.hourlyForecasts,
  });

  /// factory method to generate weather data from given response data
  factory Weather.fromJson(Map<String, dynamic> json) {
    final List<Forecast> weekForecast = [];
    final List<Forecast> hourForecast = [];

    for (var day in json['forecast']['forecastday']) {
      weekForecast.add(
        Forecast(
          day: day['date'],
          temperature: (day['day']['avgtemp_c']).toDouble(),
          humidity: (day['day']['avghumidity']).toDouble(),
          image: 'https:${day['day']["condition"]["icon"]}',
          maxTemp: day['day']['maxtemp_c'].toDouble(),
          minTemp: day['day']['mintemp_c'].toDouble(),
          weatherType: day['day']["condition"]["text"],
        ),
      );
    }

    final today = json['forecast']['forecastday'][0]['hour'];
    for (var hour in today) {
      hourForecast.add(
        Forecast(
          temperature: hour['temp_c'].toDouble(),
          humidity: hour['humidity'].toDouble(),
          hour: hour["time"],
          image: 'https:${hour["condition"]["icon"]}',
          weatherType: hour["condition"]["text"],
        ),
      );
    }

    return Weather(
        city: json['location']['name'],
        maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
        temperature: json['current']['temp_c'],
        icon: 'https:${json['current']['condition']['icon']}',
        humidity: json['current']['humidity'],
        type: json['current']['condition']['text'],
        lastUpdated: json['location']['localtime'],
        hourlyForecasts: hourForecast,
        weeklyForecasts: weekForecast);
  }
}
