import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_provider.g.dart';


@RestApi(baseUrl: '')
abstract class ApiProvider {
  factory ApiProvider(Dio dio, {String baseUrl}) = _ApiProvider;

  @GET('')
  Future<HttpResponse<Map<String, String>>> template();

}
