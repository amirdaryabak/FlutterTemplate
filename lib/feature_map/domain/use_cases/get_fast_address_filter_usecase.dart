import 'package:flutter_template/core/resources/data_state.dart';
import 'package:flutter_template/core/usecase/use_case.dart';
import 'package:flutter_template/feature_map/data/dto/address_search_dto.dart';
import 'package:flutter_template/feature_map/domain/repository/map_repository.dart';

class GetFastAddressFilterUseCase implements UseCase<DataState<AddressSearchDto>, Map<String, dynamic>> {
  final MapRepository _repository;

  GetFastAddressFilterUseCase(this._repository);

  @override
  Future<DataState<AddressSearchDto>> call({required Map<String, dynamic> params}) {
    return _repository.getAddressFilter(
      lat: params['lat'],
      lon: params['lon'],
      text: params['text'],
    );
  }
}
