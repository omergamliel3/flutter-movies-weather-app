import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:prospera_exercise/app/core/errors/failure.dart';
import 'package:prospera_exercise/app/core/usecases/usecase.dart';

import '../entities/weather.dart';
import '../repositories/weather_repository.dart';

class GetRemoteWeatherByCoords implements UseCase<Weather, Params> {
  final WeatherRepository repository;
  GetRemoteWeatherByCoords(this.repository);
  @override
  Future<Either<Failure, Weather>> call(Params params) async {
    return repository.getRemoteWeatherByCoords(params.lat, params.lon);
  }
}

class Params extends Equatable {
  final double lat;
  final double lon;

  const Params({
    @required this.lat,
    @required this.lon,
  });

  @override
  List<Object> get props => [lat, lon];
}
