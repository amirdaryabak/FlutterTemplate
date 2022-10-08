// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_direction_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDirectionDto _$GetDirectionDtoFromJson(Map<String, dynamic> json) =>
    GetDirectionDto(
      routes: (json['routes'] as List<dynamic>)
          .map((e) => RoutesBean.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetDirectionDtoToJson(GetDirectionDto instance) =>
    <String, dynamic>{
      'routes': instance.routes,
    };

RoutesBean _$RoutesBeanFromJson(Map<String, dynamic> json) => RoutesBean(
      overviewPolyline: OverviewPolylineBean.fromJson(
          json['overview_polyline'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RoutesBeanToJson(RoutesBean instance) =>
    <String, dynamic>{
      'overview_polyline': instance.overviewPolyline,
    };

OverviewPolylineBean _$OverviewPolylineBeanFromJson(
        Map<String, dynamic> json) =>
    OverviewPolylineBean(
      points: json['points'] as String,
    );

Map<String, dynamic> _$OverviewPolylineBeanToJson(
        OverviewPolylineBean instance) =>
    <String, dynamic>{
      'points': instance.points,
    };
