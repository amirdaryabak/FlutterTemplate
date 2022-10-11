// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_city_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentCityDto _$CurrentCityDtoFromJson(Map<String, dynamic> json) =>
    CurrentCityDto(
      name: json['name'] as String,
      weather: (json['weather'] as List<dynamic>)
          .map((e) => WeatherDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      main: MainDto.fromJson(json['main'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CurrentCityDtoToJson(CurrentCityDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'weather': instance.weather,
      'main': instance.main,
    };

MainDto _$MainDtoFromJson(Map<String, dynamic> json) => MainDto(
      temp: (json['temp'] as num).toDouble(),
      feelsLike: (json['feelsLike'] as num).toDouble(),
      tempMin: (json['tempMin'] as num).toDouble(),
      tempMax: (json['tempMax'] as num).toDouble(),
      pressure: json['pressure'] as int,
      humidity: json['humidity'] as int,
    );

Map<String, dynamic> _$MainDtoToJson(MainDto instance) => <String, dynamic>{
      'temp': instance.temp,
      'feelsLike': instance.feelsLike,
      'tempMin': instance.tempMin,
      'tempMax': instance.tempMax,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
    };

WeatherDto _$WeatherDtoFromJson(Map<String, dynamic> json) => WeatherDto(
      id: json['id'] as int,
      main: json['main'] as String,
      description: json['description'] as String,
      icon: json['icon'] as String,
    );

Map<String, dynamic> _$WeatherDtoToJson(WeatherDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon,
    };
