import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'package:prospera_exercise/app/core/errors/failure.dart';
import 'package:prospera_exercise/app/core/services/location.dart';

import 'package:prospera_exercise/app/features/weather/domain/usecases/get_remote_weather_coords.dart';

import 'state.dart';

const ERROR_MSG = 'Device location is unknown';

class WeatherViewController extends Cubit<WeatherState> {
  WeatherViewController({
    @required this.getRemoteWeatherByCoords,
    @required this.locationService,
  }) : super(const Initial());

  final GetRemoteWeatherByCoords getRemoteWeatherByCoords;
  final LocationService locationService;

  Future<void> getWeather() async {
    // emit loading state
    emit(const Loading());
    // get device location
    final location = await locationService.getDeviceLocation();
    // emit error state if location is null
    if (location == null) {
      emit(const Error(Failure(ERROR_MSG)));
    } else {
      // get weather data by device location coords
      final result = await getRemoteWeatherByCoords.call(Params(
        lat: location.latitude,
        lon: location.longitude,
      ));

      emit(result.fold(
        (failure) => Error(failure),
        (weather) => Success(weather),
      ));
    }
  }
}
