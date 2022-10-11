import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class AuthenticationInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers["Content-type"] = 'application/json';
    options.headers["Accept"] = 'application/json';
    if (kDebugMode) {
      print(options.headers);
    }
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode == 401) {
      // TODO amir: refresh token
    }
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      // TODO amir: refresh token
    }
    return super.onError(err, handler);
  }
}
