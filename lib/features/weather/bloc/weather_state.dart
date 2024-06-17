part of 'weather_bloc.dart';

@immutable
sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class ActionState extends WeatherState {}

final class WeatherLoadingState extends WeatherState {}

final class WeatherSuccessState extends WeatherState {
  final Weather weatherData;

  WeatherSuccessState({required this.weatherData});
}

final class WeatherErrorState extends WeatherState {
  final String errMsg;

  WeatherErrorState({required this.errMsg});
}
