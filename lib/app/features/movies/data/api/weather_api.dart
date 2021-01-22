import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../models/weather_model.dart';

part 'weather_api.g.dart';

@RestApi(baseUrl: "https://api.openweathermap.org/data/2.5/")
abstract class WeatherRestClient {
  factory WeatherRestClient(Dio dio, {String baseUrl}) = _WeatherRestClient;

  @GET("/weather?lat={lat}&lon={lon}&units=metric&appid={apikey}")
  Future<WeatherModel> getWeatherByCoords(@Path('lat') double lat,
      @Path('lon') double lon, @Path('apikey') String apikey);

  @GET("/weather?q={city}&units=metric&appid={apikey}")
  Future<WeatherModel> getWeatherByCity(
      @Path('city') String city, @Path('apikey') String apikey);
}
