import 'package:dio/dio.dart';
import 'package:flutter_template/core/resources/data_state.dart';
import 'package:flutter_template/core/utils/exception_parser.dart';
import 'package:flutter_template/feature_weather/data/data_source/remote/api_provider.dart';
import 'package:flutter_template/feature_weather/domain/entities/current_city_entity.dart';
import 'package:flutter_template/feature_weather/domain/repository/weather_repository.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  final ApiProvider _apiProvider;

  WeatherRepositoryImpl(this._apiProvider);

  @override
  Future<DataState<CurrentCityEntity>> getCurrentCityWeather({
    required String cityName,
  }) async {
    try {
      final httpResponse = await _apiProvider.getCurrentCityWeather(
        query: cityName,
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
