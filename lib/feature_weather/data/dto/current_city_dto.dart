import 'dart:convert';

import 'package:flutter_template/feature_weather/domain/entities/current_city_entity.dart';


CurrentCityDto currentCityDtoFromJson(String str) => CurrentCityDto.fromJson(json.decode(str));


class CurrentCityDto extends CurrentCityEntity {
  CurrentCityDto({
    required CoordDto coord,
    required List<WeatherDto> weather,
    required String base,
    required MainDto main,
    required int visibility,
    required WindDto wind,
    required CloudsDto clouds,
    required int dt,
    required SysDto sys,
    required int timezone,
    required int id,
    required String name,
    required int cod,
  }): super(
    coord: coord,
    weather: weather,
    base: base,
    main: main,
    visibility: visibility,
    wind: wind,
    clouds: clouds,
    dt: dt,
    sys: sys,
    timezone: timezone,
    id: id,
    name: name,
    cod: cod,
  );

  factory CurrentCityDto.fromJson(Map<String, dynamic> json) => CurrentCityDto(
    coord: CoordDto.fromJson(json["coord"]),
    weather: List<WeatherDto>.from(json["weather"].map((x) => WeatherDto.fromJson(x))),
    base: json["base"],
    main: MainDto.fromJson(json["main"]),
    visibility: json["visibility"],
    wind: WindDto.fromJson(json["wind"]),
    clouds: CloudsDto.fromJson(json["clouds"]),
    dt: json["dt"],
    sys: SysDto.fromJson(json["sys"]),
    timezone: json["timezone"],
    id: json["id"],
    name: json["name"],
    cod: json["cod"],
  );
}

class CloudsDto extends CloudsEntity {
  CloudsDto({
    required int all,
  }): super(
    all: all,
  );

  factory CloudsDto.fromJson(Map<String, dynamic> json) => CloudsDto(
    all: json["all"],
  );
}

class CoordDto extends CoordEntity {
  CoordDto({
    required double lon,
    required double lat,
  }): super(
    lat: lat,
    lon: lon,
  );

  factory CoordDto.fromJson(Map<String, dynamic> json) => CoordDto(
    lon: json["lon"].toDouble(),
    lat: json["lat"].toDouble(),
  );
}

class MainDto extends MainEntity {
  MainDto({
    required double temp,
    required double feelsLike,
    required double tempMin,
    required double tempMax,
    required int pressure,
    required int humidity,
  }) : super(
    temp: temp,
    feelsLike: feelsLike,
    tempMin: tempMin,
    tempMax: tempMax,
    pressure: pressure,
    humidity: humidity,
  );

  factory MainDto.fromJson(Map<String, dynamic> json) => MainDto(
    temp: json["temp"].toDouble(),
    feelsLike: json["feels_like"].toDouble(),
    tempMin: json["temp_min"].toDouble(),
    tempMax: json["temp_max"].toDouble(),
    pressure: json["pressure"],
    humidity: json["humidity"],
  );
}

class SysDto extends SysEntity {
  SysDto({
    required int type,
    required int id,
    required String country,
    required int sunrise,
    required int sunset,
  }): super(
    type: type,
    id: id,
    country: country,
    sunrise: sunrise,
    sunset: sunset,
  );

  factory SysDto.fromJson(Map<String, dynamic> json) => SysDto(
    type: json["type"],
    id: json["id"],
    country: json["country"],
    sunrise: json["sunrise"],
    sunset: json["sunset"],
  );
}

class WeatherDto extends WeatherEntity {
  WeatherDto({
    required int id,
    required String main,
    required String description,
    required String icon,
  }): super(
    id: id,
    main: main,
    description: description,
    icon: icon,
  );

  factory WeatherDto.fromJson(Map<String, dynamic> json) => WeatherDto(
    id: json["id"],
    main: json["main"],
    description: json["description"],
    icon: json["icon"],
  );
}

class WindDto extends WindEntity {
  WindDto({
    required double speed,
    required int deg,
  }): super(
    speed: speed,
    deg: deg,
  );

  factory WindDto.fromJson(Map<String, dynamic> json) => WindDto(
    speed: json["speed"].toDouble(),
    deg: json["deg"],
  );
}
