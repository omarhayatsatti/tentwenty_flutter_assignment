

part of 'movies_repository.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
class _MoviesRepository implements MoviesRepository {
  _MoviesRepository(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://api.themoviedb.org/3';
  }

  final Dio _dio;

  String baseUrl;
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

  @override
  Future<Response<dynamic>> fetchUpComingMovies(appKey, page) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Response<dynamic>>(Options(
            method: 'GET',
            extra: _extra)
            .compose(_dio.options, '/movie/upcoming?api_key=$appKey&page=$page',
            queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    //final value = Response<dynamic>.fromJson(_result.data!);
    return _result;
  }

}
