import 'package:flutter_template/core/resources/data_state.dart';
import 'package:flutter_template/core/usecase/use_case.dart';
import 'package:flutter_template/feature_map/domain/entities/address_search_entity.dart';
import 'package:flutter_template/feature_map/domain/repository/map_repository.dart';

class GetFastAddressFilterUseCase implements UseCase<DataState<AddressSearchEntity>, Map<String, dynamic>> {
  final MapRepository _repository;

  GetFastAddressFilterUseCase(this._repository);

  @override
  Future<DataState<AddressSearchEntity>> call({required Map<String, dynamic> params}) {
    return _repository.getAddressFilter(
      lat: params['lat'],
      lon: params['lon'],
      text: params['text'],
    );
  }
}
