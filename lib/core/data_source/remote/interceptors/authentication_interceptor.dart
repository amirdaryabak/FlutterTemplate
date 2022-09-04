import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:iranian_core_package/core/datasources/preferences/pref.dart';
import 'package:iranian_core_package/core/datasources/preferences/pref_keys.dart';

class AuthenticationInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    var accessToken = await Pref.get(PrefKeys.kAccessToken);
    // TODO amir: uncomment this
    // accessToken = 'jwt eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjQ5NDk4NzMxLCJqdGkiOiI5N2Q0M2MxNDU3YzY0ZDAwYmI5ZjdhYTQyMzdmYzdmOCIsInVzZXJfaWQiOjV9.dzbihnZnhSuNU7WJfn3LXHDQovMzHjfmVjJDvbYkEV8';
    if (accessToken != null && accessToken != '') {
      if (kDebugMode) {
        print(accessToken);
      }
      options.headers["Authorization"] = accessToken;
    }
    if (options.path == 'api/app/commons/app_splash/') {
      options.headers.remove('Authorization');
    }
    options.headers["Content-type"] = 'application/json';
    options.headers["Accept"] = 'application/json';
    if (kDebugMode) {
      print(options.headers);
    }
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode != 401) {
      // TODO amir: refresh token
    }
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      // getNewToken(err);
    }
    return super.onError(err, handler);
  }
}
