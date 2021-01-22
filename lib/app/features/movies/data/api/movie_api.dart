import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../models/movie_model.dart';

part 'movie_api.g.dart';

@RestApi(baseUrl: "http://www.omdbapi.com/")
abstract class MovieRestClient {
  factory MovieRestClient(Dio dio, {String baseUrl}) = _MovieRestClient;

  @GET("/?t={title}&apikey={apikey}")
  Future<MovieModel> getMovie(
      @Path('title') String title, @Path('apikey') String apikey);
}
