import 'package:dartz/dartz.dart';

import 'package:prospera_exercise/app/core/errors/failure.dart';
import 'package:prospera_exercise/app/core/usecases/usecase.dart';

import '../entities/weather.dart';
import '../repositories/weather_repository.dart';

class GetRemoteWeather implements UseCase<Weather> {
  final WeatherRepository repository;
  GetRemoteWeather(this.repository);
  @override
  Future<Either<Failure, Weather>> call() async {
    return repository.getRemoteWeather();
  }
}
