// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_fast_address_filter_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetFastAddressFilterParams _$GetFastAddressFilterParamsFromJson(
        Map<String, dynamic> json) =>
    GetFastAddressFilterParams(
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
      text: json['text'] as String,
    );

Map<String, dynamic> _$GetFastAddressFilterParamsToJson(
        GetFastAddressFilterParams instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
      'text': instance.text,
    };
