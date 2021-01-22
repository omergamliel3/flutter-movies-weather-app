import 'package:dartz/dartz.dart';

import 'package:prospera_exercise/app/core/errors/failure.dart';
import 'package:prospera_exercise/app/core/usecases/usecase.dart';

import '../entities/weather.dart';
import '../repositories/weather_repository.dart';

class GetCacheWeather implements UseCase<Weather> {
  final WeatherRepository repository;
  GetCacheWeather(this.repository);
  @override
  Future<Either<Failure, Weather>> call() async {
    return repository.getCacheWeather();
  }
}
