import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:location/location.dart';
import 'package:meta/meta.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc() : super(LocationInitial()) {
    on<LocationButtonClicked>((event, emit) async {
      emit(LocationFetchingState());
      Location location = Location();
      bool _serviceEnabled;
      PermissionStatus _permissionGranted;
      LocationData _locationData;

      try {
        _serviceEnabled = await location.serviceEnabled();
        if (!_serviceEnabled) {
          _serviceEnabled = await location.requestService();
          if (!_serviceEnabled) {
            emit(LocationAcessError(errorMsg: 'Location service is disabled'));
            return;
          }
        }

        _permissionGranted = await location.hasPermission();
        if (_permissionGranted == PermissionStatus.denied) {
          _permissionGranted = await location.requestPermission();
          if (_permissionGranted != PermissionStatus.granted) {
            emit(LocationPermissionDeniedState());
            return;
          }
        }

        _locationData = await location.getLocation();
        emit(LocationFetchedState(
            longitude: _locationData.longitude!,
            latitude: _locationData.latitude!));
      } catch (e) {
        emit(LocationAcessError(errorMsg: 'Failed to access your location'));
      }
    });
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print('Error: ${error.toString()}');
  }
}
