class Forecast {
  final String? hour;
  final String? day;
  final double temperature;
  final double? maxTemp;
  final double? minTemp;
  final double humidity;
  final String image;
  final String weatherType;

  Forecast(
      {required this.image,
      required this.weatherType,
      this.hour,
      this.day,
      this.maxTemp,
      this.minTemp,
      required this.temperature,
      required this.humidity});
}
