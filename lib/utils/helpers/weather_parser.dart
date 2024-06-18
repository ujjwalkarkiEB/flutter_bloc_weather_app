import 'package:intl/intl.dart';
import '../../features/weather/model/forecast.dart';
import '../../features/weather/model/weather.dart';

final dateFormat = DateFormat();

Weather parseWeatherData(Map<String, dynamic> json) {
  final List<Forecast> weekForecast = [];
  final List<Forecast> hourForecast = [];

  // Parsing weekly forecast
  for (var day in json['forecast']['forecastday']) {
    weekForecast.add(
      Forecast(
        day: day['date'],
        temperature: day['day']['avgtemp_c'].toDouble(),
        humidity: day['day']['avghumidity'].toDouble(),
        image: 'https:${day['day']["condition"]["icon"]}',
        maxTemp: day['day']['maxtemp_c'].toDouble(),
        minTemp: day['day']['mintemp_c'].toDouble(),
        weatherType: day['day']["condition"]["text"],
      ),
    );
  }

  // Parsing hourly forecast for today
  final today = json['forecast']['forecastday'][0]['hour'];
  for (var hour in today) {
    final formattedHour = DateFormat.jm().format(DateTime.parse(hour['time']));
    hourForecast.add(
      Forecast(
        temperature: hour['temp_c'].toDouble(),
        humidity: hour['humidity'].toDouble(),
        hour: formattedHour,
        image: 'https:${hour["condition"]["icon"]}',
        weatherType: hour["condition"]["text"],
      ),
    );
  }

  final weather = Weather(
    city: json['location']['name'],
    maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'].toDouble(),
    minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'].toDouble(),
    temperature: json['current']['temp_c'].toDouble(),
    icon: 'https:${json['current']['condition']['icon']}',
    humidity: json['current']['humidity'].toDouble(),
    type: json['current']['condition']['text'],
    lastUpdated: json['location']['localtime'],
    hourlyForecasts: hourForecast,
    weeklyForecasts: weekForecast,
  );

  return weather;
}
