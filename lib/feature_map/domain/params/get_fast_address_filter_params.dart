import 'package:json_annotation/json_annotation.dart';

part 'get_fast_address_filter_params.g.dart';

@JsonSerializable()
class GetFastAddressFilterParams {
  final double lat;
  final double lon;
  final String text;

  GetFastAddressFilterParams({
    required this.lat,
    required this.lon,
    required this.text,
  });

  factory GetFastAddressFilterParams.fromJson(Map<String, dynamic> json) => _$GetFastAddressFilterParamsFromJson(json);

  Map<String, dynamic> toJson() => _$GetFastAddressFilterParamsToJson(this);
}
