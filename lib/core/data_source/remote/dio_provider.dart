import 'package:dio/dio.dart';
import 'package:flutter_template/core/data_source/remote/interceptors/authentication_interceptor.dart';
import 'package:flutter_template/core/data_source/remote/interceptors/logging_interceptor.dart';
import 'package:flutter_template/core/utils/constants.dart';

class DioProvider {
  late Dio dio;
  static final DioProvider _instance = DioProvider._internal();

  factory DioProvider() => _instance;

  DioProvider._internal() {
    dio = Dio(
      BaseOptions(
        connectTimeout: Constants.kConnectTimeout,
        receiveTimeout: Constants.kReceiveTimeout,
      ),
    )..interceptors.addAll(
        [
          LoggingInterceptor(),
          AuthenticationInterceptor(),
        ],
      );
  }
}
