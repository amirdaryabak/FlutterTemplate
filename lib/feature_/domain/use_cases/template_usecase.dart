import 'package:flutter_template/core/resources/data_state.dart';
import 'package:flutter_template/core/usecase/use_case.dart';
import 'package:flutter_template/feature_/domain/repository/repository.dart';

class TemplateUseCase implements UseCase<DataState<Map<String, String>>, NoParams> {
  final Repository _repository;

  TemplateUseCase(this._repository);

  @override
  Future<DataState<Map<String, String>>> call({required NoParams params}) {
    return _repository.template();
  }
}
