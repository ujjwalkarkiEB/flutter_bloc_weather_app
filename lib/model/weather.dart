class Weather {
  final String city;
  final double temperature;
  final String icon;
  final double humidity;
  final String type;
  final String lastUpdated;

  Weather({
    required this.city,
    required this.temperature,
    required this.icon,
    required this.humidity,
    required this.type,
    required this.lastUpdated,
  });
  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        city: json['location']['name'],
        temperature: json['current']['temp_c'],
        icon: json['current']['condition']['icon'],
        humidity: json['current']['humidity'].toDouble(),
        type: json['current']['condition']['text'],
        lastUpdated: json['location']['localtime']);
  }
}
