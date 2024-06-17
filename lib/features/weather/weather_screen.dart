import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:weather_app/features/weather/bloc/weather_bloc.dart';

import '../../common/appbar/custom_appbar.dart';
import 'widgets/current_weather_attribute_container.dart';
import 'widgets/hourly_forecast_container.dart';
import 'widgets/weekly_forecast_tile.dart';
import '../location/model/location.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key, required this.location});
  final LocationModel location;

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<WeatherBloc>().add(InitialDataFetchRequest(
          latitude: widget.location.latitude,
          longitude: widget.location.longitude,
        ));
  }

  void _onSearch(String cityName) {
    _searchController.clear();
    context
        .read<WeatherBloc>()
        .add(WeatherHomeSearchIconPressed(city: cityName));
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      buildWhen: (previous, current) =>
          previous.runtimeType != current.runtimeType,
      builder: (context, state) {
        if (state is WeatherLoadingState) {
          return const Scaffold(
            appBar: CustomAppBar(
              city: 'Loading...',
              updatedTime: '',
            ),
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (state is WeatherSuccessState) {
          final data = state.weatherData;
          final hourForecastData = data.hourlyForecasts;
          final weeklyForecasData = data.weeklyForecasts;
          return Scaffold(
            appBar: CustomAppBar(
              city: data.city,
              updatedTime: data.lastUpdated,
              onSearch: _onSearch,
            ),
            body: RefreshIndicator(
              onRefresh: () async {
                context.read<WeatherBloc>().add(
                      InitialDataFetchRequest(
                        latitude: widget.location.latitude,
                        longitude: widget.location.longitude,
                      ),
                    );
              },
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    children: [
                      WeatherAttributesContainer(
                        city: data.city,
                        temp: data.temperature,
                        type: data.type,
                        icon: data.icon,
                        maxTemp: data.maxTemp,
                        minTemp: data.minTemp,
                      ),
                      const Gap(20),
                      const Row(
                        children: [
                          Flexible(
                              child: Divider(
                            endIndent: 15,
                          )),
                          Text('Hourly Forecast'),
                          Flexible(
                              child: Divider(
                            indent: 15,
                          )),
                        ],
                      ),
                      const Gap(10),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: hourForecastData.length,
                          itemBuilder: (context, index) {
                            final forecast = hourForecastData[index];
                            return WeatherCard(
                              time: forecast.hour!,
                              dayType: forecast.weatherType,
                              humidity: forecast.humidity,
                              icon: forecast.image,
                              temp: forecast.temperature,
                            );
                          },
                        ),
                      ),
                      const Gap(20),
                      const Row(
                        children: [
                          Flexible(
                            child: Divider(
                              indent: 15,
                              endIndent: 15,
                            ),
                          ),
                          Text('7 Days Forecast'),
                          Flexible(
                            child: Divider(
                              indent: 15,
                              endIndent: 15,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 400,
                        child: ListView.separated(
                          separatorBuilder: (context, index) => const Gap(10),
                          itemCount: weeklyForecasData.length,
                          itemBuilder: (context, index) {
                            final forecast = weeklyForecasData[index];
                            return WeeklyAttributeTile(
                              date: DateTime.parse(forecast.day!),
                              dayType: forecast.weatherType,
                              humidity: forecast.humidity,
                              icon: forecast.image,
                              maxTemp: forecast.maxTemp!,
                              minTemp: forecast.minTemp!,
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }

        return Scaffold(
          body: Center(
            child: Text(
              state is WeatherErrorState
                  ? state.errMsg
                  : 'Something went wrong!',
              style: const TextStyle(color: Colors.red, fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
  }
}
