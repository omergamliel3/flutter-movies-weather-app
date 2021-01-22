import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:prospera_exercise/app/features/weather/data/datasources/local/weather_city_cache_datasource.dart';

import '../datasources/local/weather_coords_cache_datasource.dart';
import '../datasources/remote/weather_remote_datasource.dart';

import '../../domain/entities/weather.dart';
import '../../domain/repositories/weather_repository.dart';

import 'package:prospera_exercise/app/core/errors/failure.dart';

const ERROR_MSG = 'Something went wrong';

// todo: merge methods to one (getweatherbycoords and getweatherbycity)
// todo: repository should resolve datasource (local cache or remote)

class WeatherRepositoryImpl implements WeatherRepository {
  WeatherRepositoryImpl({
    @required this.remoteDatasource,
    @required this.coordsCacheDatasource,
    @required this.cityCacheDatasource,
  });

  final WeatherRemoteDatasource remoteDatasource;
  final WeatherCoordsCacheDatasource coordsCacheDatasource;
  final WeatherCityCacheDatasource cityCacheDatasource;

  @override
  Future<Either<Failure, Weather>> getCacheWeather() async {
    try {
      final response = await coordsCacheDatasource.getCoordsCacheWeather();
      return response.fold(
          (failure) => Left(failure), (weather) => Right(weather));
    } catch (_) {
      return const Left(Failure(ERROR_MSG));
    }
  }

  @override
  Future<Either<Failure, Weather>> getRemoteWeatherByCity(String city) async {
    try {
      final response = await remoteDatasource.getWeatherByCity(city);
      return response.fold(
          (failure) => Left(failure), (weather) => Right(weather));
    } catch (_) {
      return const Left(Failure(ERROR_MSG));
    }
  }

  @override
  Future<Either<Failure, Weather>> getRemoteWeatherByCoords(
      double lat, double lon) async {
    try {
      final response = await remoteDatasource.getWeatherByCoords(lat, lon);
      return response.fold(
          (failure) => Left(failure), (weather) => Right(weather));
    } catch (_) {
      return const Left(Failure(ERROR_MSG));
    }
  }
}
