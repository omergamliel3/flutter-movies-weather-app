import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:dio/dio.dart';

import 'package:meta/meta.dart';

import '../../../../../core/errors/failure.dart';

import '../../models/weather_model.dart';
import '../../api/weather_api.dart';

const ERROR_MSG = 'Something went wrong';
const INVALID_COORDS = 'invalid coord';
const INVALID_CITY_NAME = 'invalid city name';

class WeatherRemoteDatasource {
  final WeatherRestClient client;
  WeatherRemoteDatasource({@required this.client});

  // get weather by coords from api endpoint
  // return Failure if catch error or status code is not 200
  // or invalid coords
  // return decoded data as Map if status code is 200
  Future<Either<Failure, WeatherModel>> getWeatherByCoords(
      double lat, double lon) async {
    try {
      final weather =
          await client.getWeatherByCoords(lat, lon, env['WEATHER_API_KEY']);
      if (weather == null) {
        return const Left(Failure(ERROR_MSG));
      }

      if (lat != weather.lat || lon != weather.lon) {
        return const Left(Failure(INVALID_COORDS));
      }

      return Right(weather);
    } on DioError catch (error) {
      print(error.type);
      print(error.message);
      return Left(Failure(error.message));
    } on Exception catch (_) {
      return const Left(Failure(ERROR_MSG));
    }
  }

  // get weather by city name from api endpoint
  // return Failure if catch error or status code is not 200
  // or invalid city name
  // return decoded data as Map if status code is 200
  Future<Either<Failure, WeatherModel>> getWeatherByCity(String city) async {
    try {
      final weather =
          await client.getWeatherByCity(city, env['WEATHER_API_KEY']);
      if (weather == null) {
        return const Left(Failure(ERROR_MSG));
      }

      if (city != weather.name) {
        return const Left(Failure(INVALID_CITY_NAME));
      }

      return Right(weather);
    } on DioError catch (error) {
      print(error.type);
      print(error.message);
      return Left(Failure(error.message));
    } on Exception catch (_) {
      return const Left(Failure(ERROR_MSG));
    }
  }
}
