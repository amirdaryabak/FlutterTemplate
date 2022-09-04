import 'package:flutter_template/core/resources/data_state.dart';
import 'package:flutter_template/feature_weather/domain/entities/current_city_entity.dart';

abstract class WeatherRepository{

  Future<DataState<CurrentCityEntity>> getCurrentCityWeather({required String cityName});

}