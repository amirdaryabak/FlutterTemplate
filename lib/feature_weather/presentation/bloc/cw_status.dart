import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/feature_weather/domain/entities/current_city_entity.dart';

@immutable
abstract class CwStatus {}

class CwLoading extends CwStatus {}

class CwCompleted extends CwStatus {
  final CurrentCityEntity currentCityEntity;

  CwCompleted(this.currentCityEntity);
}

class CwError extends CwStatus {
  final DioError? dioError;

  CwError({
    required this.dioError,
  });
}
