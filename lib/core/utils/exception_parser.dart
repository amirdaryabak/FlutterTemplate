import 'package:dio/dio.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:iranian_core_package/core/resources/data_state.dart';
import 'package:retrofit/dio.dart';

class ExceptionParser {
  static final ExceptionParser _utils = ExceptionParser._internal();

  factory ExceptionParser() {
    return _utils;
  }

  static bool isResponseSuccessful<T>(HttpResponse<T> httpResponse) {
    var statusCode = httpResponse.response.statusCode;
    if (statusCode == HttpStatus.ok ||
        statusCode == HttpStatus.created ||
        statusCode == HttpStatus.accepted ||
        statusCode == HttpStatus.nonAuthoritativeInformation ||
        statusCode == HttpStatus.noContent ||
        statusCode == HttpStatus.resetContent ||
        statusCode == HttpStatus.partialContent ||
        statusCode == HttpStatus.multiStatus ||
        statusCode == HttpStatus.alreadyReported ||
        statusCode == HttpStatus.imUsed) {
      return true;
    }
    return false;
  }

  static bool isStatusCodeSuccessful<T>(int? statusCode) {
    if (statusCode == HttpStatus.ok ||
        statusCode == HttpStatus.created ||
        statusCode == HttpStatus.accepted ||
        statusCode == HttpStatus.nonAuthoritativeInformation ||
        statusCode == HttpStatus.noContent ||
        statusCode == HttpStatus.resetContent ||
        statusCode == HttpStatus.partialContent ||
        statusCode == HttpStatus.multiStatus ||
        statusCode == HttpStatus.alreadyReported ||
        statusCode == HttpStatus.imUsed) {
      return true;
    }
    return false;
  }

  static DataState<T> getApiDioError<T>(HttpResponse<T> httpResponse) {
    return DataFailed(
      DioError(
        error: httpResponse.response.statusMessage,
        response: httpResponse.response,
        requestOptions: httpResponse.response.data.request,
        type: DioErrorType.response,
      ),
    );
  }

  ExceptionParser._internal();
}