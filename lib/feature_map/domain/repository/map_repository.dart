import 'package:flutter_template/core/resources/data_state.dart';
import 'package:flutter_template/feature_map/domain/entities/address_entity.dart';
import 'package:flutter_template/feature_map/domain/entities/address_search_entity.dart';

abstract class MapRepository {
  Future<DataState<AddressSearchEntity>> getAddressFilter({
    required double lat,
    required double lon,
    required String text,
  });

  Future<DataState<AddressEntity>> getFastReverse({
    required double lat,
    required double lon,
  });
}
