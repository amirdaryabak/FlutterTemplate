import 'package:dio/dio.dart';
import 'package:flutter_template/core/data_source/remote/dio_provider.dart';
import 'package:flutter_template/feature_weather/data/data_source/remote/api_provider.dart';
import 'package:flutter_template/feature_weather/data/repository/weather_repository_impl.dart';
import 'package:flutter_template/feature_weather/domain/repository/weather_repository.dart';
import 'package:flutter_template/feature_weather/domain/use_cases/get_current_weather_usecase.dart';
import 'package:flutter_template/feature_weather/presentation/bloc/home_bloc.dart';
import 'package:flutter_template/feature_main/presentation/bloc/main_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

abstract class Locator {
  static setup(){
    locator.registerSingleton<Dio>(DioProvider().dio);
    locator.registerSingleton<ApiProvider>(ApiProvider(locator<Dio>()));

    /// repositories
    locator.registerSingleton<WeatherRepository>(WeatherRepositoryImpl(locator()));

    /// use case
    locator.registerSingleton<GetCurrentWeatherUseCase>(GetCurrentWeatherUseCase(locator()));

    /// bloc
    locator.registerSingleton<HomeBloc>(HomeBloc(locator()));
    locator.registerSingleton<MainBloc>(MainBloc());
  }
}
