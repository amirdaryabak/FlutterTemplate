part of 'map_bloc.dart';

@immutable
abstract class MapState {}

class MapInitial extends MapState {}

class SearchLoadingState extends MapState {}

class SetAddressState extends MapState {
  final String address;

  SetAddressState({
    required this.address,
  });
}

class GetAddressErrorState extends MapState {
  final String errorMessage;

  GetAddressErrorState({
    required this.errorMessage,
  });
}

class GetAddressFilterListState extends MapState {
  final List<ItemSearchDto> itemSearchEntityList;

  GetAddressFilterListState({
    required this.itemSearchEntityList,
  });
}

class GetAddressFilterListError extends MapState {
  final String errorMessage;

  GetAddressFilterListError({
    required this.errorMessage,
  });
}

class GotUserLocationState extends MapState {
  final bool isGettingUserLocation;

  GotUserLocationState({
    required this.isGettingUserLocation,
  });
}

class GetDirectionsState extends MapState {
  final List<LatLng> routingPoints;

  GetDirectionsState({
    required this.routingPoints,
  });
}

class GetDirectionsError extends MapState {
  final String errorMessage;

  GetDirectionsError({
    required this.errorMessage,
  });
}
