import 'package:flutter_template/core/resources/data_state.dart';
import 'package:flutter_template/core/usecase/use_case.dart';
import 'package:flutter_template/feature_map/data/dto/get_direction_dto.dart';
import 'package:flutter_template/feature_map/domain/params/get_directions_params.dart';
import 'package:flutter_template/feature_map/domain/repository/map_repository.dart';

class GetDirectionsUseCase implements UseCase<DataState<GetDirectionDto>, GetDirectionsParams> {
  final MapRepository _repository;

  GetDirectionsUseCase(this._repository);

  @override
  Future<DataState<GetDirectionDto>> call({required GetDirectionsParams params}) {
    return _repository.getDirections(
      origin: params.origin,
      destination: params.destination,
    );
  }
}
