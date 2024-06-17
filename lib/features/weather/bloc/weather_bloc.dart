import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/features/weather/model/forecast.dart';
import 'package:weather_app/features/weather/model/weather.dart';

import '../repository/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

final dio = Dio();

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<InitialDataFetchRequest>(_onInitialDataRequest);
    on<WeatherHomeSearchIconPressed>(_onSearchPressed);
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

      emit(WeatherSuccessState(weatherData: weather));
    } catch (e) {
      emit(WeatherErrorState(errMsg: 'Error in fetching data'));
    }
  }

  void _onSearchPressed(
      WeatherHomeSearchIconPressed event, Emitter<WeatherState> emit) async {
    emit(WeatherLoadingState());

    try {
      final WeatherRepository weatherRepository = WeatherRepository();
      final weather = await weatherRepository.getWeather(cityName: event.city);

      emit(WeatherSuccessState(weatherData: weather));
    } catch (e) {
      emit(WeatherErrorState(errMsg: 'Error in fetching data'));
    }
  }
}
