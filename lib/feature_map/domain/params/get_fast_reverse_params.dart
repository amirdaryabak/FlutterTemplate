import 'package:json_annotation/json_annotation.dart';

part 'get_fast_reverse_params.g.dart';

@JsonSerializable()
class GetFastReverseParams {
  final double lat;
  final double lon;

  GetFastReverseParams({
    required this.lat,
    required this.lon,
  });

  factory GetFastReverseParams.fromJson(Map<String, dynamic> json) => _$GetFastReverseParamsFromJson(json);

  Map<String, dynamic> toJson() => _$GetFastReverseParamsToJson(this);
}
