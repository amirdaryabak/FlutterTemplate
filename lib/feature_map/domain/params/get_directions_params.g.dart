// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_directions_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDirectionsParams _$GetDirectionsParamsFromJson(Map<String, dynamic> json) =>
    GetDirectionsParams(
      origin: LatLng.fromJson(json['origin'] as Map<String, dynamic>),
      destination: LatLng.fromJson(json['destination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetDirectionsParamsToJson(
        GetDirectionsParams instance) =>
    <String, dynamic>{
      'origin': instance.origin,
      'destination': instance.destination,
    };
