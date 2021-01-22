import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:prospera_exercise/app/core/errors/failure.dart';

import 'package:prospera_exercise/app/features/weather/domain/entities/weather.dart';

part 'state.freezed.dart';

@freezed
abstract class WeatherState with _$WeatherState {
  const factory WeatherState.initial() = Initial;
  const factory WeatherState.loading() = Loading;
  const factory WeatherState.sucess(Weather weather) = Success;
  const factory WeatherState.error(Failure failure) = Error;
}
