import 'package:json_annotation/json_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'get_directions_params.g.dart';

@JsonSerializable()
class GetDirectionsParams {
  final LatLng origin;
  final LatLng destination;

  GetDirectionsParams({
    required this.origin,
    required this.destination,
  });

  factory GetDirectionsParams.fromJson(Map<String, dynamic> json) => _$GetDirectionsParamsFromJson(json);

  Map<String, dynamic> toJson() => _$GetDirectionsParamsToJson(this);
}
