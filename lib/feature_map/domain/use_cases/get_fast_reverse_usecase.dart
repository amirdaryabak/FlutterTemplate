import 'package:flutter_template/core/resources/data_state.dart';
import 'package:flutter_template/core/usecase/use_case.dart';
import 'package:flutter_template/feature_map/data/dto/address_dto.dart';
import 'package:flutter_template/feature_map/domain/params/get_fast_reverse_params.dart';
import 'package:flutter_template/feature_map/domain/repository/map_repository.dart';

class GetFastReverseUseCase implements UseCase<DataState<AddressDto>, GetFastReverseParams> {
  final MapRepository _repository;

  GetFastReverseUseCase(this._repository);

  @override
  Future<DataState<AddressDto>> call({required GetFastReverseParams params}) {
    return _repository.getFastReverse(
      lat: params.lat,
      lon: params.lon,
    );
  }
}
