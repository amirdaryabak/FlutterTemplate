import 'package:dio/dio.dart';
import 'package:flutter_template/feature_map/data/dto/address_dto.dart';
import 'package:flutter_template/feature_map/data/dto/address_search_dto.dart';
import 'package:flutter_template/feature_map/data/dto/get_direction_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'map_api_provider.g.dart';

const apiKey = 'service.PQIHobU6mKl6UovXEpIyp9iQjB0Cbt2DBexgrXB9';

@RestApi(baseUrl: 'https://api.neshan.org/')
abstract class MapApiProvider {
  factory MapApiProvider(Dio dio, {String baseUrl}) = _MapApiProvider;

  @GET('v1/search/')
  Future<HttpResponse<AddressSearchDto>> getAddressFilter({
    @Header("Api-Key") String apiKey = apiKey,
    @Query('lat') required double lat,
    @Query('lng') required double lng,
    @Query('term') required String term,
  });

  @GET('v5/reverse/')
  Future<HttpResponse<AddressDto>> getFastReverse({
    @Header("Api-Key") String apiKey = apiKey,
    @Query('lat') required double lat,
    @Query('lng') required double lon,
  });

  @GET('v4/direction/no-traffic/')
  Future<HttpResponse<GetDirectionDto>> getDirections({
    @Header("Api-Key") String apiKey = apiKey,
    @Query('origin') required String origin,
    @Query('destination') required String destination,
  });
}
