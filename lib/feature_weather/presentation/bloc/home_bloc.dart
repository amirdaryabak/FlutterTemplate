import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/core/resources/data_state.dart';
import 'package:flutter_template/core/utils/dart_utils.dart';
import 'package:flutter_template/feature_weather/data/dto/current_city_dto.dart';
import 'package:flutter_template/feature_weather/domain/use_cases/get_current_weather_usecase.dart';
import 'package:flutter_template/feature_weather/presentation/bloc/cw_status.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetCurrentWeatherUseCase getCurrentWeatherUseCase;

  HomeBloc(this.getCurrentWeatherUseCase)
      : super(HomeState(
          cwStatus: CwLoading(),
        ),) {
    on<LoadCwEvent>((event, emit) async {
      emit(state.copyWith(newCwStatus: CwLoading()));

      final DataState<CurrentCityDto> dataState = await getCurrentWeatherUseCase(
        params: event.cityName,
      );

      if (dataState is DataSuccess) {
        dataState.data?.let((it){
          emit(state.copyWith(newCwStatus: CwCompleted(it)));
        });
      }

      if (dataState is DataFailed) {
        emit(
          state.copyWith(
            newCwStatus: CwError(
              dioError: dataState.error,
            ),
          ),
        );
      }
    });
  }
}
