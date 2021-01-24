import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

import '../entities/weather.dart';

abstract class WeatherRepository {
  // todo: merge methods to one (getweatherbycoords and getweatherbycity)
  // todo: repository should resolve datasource (local cache or remote)
  Future<Either<Failure, Weather>> getRemoteWeatherByCoords(
      double lat, double lon);
  Future<Either<Failure, Weather>> getRemoteWeatherByCity(String city);
}
