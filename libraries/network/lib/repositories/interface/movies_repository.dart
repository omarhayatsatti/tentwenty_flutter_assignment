import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:network/utils/api_constants.dart';
import 'package:retrofit/retrofit.dart';

part 'movies_repository.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class MoviesRepository {
  factory MoviesRepository(Dio dio, {String baseUrl}) =
      _MoviesRepository;


  @GET("/movie/upcoming")
  Future<Response> fetchUpComingMovies(
      @Query("api_key") String apiKey,
      @Query("page") int page);
}
