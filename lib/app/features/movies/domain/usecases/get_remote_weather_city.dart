import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:prospera_exercise/app/core/errors/failure.dart';
import 'package:prospera_exercise/app/core/usecases/usecase.dart';

import '../entities/weather.dart';
import '../repositories/weather_repository.dart';

class GetRemoteWeatherByCity implements UseCase<Weather, Params> {
  final WeatherRepository repository;
  GetRemoteWeatherByCity(this.repository);
  @override
  Future<Either<Failure, Weather>> call(Params params) async {
    return repository.getRemoteWeatherByCity(params.city);
  }
}

class Params extends Equatable {
  final String city;

  const Params({@required this.city});

  @override
  List<Object> get props => [city];
}
