import 'package:bloc/bloc.dart';
import 'package:location/location.dart';
import 'package:meta/meta.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc() : super(LocationInitial()) {
    on<LocationButtonClicked>((event, emit) async {
      emit(LocationFetchingState());
      Location location = Location();
      bool serviceEnabled;
      PermissionStatus permissionGranted;
      LocationData locationData;

      try {
        serviceEnabled = await location.serviceEnabled();
        if (!serviceEnabled) {
          serviceEnabled = await location.requestService();
          if (!serviceEnabled) {
            emit(LocationAcessError(errorMsg: 'Location service is disabled'));
            return;
          }
        }

        permissionGranted = await location.hasPermission();
        if (permissionGranted == PermissionStatus.denied) {
          permissionGranted = await location.requestPermission();
          if (permissionGranted != PermissionStatus.granted) {
            emit(LocationPermissionDeniedState());
            return;
          }
        }
        location.enableBackgroundMode(enable: true);

        locationData = await location.getLocation();

        emit(LocationFetchedState(
            longitude: locationData.longitude!,
            latitude: locationData.latitude!));
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
