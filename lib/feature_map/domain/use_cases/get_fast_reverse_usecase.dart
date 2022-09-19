import 'package:flutter_template/core/resources/data_state.dart';
import 'package:flutter_template/core/usecase/use_case.dart';
import 'package:flutter_template/feature_map/domain/entities/address_entity.dart';
import 'package:flutter_template/feature_map/domain/repository/map_repository.dart';

class GetFastReverseUseCase implements UseCase<DataState<AddressEntity>, Map<String, dynamic>> {
  final MapRepository _repository;

  GetFastReverseUseCase(this._repository);

  @override
  Future<DataState<AddressEntity>> call({required Map<String, dynamic> params}) {
    return _repository.getFastReverse(
      lat: params['lat'],
      lon: params['lon'],
    );
  }
}
