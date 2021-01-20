// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'http://www.omdbapi.com/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<MovieModel> getMovie(title, apikey) async {
    ArgumentError.checkNotNull(title, 'title');
    ArgumentError.checkNotNull(apikey, 'apikey');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/?t=$title&apikey=$apikey',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = MovieModel.fromJson(_result.data);
    return value;
  }
}
