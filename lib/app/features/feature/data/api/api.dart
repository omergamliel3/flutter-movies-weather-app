import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../models/movie_model.dart';

part 'api.g.dart';

// EXAPMLE env['VAR_NAME'];

@RestApi(baseUrl: "http://www.omdbapi.com/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/?t={title}&apikey={apikey}")
  Future<MovieModel> getMovie(
      @Path('title') String title, @Path('apikey') String apikey);
}
