import 'dart:async';

import 'package:meta/meta.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/foundation.dart' as foundation;

import 'package:prospera_exercise/app/core/errors/failure.dart';
import 'package:prospera_exercise/app/core/services/location.dart';

import 'package:prospera_exercise/app/features/weather/domain/usecases/get_remote_weather_coords.dart';

import 'state.dart';

const ERROR_MSG = 'The GPS signal is unavailable';

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

    Position location;

    //! handle web location (location does not supported in web platform)
    if (foundation.kIsWeb) {
      // assgin london city location
      location = Position(longitude: -0.118092, latitude: 51.509865);
    }
    //! handle ios / android location
    else {
      // get device location from service
      location = await locationService.getDeviceLocation();
    }

    // emit error state if location is null
    if (location == null) {
      emit(const Error(Failure(ERROR_MSG)));
    } else {
      // get weather data by device location coords
      final result = await getRemoteWeatherByCoords.call(Params(
        lat: location?.latitude,
        lon: location?.longitude,
      ));

      // fold result and emit state
      emit(result.fold(
        (failure) => Error(failure),
        (weather) => Success(weather),
      ));
    }
  }
}
