import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../datasources/local/weather_cache_datasource.dart';
import '../datasources/remote/weather_remote_datasource.dart';

import '../../domain/entities/weather.dart';
import '../../domain/repositories/weather_repository.dart';

import 'package:prospera_exercise/app/core/errors/failure.dart';

const ERROR_MSG = 'Something went wrong';

class WeatherRepositoryImpl implements WeatherRepository {
  WeatherRepositoryImpl(
      {@required this.remoteDatasource, @required this.cacheDatasource});

  final WeatherRemoteDatasource remoteDatasource;
  final WeatherCacheDatasource cacheDatasource;

  @override
  Future<Either<Failure, Weather>> getCacheWeather() async {
    try {
      final response = await cacheDatasource.getCacheWeather();
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
