import 'package:iranian_core_package/core/constants/core_constants.dart';
import 'package:dio/dio.dart';
import 'package:iranian_core_package/core/datasources/remote/interceptors/authentication_interceptor.dart';
import 'package:iranian_core_package/core/datasources/remote/interceptors/logging_interceptor.dart';

class DioProvider {
  late Dio dio;
  static final DioProvider _instance = DioProvider._internal();

  factory DioProvider() => _instance;

  DioProvider._internal() {
    dio = Dio(
      BaseOptions(
        connectTimeout: CoreConstants.kConnectTimeout,
        receiveTimeout: CoreConstants.kReceiveTimeout,
      ),
    )..interceptors.addAll(
        [
          LoggingInterceptor(),
          AuthenticationInterceptor(),
        ],
      );
  }
}
