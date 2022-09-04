import 'package:dio/dio.dart';
import 'package:flutter_template/core/utils/constants.dart';
import 'package:flutter_template/feature_weather/data/dto/current_city_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'api_provider.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class ApiProvider {
  factory ApiProvider(Dio dio, {String baseUrl}) = _ApiProvider;


  @GET('data/2.5/weather')
  Future<HttpResponse<CurrentCityDto>> getCurrentCityWeather({
    @Query('q') required String query,
    @Query('appid') String page = Constants.apiKeys1,
    @Query('units') String units = 'metric',
  });

}
