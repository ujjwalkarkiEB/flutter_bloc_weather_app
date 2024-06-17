import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/location/bloc/location_bloc.dart';
import 'package:weather_app/widgets/alertDialogs/error_dialog.dart';
import '../model/location.dart';
import '../weather/weather_screen.dart';

class LocationLandingPage extends StatelessWidget {
  const LocationLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.cloud,
                size: 100,
                color: Colors.lightBlue,
              ),
              const SizedBox(height: 20),
              Text(
                'Weather App',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlue[900],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Get the latest weather updates for you.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.lightBlue[700],
                ),
              ),
              const SizedBox(height: 40),
              BlocConsumer<LocationBloc, LocationState>(
                buildWhen: (previous, current) =>
                    previous.runtimeType != current.runtimeType,
                listener: (context, state) {
                  if (state is LocationFetchedState) {
                    final currentLocation = LocationModel(
                        latitude: state.latitude, longitude: state.longitude);
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              WeatherScreen(location: currentLocation),
                        ),
                        (route) => false);
                  }

                  if (state is LocationAcessError) {
                    showErrorDialog(context, state.errorMsg);
                  }
                  if (state is LocationPermissionDeniedState) {
                    showErrorDialog(context, 'Failed to get User permission');
                  }

                  if (state is LocationServiceDisabledState) {
                    showErrorDialog(context, 'Location service is disabled');
                  }
                },
                builder: (context, state) {
                  bool isLoading = state is LocationFetchingState;

                  return ElevatedButton(
                    onPressed: isLoading
                        ? null
                        : () {
                            context
                                .read<LocationBloc>()
                                .add(LocationButtonClicked());
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlue[600],
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: isLoading
                        ? const SizedBox(
                            height: 24,
                            width: 24,
                            child: CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                              strokeWidth: 2.0,
                            ),
                          )
                        : const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.location_on),
                              SizedBox(width: 8),
                              Text(
                                'Use Current Location',
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
