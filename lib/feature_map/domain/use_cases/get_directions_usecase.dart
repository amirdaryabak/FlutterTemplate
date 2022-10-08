import 'package:flutter_template/core/resources/data_state.dart';
import 'package:flutter_template/core/usecase/use_case.dart';
import 'package:flutter_template/feature_map/data/dto/get_direction_dto.dart';
import 'package:flutter_template/feature_map/domain/repository/map_repository.dart';

class GetDirectionsUseCase implements UseCase<DataState<GetDirectionDto>, Map<String, dynamic>> {
  final MapRepository _repository;

  GetDirectionsUseCase(this._repository);

  @override
  Future<DataState<GetDirectionDto>> call({required Map<String, dynamic> params}) {
    return _repository.getDirections(
      origin: params['origin'],
      destination: params['destination'],
    );
  }
}
