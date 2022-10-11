import 'package:flutter_template/core/resources/data_state.dart';
import 'package:flutter_template/core/usecase/use_case.dart';
import 'package:flutter_template/feature_weather/data/dto/current_city_dto.dart';
import 'package:flutter_template/feature_weather/domain/repository/weather_repository.dart';

class GetCurrentWeatherUseCase extends UseCase<DataState<CurrentCityDto>, String> {
  final WeatherRepository weatherRepository;

  GetCurrentWeatherUseCase(this.weatherRepository);

  @override
  Future<DataState<CurrentCityDto>> call({required String params}) {
    return weatherRepository.getCurrentCityWeather(
      cityName: params,
    );
  }
}
