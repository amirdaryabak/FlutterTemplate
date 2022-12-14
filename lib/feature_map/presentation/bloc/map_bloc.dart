import 'package:bloc/bloc.dart';
import 'package:flutter_template/core/resources/data_state.dart';
import 'package:flutter_template/core/utils/dart_utils.dart';
import 'package:flutter_template/feature_map/data/dto/address_search_dto.dart';
import 'package:flutter_template/feature_map/domain/params/get_directions_params.dart';
import 'package:flutter_template/feature_map/domain/params/get_fast_address_filter_params.dart';
import 'package:flutter_template/feature_map/domain/params/get_fast_reverse_params.dart';
import 'package:flutter_template/feature_map/domain/use_cases/get_directions_usecase.dart';
import 'package:flutter_template/feature_map/domain/use_cases/get_fast_address_filter_usecase.dart';
import 'package:flutter_template/feature_map/domain/use_cases/get_fast_reverse_usecase.dart';
import 'package:flutter_template/feature_map/utils/map_utils.dart';
import 'package:google_polyline_algorithm/google_polyline_algorithm.dart';
import 'package:latlong2/latlong.dart';
import 'package:meta/meta.dart';

part 'map_screen_event.dart';

part 'map_state.dart';

class MapBloc extends Bloc<MapScreenEvent, MapState> {
  final GetFastReverseUseCase _getFastReverseUseCase;
  final GetFastAddressFilterUseCase _getFastAddressFilterUseCase;
  final GetDirectionsUseCase _getDirectionsUseCase;
  LatLng? userLocation;
  String county = '';
  String province = '';

  MapBloc(
    this._getFastReverseUseCase,
    this._getFastAddressFilterUseCase,
    this._getDirectionsUseCase,
  ) : super(MapInitial()) {
    on<MapScreenEvent>((event, emit) {
      if (event is LoadingEvent) {
        emit(SearchLoadingState());
      } else if (event is GetFastReverseEvent) {
        getFastReverseUseCase(
          lat: event.lat,
          lon: event.lon,
        );
      } else if (event is GetAddressFilterEvent) {
        getAddressFilter(
          lat: event.lat,
          lon: event.lon,
          text: event.text,
        );
      } else if (event is GetDirectionsEvent) {
        getDirections(
          origin: event.origin,
          destination: event.destination,
        );
      } else if (event is GettingUserLocationEvent) {
        emit(GotUserLocationState(isGettingUserLocation: event.isGettingUserLocation));
      } else if (event is SetUserLocationEvent) {
        userLocation = event.userLocation;
      }
    });
  }

  Future<void> getFastReverseUseCase({
    required double lat,
    required double lon,
  }) async {
    final dataState = await _getFastReverseUseCase.call(
      params: GetFastReverseParams(
        lat: lat,
        lon: lon,
      ),
    );
    if (dataState is DataSuccess) {
      final data = dataState.data;
      data?.let((it) {
        userLocation = LatLng(lat, lon);
        county = it.county ?? '';
        province = it.province ?? '';
        emit(SetAddressState(address: it.address ?? ''));
      });
    }
    if (dataState is DataFailed) {
      emit(GetAddressErrorState(errorMessage: 'errorMessage'));
    }
  }

  Future<void> getAddressFilter({
    required double lat,
    required double lon,
    required String text,
  }) async {
    final dataState = await _getFastAddressFilterUseCase.call(
      params: GetFastAddressFilterParams(
        lat: lat,
        lon: lon,
        text: text,
      ),
    );
    if (dataState is DataSuccess) {
      final data = dataState.data;
      data?.let((it) {
        emit(GetAddressFilterListState(itemSearchEntityList: it.items));
      });
    }
    if (dataState is DataFailed) {
      emit(GetAddressFilterListError(errorMessage: 'errorMessage'));
    }
  }

  Future<void> getDirections({
    required LatLng origin,
    required LatLng destination,
  }) async {
    final dataState = await _getDirectionsUseCase.call(
      params: GetDirectionsParams(
        origin: origin,
        destination: destination,
      ),
    );
    if (dataState is DataSuccess) {
      final data = dataState.data;
      data?.let((it) {
        emit(
          GetDirectionsState(
            routingPoints: decodePolyline(it.routes[0].overviewPolyline.points).unpackPolyline(),
          ),
        );
      });
    }
    if (dataState is DataFailed) {
      emit(GetDirectionsError(errorMessage: 'errorMessage'));
    }
  }
}
