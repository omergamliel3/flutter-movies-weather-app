import 'dart:convert';

import 'package:dartz/dartz.dart';

import 'package:prospera_exercise/app/core/errors/failure.dart';
import 'package:prospera_exercise/app/core/services/prefs.dart';
import 'package:prospera_exercise/app/features/weather/data/models/weather_model.dart';

const ERROR_MSG = 'Something went wrong';
const NO_SAVED_CACHE = 'Something went wrong';
const WEATHER_CACHE_KEY = 'weather_cache';

// Weather coords local data source to
// store user device location weather data

class WeatherCoordsCacheDatasource {
  final Prefs prefs;
  WeatherCoordsCacheDatasource(this.prefs);

  Future<Either<Failure, WeatherModel>> getCoordsCacheWeather() async {
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

  // save weather model in local cache (prefs)
  // return [true / false] if saved in cache successfuly
  Future<bool> saveCoordsCacheWeather(WeatherModel weather) async {
    try {
      final result = await prefs.instance
          .setString(WEATHER_CACHE_KEY, json.encode(weather.toJson()));
      return result;
    } on Exception catch (e) {
      print(e);
      return false;
    }
  }
}
