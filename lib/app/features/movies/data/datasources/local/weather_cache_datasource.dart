import 'dart:convert';

import 'package:dartz/dartz.dart';

import 'package:prospera_exercise/app/core/errors/failure.dart';
import 'package:prospera_exercise/app/core/services/prefs.dart';
import 'package:prospera_exercise/app/features/movies/data/models/weather_model.dart';

const ERROR_MSG = 'Something went wrong';
const NO_SAVED_CACHE = 'Something went wrong';
const WEATHER_CACHE_KEY = 'weather_cache';

class WeatherCacheDatasource {
  final Prefs prefs;
  WeatherCacheDatasource(this.prefs);

  Future<Either<Failure, WeatherModel>> getCacheWeather() async {
    try {
      // get raw json cache from prefs
      final jsonCache = prefs.instance.getString(WEATHER_CACHE_KEY);
      // throw failure if jsonCache is null
      if (jsonCache == null) {
        return const Left(Failure(NO_SAVED_CACHE));
      }
      final weather = WeatherModel.fromJsonCache(
          json.decode(jsonCache) as Map<String, dynamic>);
      // throw failure if weather is null
      if (weather == null) {
        return const Left(Failure(ERROR_MSG));
      }
      // return valid weather
      return Right(weather);
    } on Exception catch (_) {
      return const Left(Failure(ERROR_MSG));
    }
  }
}
