import 'package:json_annotation/json_annotation.dart';

part 'address_search_dto.g.dart';

@JsonSerializable()
class AddressSearchDto {
  final int? count;
  final List<ItemSearchDto> items;

  AddressSearchDto({
    required this.count,
    required this.items,
  });

  factory AddressSearchDto.fromJson(Map<String, dynamic> json) => _$AddressSearchDtoFromJson(json);
}

@JsonSerializable()
class ItemSearchDto {
  final String? title;
  final String address;
  final String? category;
  final String? type;
  final String? region;
  final String? neighbourhood;
  final LocationDto location;

  ItemSearchDto({
    required this.title,
    required this.address,
    required this.category,
    required this.type,
    required this.region,
    required this.neighbourhood,
    required this.location,
  });

  factory ItemSearchDto.fromJson(Map<String, dynamic> json) => _$ItemSearchDtoFromJson(json);
}

@JsonSerializable()
class LocationDto {
  @JsonKey(name: 'x')
  final double longitude;
  @JsonKey(name: 'y')
  final double latitude;

  LocationDto({
    required this.longitude,
    required this.latitude,
  });

  factory LocationDto.fromJson(Map<String, dynamic> json) => _$LocationDtoFromJson(json);
}
