import 'package:json_annotation/json_annotation.dart';

part 'current_city_dto.g.dart';

@JsonSerializable()
class CurrentCityDto {
  final String name;
  final List<WeatherDto> weather;
  final MainDto main;

  CurrentCityDto({
    required this.name,
    required this.weather,
    required this.main,
  });

  factory CurrentCityDto.fromJson(Map<String, dynamic> json) => _$CurrentCityDtoFromJson(json);
}

@JsonSerializable()
class MainDto {
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;

  MainDto({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
  });

  factory MainDto.fromJson(Map<String, dynamic> json) => _$MainDtoFromJson(json);
}

@JsonSerializable()
class WeatherDto {
  final int id;
  final String main;
  final String description;
  final String icon;

  WeatherDto({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory WeatherDto.fromJson(Map<String, dynamic> json) => _$WeatherDtoFromJson(json);
}
