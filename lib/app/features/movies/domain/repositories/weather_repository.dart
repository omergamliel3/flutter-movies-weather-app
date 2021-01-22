import 'package:dartz/dartz.dart';
import 'package:prospera_exercise/app/core/errors/failure.dart';
import 'package:prospera_exercise/app/features/movies/domain/entities/weather.dart';

abstract class WeatherRepository {
  Future<Either<Failure, Weather>> getRemoteWeather();
  Future<Either<Failure, Weather>> getCacheWeather();
}
