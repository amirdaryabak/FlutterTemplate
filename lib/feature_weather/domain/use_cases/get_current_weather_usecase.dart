import 'package:flutter_template/core/resources/data_state.dart';
import 'package:flutter_template/core/usecase/use_case.dart';
import 'package:flutter_template/feature_weather/domain/entities/current_city_entity.dart';
import 'package:flutter_template/feature_weather/domain/repository/weather_repository.dart';

class GetCurrentWeatherUseCase extends UseCase<DataState<CurrentCityEntity>, String> {
  final WeatherRepository weatherRepository;

  GetCurrentWeatherUseCase(this.weatherRepository);

  @override
  Future<DataState<CurrentCityEntity>> call({required String params}) {
    return weatherRepository.getCurrentCityWeather(
      cityName: params,
    );
  }
}
