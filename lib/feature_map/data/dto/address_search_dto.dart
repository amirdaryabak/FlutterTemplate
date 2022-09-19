import 'dart:convert';

import 'package:flutter_template/feature_map/domain/entities/address_search_entity.dart';

AddressSearchDto addressSearchFromJson(String str) => AddressSearchDto.fromJson(json.decode(str));

class AddressSearchDto extends AddressSearchEntity {
  AddressSearchDto({
    int? count,
    List<ItemSearchDto>? items,
  }) : super(
    count: count ?? 0,
    items: items ?? [],
  );

  factory AddressSearchDto.fromJson(Map<String, dynamic> json) => AddressSearchDto(
    count: json["count"],
    items: List<ItemSearchDto>.from(json["items"].map((x) => ItemSearchDto.fromJson(x))),
  );
}

class ItemSearchDto extends ItemSearchEntity {
  ItemSearchDto({
    String? title,
    String? address,
    String? category,
    String? type,
    String? region,
    String? neighbourhood,
    required LocationDto location,
  }): super(
    title: title ?? '',
    address: address ?? '',
    category: category ?? '',
    type: type ?? '',
    region: region ?? '',
    neighbourhood: neighbourhood ?? '',
    location: location,
  );

  factory ItemSearchDto.fromJson(Map<String, dynamic> json) => ItemSearchDto(
    title: json["title"],
    address: json["address"],
    category: json["category"],
    type: json["type"],
    region: json["region"],
    neighbourhood: json["neighbourhood"],
    location: LocationDto.fromJson(json["location"]),
  );
}


class LocationDto extends LocationEntity {
  LocationDto({
    required double x,
    required double y,
  }): super(
    longitude: x,
    latitude: y,
  );



  factory LocationDto.fromJson(Map<String, dynamic> json) => LocationDto(
    x: json["x"].toDouble(),
    y: json["y"].toDouble(),
  );
}

