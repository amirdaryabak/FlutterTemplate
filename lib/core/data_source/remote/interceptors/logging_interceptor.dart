import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:iranian_core_package/core/utils/toast_utils.dart';
import 'package:iranian_core_package/core/utils/utils.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      print('REQUEST ${options.method} => PATH: ${options.path} DATA: ${options.data}'
          'HEADER ${options.headers}');
    }
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      print(
        'RESPONSE${response.statusCode} => PATH: ${response.requestOptions.path}'
        'DATA: ${response.toString()} STATUS:${response.statusMessage}'
        'HEADER ${response.headers}',
      );
    }
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    try {
      dynamic json = err.response?.data;
      if (kDebugMode) {
        print('REMOTE ERROR: $json');
      }
    } catch (e) {
      if (kDebugMode) {
        print('');
      }
    }
    /*if (Utils.isPrePublishTest) {
      ToastUtils.showSnackBar(
      toastType: ToastyType.error,
      msgError: 'ERROR${err.error} => PATH: ${err.requestOptions.path} CODE: ${err.response?.statusCode}',
    );
    }*/
    if (kDebugMode) {
      /*ToastUtils.showSnackBar(
        toastType: ToastyType.error,
        msgError: 'ERROR${err.error} => PATH: ${err.requestOptions.path} CODE: ${err.response?.statusCode}',
      );*/
      print('ERROR${err.error} => PATH: ${err.requestOptions.path} CODE: ${err.response?.statusCode}');
    }
    return super.onError(err, handler);
  }
}
