import 'package:dio/dio.dart';
import 'package:flutter_template/core/resources/data_state.dart';
import 'package:flutter_template/core/utils/exception_parser.dart';
import 'package:flutter_template/feature_map/data/data_source/remote/map_api_provider.dart';
import 'package:flutter_template/feature_map/data/dto/address_dto.dart';
import 'package:flutter_template/feature_map/data/dto/address_search_dto.dart';
import 'package:flutter_template/feature_map/data/dto/get_direction_dto.dart';
import 'package:flutter_template/feature_map/domain/repository/map_repository.dart';
import 'package:latlong2/latlong.dart';

class MapRepositoryImpl implements MapRepository {
  final MapApiProvider _remoteService;

  MapRepositoryImpl(this._remoteService);

  @override
  Future<DataState<AddressSearchDto>> getAddressFilter({
    required double lat,
    required double lon,
    required String text,
  }) async {
    try {
      final httpResponse = await _remoteService.getAddressFilter(
        lat: lat,
        lng: lon,
        term: text,
      );

      if (ExceptionParser.isResponseSuccessful(httpResponse)) {
        return DataSuccess(httpResponse.data);
      }
      return ExceptionParser.getApiDioError(httpResponse);
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<AddressDto>> getFastReverse({
    required double lat,
    required double lon,
  }) async {
    try {
      final httpResponse = await _remoteService.getFastReverse(
        lat: lat,
        lon: lon,
      );

      if (ExceptionParser.isResponseSuccessful(httpResponse)) {
        return DataSuccess(httpResponse.data);
      }
      return ExceptionParser.getApiDioError(httpResponse);
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<GetDirectionDto>> getDirections({
    required LatLng origin,
    required LatLng destination,
  }) async {
    try {
      final httpResponse = await _remoteService.getDirections(
        origin: '${origin.latitude}, ${origin.longitude}',
        destination: '${destination.latitude}, ${destination.longitude}',
      );

      if (ExceptionParser.isResponseSuccessful(httpResponse)) {
        return DataSuccess(httpResponse.data);
      }
      return ExceptionParser.getApiDioError(httpResponse);
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }
}
