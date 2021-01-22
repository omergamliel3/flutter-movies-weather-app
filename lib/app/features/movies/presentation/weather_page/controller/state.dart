import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/weather.dart';

import '../../../../../core/errors/failure.dart';

part 'state.freezed.dart';

@freezed
abstract class WeatherState with _$WeatherState {
  const factory WeatherState.initial() = Initial;
  const factory WeatherState.loading() = Loading;
  const factory WeatherState.sucess(Weather weather) = Success;
  const factory WeatherState.error(Failure failure) = Error;
}
