// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_search_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressSearchDto _$AddressSearchDtoFromJson(Map<String, dynamic> json) =>
    AddressSearchDto(
      count: json['count'] as int?,
      items: (json['items'] as List<dynamic>)
          .map((e) => ItemSearchDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AddressSearchDtoToJson(AddressSearchDto instance) =>
    <String, dynamic>{
      'count': instance.count,
      'items': instance.items,
    };

ItemSearchDto _$ItemSearchDtoFromJson(Map<String, dynamic> json) =>
    ItemSearchDto(
      title: json['title'] as String?,
      address: json['address'] as String,
      category: json['category'] as String?,
      type: json['type'] as String?,
      region: json['region'] as String?,
      neighbourhood: json['neighbourhood'] as String?,
      location: LocationDto.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ItemSearchDtoToJson(ItemSearchDto instance) =>
    <String, dynamic>{
      'title': instance.title,
      'address': instance.address,
      'category': instance.category,
      'type': instance.type,
      'region': instance.region,
      'neighbourhood': instance.neighbourhood,
      'location': instance.location,
    };

LocationDto _$LocationDtoFromJson(Map<String, dynamic> json) => LocationDto(
      longitude: (json['x'] as num).toDouble(),
      latitude: (json['y'] as num).toDouble(),
    );

Map<String, dynamic> _$LocationDtoToJson(LocationDto instance) =>
    <String, dynamic>{
      'x': instance.longitude,
      'y': instance.latitude,
    };
