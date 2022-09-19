import 'package:dio/dio.dart';
import 'package:flutter_template/core/resources/data_state.dart';
import 'package:flutter_template/core/utils/exception_parser.dart';
import 'package:flutter_template/feature_map/data/data_source/remote/map_api_provider.dart';
import 'package:flutter_template/feature_map/domain/entities/address_entity.dart';
import 'package:flutter_template/feature_map/domain/entities/address_search_entity.dart';
import 'package:flutter_template/feature_map/domain/repository/map_repository.dart';

class MapRepositoryImpl implements MapRepository {
  final MapApiProvider _remoteService;

  MapRepositoryImpl(this._remoteService);

  @override
  Future<DataState<AddressSearchEntity>> getAddressFilter({
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
  Future<DataState<AddressEntity>> getFastReverse({
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
}
