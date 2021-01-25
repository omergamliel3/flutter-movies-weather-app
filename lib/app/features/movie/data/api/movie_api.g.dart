// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _MovieRestClient implements MovieRestClient {
  _MovieRestClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://www.omdbapi.com/';
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
