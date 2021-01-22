import 'package:dartz/dartz.dart';
import 'package:prospera_exercise/app/core/errors/failure.dart';
import 'package:prospera_exercise/app/features/weather/domain/entities/weather.dart';

abstract class WeatherRepository {
  Future<Either<Failure, Weather>> getRemoteWeatherByCoords(
      double lat, double lon);
  Future<Either<Failure, Weather>> getRemoteWeatherByCity(String city);
  Future<Either<Failure, Weather>> getCacheWeather();
}
