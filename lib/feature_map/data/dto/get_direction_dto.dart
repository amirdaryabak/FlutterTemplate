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

/*
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
  List<LegsBean> legs;
  @JsonKey(name: 'overview_polyline')
  OverviewPolylineBean overviewPolyline;

  RoutesBean({
    required this.legs,
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

@JsonSerializable()
class LegsBean {
  String summary;
  DistanceBean distance;
  DurationBean duration;
  List<StepsBean> steps;

  LegsBean({
    required this.summary,
    required this.distance,
    required this.duration,
    required this.steps,
  });

  factory LegsBean.fromJson(Map<String, dynamic> json) => _$LegsBeanFromJson(json);

  Map<String, dynamic> toJson() => _$LegsBeanToJson(this);
}

@JsonSerializable()
class StepsBean {
  String name;
  String instruction;
  DistanceBean distance;
  DurationBean duration;
  String polyline;
  String maneuver;
  @JsonKey(name: 'start_location')
  List<num> startLocation;

  StepsBean({
    required this.name,
    required this.instruction,
    required this.distance,
    required this.duration,
    required this.polyline,
    required this.maneuver,
    required this.startLocation,
  });

  factory StepsBean.fromJson(Map<String, dynamic> json) => _$StepsBeanFromJson(json);

  Map<String, dynamic> toJson() => _$StepsBeanToJson(this);
}

@JsonSerializable()
class DurationBean {
  num value;
  String text;

  DurationBean({
    required this.value,
    required this.text,
  });

  factory DurationBean.fromJson(Map<String, dynamic> json) => _$DurationBeanFromJson(json);

  Map<String, dynamic> toJson() => _$DurationBeanToJson(this);
}

@JsonSerializable()
class DistanceBean {
  num value;
  String text;

  DistanceBean({
    required this.value,
    required this.text,
  });

  factory DistanceBean.fromJson(Map<String, dynamic> json) => _$DistanceBeanFromJson(json);

  Map<String, dynamic> toJson() => _$DistanceBeanToJson(this);
}
*/

