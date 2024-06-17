import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/location/bloc/location_bloc.dart';
import 'package:weather_app/utils/themes/theme.dart';
import 'package:weather_app/features/weather/bloc/weather_bloc.dart';
import 'package:weather_app/features/weather/weather_screen.dart';

import 'features/location/model/location.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => WeatherBloc()),
        BlocProvider(create: (context) => LocationBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: AppTheme.AppThemeData,
        home: WeatherScreen(
          location: LocationModel(latitude: 7, longitude: 8),
        ),
      ),
    );
  }
}
