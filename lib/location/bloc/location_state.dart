part of 'location_bloc.dart';

@immutable
sealed class LocationState {}

final class LocationInitial extends LocationState {}

final class LocationFetchingState extends LocationState {}

final class LocationFetchedState extends LocationState {
  final double longitude;
  final double latitude;

  LocationFetchedState({required this.longitude, required this.latitude});
}

final class LocationPermissionDeniedState extends LocationState {}

final class LocationServiceDisabledState extends LocationState {
  final String errorMsg;

  LocationServiceDisabledState({required this.errorMsg});
}

final class LocationAcessError extends LocationState {
  final String errorMsg;

  LocationAcessError({required this.errorMsg});
}
