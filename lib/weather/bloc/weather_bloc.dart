import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/model/weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

final dio = Dio();

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<InitialDataFetchRequest>(_onInitialDataRequest);
  }

  void _onInitialDataRequest(
      InitialDataFetchRequest event, Emitter<WeatherState> emit) async {
    emit(WeatherLoadingState());
    try {
      final response = await dio.get(
          'http://api.weatherapi.com/v1/current.json?key=95b9d203c778474cb7e80120241406&q=kathmandu&aqi=no');

      if (response.statusCode == 200) {
        final weather = Weather.fromJson(response.data);
        emit(WeatherSuccessState(weatherData: weather));
      } else {}
    } catch (e) {
      emit(WeatherErrorState(errMsg: 'Error in fetching data'));
      addError(
        Exception('Error In Fetching!'),
      );
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print('Error: ${error}');
  }
}
