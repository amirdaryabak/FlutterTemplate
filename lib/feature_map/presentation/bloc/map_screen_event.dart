part of 'map_bloc.dart';

@immutable
abstract class MapScreenEvent {}

class LoadingEvent extends MapScreenEvent {

  LoadingEvent();
}

class GetFastReverseEvent extends MapScreenEvent {
  final double lat;
  final double lon;

  GetFastReverseEvent({
    required this.lat,
    required this.lon,
  });
}

class GetAddressFilterEvent extends MapScreenEvent {
  final double lat;
  final double lon;
  final String text;

  GetAddressFilterEvent({
    required this.lat,
    required this.lon,
    required this.text,
  });
}

class GettingUserLocationEvent extends MapScreenEvent {
  final bool isGettingUserLocation;

  GettingUserLocationEvent({
    required this.isGettingUserLocation,
  });
}

class SetUserLocationEvent extends MapScreenEvent {
  final LatLng userLocation;

  SetUserLocationEvent({
    required this.userLocation,
  });
}
