import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/core/resources/data_state.dart';
import 'package:flutter_template/feature_weather/domain/use_cases/get_current_weather_usecase.dart';
import 'package:flutter_template/feature_weather/presentation/bloc/cw_status.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetCurrentWeatherUseCase getCurrentWeatherUseCase;

  HomeBloc(this.getCurrentWeatherUseCase)
      : super(HomeState(
          cwStatus: CwLoading(),
        )) {
    on<LoadCwEvent>((event, emit) async {
      emit(state.copyWith(newCwStatus: CwLoading()));

      DataState dataState = await getCurrentWeatherUseCase(
        params: event.cityName,
      );

      if (dataState is DataSuccess) {
        emit(state.copyWith(newCwStatus: CwCompleted(dataState.data)));
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
