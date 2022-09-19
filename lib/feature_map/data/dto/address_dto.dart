import 'dart:convert';

import 'package:flutter_template/feature_map/domain/entities/address_entity.dart';

AddressDto addressModelFromJson(String str) => AddressDto.fromJson(json.decode(str));

class AddressDto extends AddressEntity {
  AddressDto({
    String? address,
    String? county,
    String? province,
  }): super(
    address: address,
    county: county,
    province: province,
  );

  factory AddressDto.fromJson(Map<String, dynamic> json) => AddressDto(
    address: json["formatted_address"],
    county: json["county"],
    province: json["province"],
  );

}
