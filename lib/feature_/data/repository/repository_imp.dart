import 'package:dio/dio.dart';
import 'package:flutter_template/core/resources/data_state.dart';
import 'package:flutter_template/core/utils/exception_parser.dart';
import 'package:flutter_template/feature_/data/data_source/remote/api_provider.dart';
import 'package:flutter_template/feature_/domain/repository/repository.dart';

class RepositoryImpl implements Repository {
  final ApiProvider _remoteService;

  RepositoryImpl(this._remoteService);

  @override
  Future<DataState<Map<String, String>>> template() async {
    try {
      final httpResponse = await _remoteService.template();

      if (ExceptionParser.isResponseSuccessful(httpResponse)) {
        return DataSuccess(httpResponse.data);
      }
      return ExceptionParser.getApiDioError(httpResponse);
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }
}
