import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/features/weather/model/weather.dart';

import '../repository/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

final dio = Dio();

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  double? latitude;
  double? longitude;
  String? city;
  bool isFirstSearch = true;

  WeatherBloc() : super(WeatherInitial()) {
    on<InitialDataFetchRequest>(_onInitialDataRequest);
    on<WeatherHomeSearchIconPressed>(_onSearchPressed);
    on<WeatherRefreshRequestEvenet>(_onRefresh);
    on<WeatherGetLocationButton>(_onGetYourLocationDataButtonPressed);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print('Error: ${error}');
  }

  void _onInitialDataRequest(
      InitialDataFetchRequest event, Emitter<WeatherState> emit) async {
    emit(WeatherLoadingState());

    try {
      final WeatherRepository weatherRepository = WeatherRepository();
      final weather = await weatherRepository.getWeather(
          lat: event.latitude, lon: event.longitude);
      latitude = event.latitude;
      longitude = event.longitude;

      emit(WeatherSuccessState(weatherData: weather));
    } catch (e) {
      emit(WeatherErrorState(errMsg: 'Failed to load weather data!'));
    }
  }

  void _onSearchPressed(
      WeatherHomeSearchIconPressed event, Emitter<WeatherState> emit) async {
    emit(WeatherLoadingState());

    try {
      final WeatherRepository weatherRepository = WeatherRepository();
      final weather = await weatherRepository.getWeather(cityName: event.city);
      isFirstSearch = false;
      city = event.city;
      emit(WeatherSuccessState(weatherData: weather));
    } catch (e) {
      emit(SearchErrorState());
    }
  }

  void _onRefresh(
      WeatherRefreshRequestEvenet event, Emitter<WeatherState> emit) async {
    emit(WeatherLoadingState());

    try {
      final WeatherRepository weatherRepository = WeatherRepository();

      if (city != null) {
        final weather = await weatherRepository.getWeather(cityName: city);

        emit(WeatherSuccessState(weatherData: weather));

        return;
      }

      final weather =
          await weatherRepository.getWeather(lat: latitude, lon: longitude);

      emit(WeatherSuccessState(
        weatherData: weather,
      ));
    } catch (e) {
      emit(WeatherErrorState(errMsg: 'Failed to load weather data!'));
    }
  }

  void _onGetYourLocationDataButtonPressed(
      WeatherGetLocationButton event, Emitter<WeatherState> emit) async {
    emit(WeatherLoadingState());

    try {
      final WeatherRepository weatherRepository = WeatherRepository();
      final weather =
          await weatherRepository.getWeather(lat: latitude, lon: longitude);
      isFirstSearch = true;

      emit(WeatherSuccessState(weatherData: weather));
    } catch (e) {
      emit(WeatherErrorState(errMsg: 'Failed to load weather data!'));
    }
  }
}
