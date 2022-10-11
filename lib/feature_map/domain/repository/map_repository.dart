import 'package:flutter_template/core/resources/data_state.dart';
import 'package:flutter_template/feature_map/data/dto/address_dto.dart';
import 'package:flutter_template/feature_map/data/dto/address_search_dto.dart';
import 'package:flutter_template/feature_map/data/dto/get_direction_dto.dart';
import 'package:latlong2/latlong.dart';

abstract class MapRepository {
  Future<DataState<AddressSearchDto>> getAddressFilter({
    required double lat,
    required double lon,
    required String text,
  });

  Future<DataState<AddressDto>> getFastReverse({
    required double lat,
    required double lon,
  });

  Future<DataState<GetDirectionDto>> getDirections({
    required LatLng origin,
    required LatLng destination,
  });
}
