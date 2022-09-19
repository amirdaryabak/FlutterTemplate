import 'package:bloc/bloc.dart';
import 'package:flutter_template/core/resources/data_state.dart';
import 'package:flutter_template/core/utils/dart_utils.dart';
import 'package:flutter_template/feature_map/domain/entities/address_search_entity.dart';
import 'package:flutter_template/feature_map/domain/use_cases/get_fast_address_filter_usecase.dart';
import 'package:flutter_template/feature_map/domain/use_cases/get_fast_reverse_usecase.dart';
import 'package:latlong2/latlong.dart';
import 'package:meta/meta.dart';

part 'map_screen_event.dart';

part 'map_state.dart';

class MapBloc extends Bloc<MapScreenEvent, MapState> {
  final GetFastReverseUseCase _getFastReverseUseCase;
  final GetFastAddressFilterUseCase _getFastAddressFilterUseCase;
  LatLng? userLocation;
  String county = '';
  String province = '';

  MapBloc(
    this._getFastReverseUseCase,
    this._getFastAddressFilterUseCase,
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
      } else if (event is GettingUserLocationEvent) {
        emit(GotUserLocationState(isGettingUserLocation: event.isGettingUserLocation));
      } else if (event is SetUserLocationEvent) {
        userLocation = event.userLocation;
      }
    });
  }

  void getFastReverseUseCase({
    required double lat,
    required double lon,
  }) async {
    var dataState = await _getFastReverseUseCase.call(params: {
      'lat': lat,
      'lon': lon,
    });
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

  void getAddressFilter({
    required double lat,
    required double lon,
    required String text,
  }) async {
    var dataState = await _getFastAddressFilterUseCase.call(params: {
      'lat': lat,
      'lon': lon,
      'text': text,
    });
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
}
