import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:location/location.dart';
import 'package:weather_app/model/location.dart';
import 'package:weather_app/weather/bloc/weather_bloc.dart';
import 'package:weather_app/widgets/appbar/custom_appbar.dart';
import 'package:weather_app/widgets/container/current_weather_attribute_container.dart';
import 'package:weather_app/widgets/weather_card.dart';
import 'package:weather_app/widgets/weekly_attribute_tile.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key, required this.location});
  final LocationModel location;

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  void initState() {
    super.initState();
    context.read<WeatherBloc>().add(InitialDataFetchRequest());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: BlocConsumer<WeatherBloc, WeatherState>(
          buildWhen: (previous, current) =>
              previous.runtimeType != current.runtimeType,
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state is WeatherLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is WeatherSuccessState) {
              final data = state.weatherData;
              return Column(
                children: [
                  WeatherAttributesContainer(
                      city: data.city,
                      temp: data.temperature,
                      type: data.type,
                      icon: data.icon),
                  const Divider(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.17,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) => const WeatherCard(),
                    ),
                  ),
                  const Divider(
                    indent: 15,
                    endIndent: 15,
                  ),
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => const Gap(10),
                      itemCount: 10,
                      itemBuilder: (context, index) =>
                          const WeeklyAttributeTile(),
                    ),
                  )
                ],
              );
            }

            if (state is WeatherErrorState) {
              return Center(
                child: Text(state.errMsg),
              );
            }

            return Center(
              child: Text('Relload'),
            );
          },
        ),
      ),
    );
  }
}
