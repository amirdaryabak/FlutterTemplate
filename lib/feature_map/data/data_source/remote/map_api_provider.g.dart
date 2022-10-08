// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_api_provider.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _MapApiProvider implements MapApiProvider {
  _MapApiProvider(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://api.neshan.org/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<AddressSearchDto>> getAddressFilter(
      {apiKey = apiKey, required lat, required lng, required term}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'lat': lat,
      r'lng': lng,
      r'term': term
    };
    final _headers = <String, dynamic>{r'Api-Key': apiKey};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<AddressSearchDto>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'v1/search/',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AddressSearchDto.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<AddressDto>> getFastReverse(
      {apiKey = apiKey, required lat, required lon}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'lat': lat, r'lng': lon};
    final _headers = <String, dynamic>{r'Api-Key': apiKey};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<AddressDto>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'v5/reverse/',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AddressDto.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<GetDirectionDto>> getDirections(
      {apiKey = apiKey, required origin, required destination}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'origin': origin,
      r'destination': destination
    };
    final _headers = <String, dynamic>{r'Api-Key': apiKey};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<GetDirectionDto>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'v4/direction/no-traffic/',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetDirectionDto.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
