import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/network/network_info.dart';
import '../../../../core/errors/failure.dart';

import '../datasources/local/weather_city_cache_datasource.dart';
import '../datasources/local/weather_coords_cache_datasource.dart';
import '../datasources/remote/weather_remote_datasource.dart';

import '../../domain/entities/weather.dart';
import '../../domain/repositories/weather_repository.dart';

const ERROR_MSG = 'Something went wrong';
const NO_CACHE = 'There is no local cache data';

class WeatherRepositoryImpl implements WeatherRepository {
  WeatherRepositoryImpl({
    @required this.remoteDatasource,
    @required this.coordsCacheDatasource,
    @required this.cityCacheDatasource,
    @required this.networkInfo,
  });

  final NetworkInfoI networkInfo;
  final WeatherRemoteDatasource remoteDatasource;
  final WeatherCoordsCacheDatasource coordsCacheDatasource;
  final WeatherCityCacheDatasource cityCacheDatasource;

  Future<Either<Failure, Weather>> getCoorsCacheWeather() async {
    try {
      final response = await coordsCacheDatasource.getCoordsCacheWeather();
      return response.fold(
          (failure) => Left(failure), (weather) => Right(weather));
    } catch (e) {
      print(e);
      return const Left(Failure(ERROR_MSG));
    }
  }

  Future<Either<Failure, Weather>> getCityCacheWeather(String city) async {
    try {
      final weather = await cityCacheDatasource.getCityCacheWeather(city);
      if (weather == null) {
        return const Left(Failure(NO_CACHE));
      }
      return Right(weather);
    } catch (e) {
      print(e);
      return const Left(Failure(ERROR_MSG));
    }
  }

  @override
  Future<Either<Failure, Weather>> getRemoteWeatherByCity(String city) async {
    try {
      //! check device connection
      //! if there is no connection return city cache weather data
      final connection = await networkInfo.isConnected();
      if (!connection) {
        return getCityCacheWeather(city);
      } else {
        final response = await remoteDatasource.getWeatherByCity(city);
        return response.fold((failure) => Left(failure), (weather) async {
          //! cache city weather data in local datasource
          await cityCacheDatasource.insertCityWeather(weather);
          return Right(weather);
        });
      }
    } catch (e) {
      print(e);
      return const Left(Failure(ERROR_MSG));
    }
  }

  @override
  Future<Either<Failure, Weather>> getRemoteWeatherByCoords(
      double lat, double lon) async {
    try {
      if (lat == null || lon == null) {
        return const Left(Failure(ERROR_MSG));
      }
      //! check device connection
      //! if there is no connection return city cache weather data
      final connection = await networkInfo.isConnected();
      if (!connection) {
        return getCoorsCacheWeather();
      }
      final response = await remoteDatasource.getWeatherByCoords(lat, lon);
      return response.fold((failure) => Left(failure), (weather) async {
        //! cache coords weather data in local datasource
        await coordsCacheDatasource.saveCoordsCacheWeather(weather);
        return Right(weather);
      });
    } catch (_) {
      return const Left(Failure(ERROR_MSG));
    }
  }
}
