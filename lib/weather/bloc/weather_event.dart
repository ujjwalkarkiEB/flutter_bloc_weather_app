part of 'weather_bloc.dart';

@immutable
sealed class WeatherEvent {}

final class InitialDataFetchRequest extends WeatherEvent {}

final class WeatherHomeSearchIconPressed extends WeatherEvent {}
