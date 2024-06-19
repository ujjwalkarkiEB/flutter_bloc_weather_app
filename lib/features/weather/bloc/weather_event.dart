part of 'weather_bloc.dart';

@immutable
sealed class WeatherEvent {}

final class InitialDataFetchRequest extends WeatherEvent {
  final double latitude;
  final double longitude;

  InitialDataFetchRequest({required this.latitude, required this.longitude});
}

final class WeatherHomeSearchIconPressed extends WeatherEvent {
  final String city;

  WeatherHomeSearchIconPressed({required this.city});
}

final class WeatherRefreshRequestEvenet extends WeatherEvent {
  WeatherRefreshRequestEvenet();
}

final class WeatherGetLocationButton extends WeatherEvent {}
