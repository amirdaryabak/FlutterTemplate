import 'package:flutter_template/core/resources/data_state.dart';
import 'package:flutter_template/feature_weather/data/dto/current_city_dto.dart';

abstract class WeatherRepository{

  Future<DataState<CurrentCityDto>> getCurrentCityWeather({required String cityName});

}
