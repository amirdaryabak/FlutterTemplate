import 'package:json_annotation/json_annotation.dart';

part 'get_direction_dto.g.dart';

@JsonSerializable()
class GetDirectionDto {
  List<RoutesBean> routes;

  GetDirectionDto({
    required this.routes,
  });

  factory GetDirectionDto.fromJson(Map<String, dynamic> json) => _$GetDirectionDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GetDirectionDtoToJson(this);
}

@JsonSerializable()
class RoutesBean {
  @JsonKey(name: 'overview_polyline')
  OverviewPolylineBean overviewPolyline;

  RoutesBean({
    required this.overviewPolyline,
  });

  factory RoutesBean.fromJson(Map<String, dynamic> json) => _$RoutesBeanFromJson(json);

  Map<String, dynamic> toJson() => _$RoutesBeanToJson(this);
}

@JsonSerializable()
class OverviewPolylineBean {
  String points;

  OverviewPolylineBean({
    required this.points,
  });

  factory OverviewPolylineBean.fromJson(Map<String, dynamic> json) => _$OverviewPolylineBeanFromJson(json);

  Map<String, dynamic> toJson() => _$OverviewPolylineBeanToJson(this);
}
