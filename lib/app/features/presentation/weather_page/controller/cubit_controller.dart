import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../weather/domain/usecases/get_remote_weather_city.dart';

import 'state.dart';

class WeatherViewController extends Cubit<WeatherState> {
  WeatherViewController({@required this.getRemoteWeatherByCity})
      : super(const Initial());

  final GetRemoteWeatherByCity getRemoteWeatherByCity;
  Future<void> getWeather() async {
    emit(const Loading());
    final result =
        await getRemoteWeatherByCity.call(const Params(city: 'London'));

    emit(result.fold(
      (failure) => Error(failure),
      (weather) => Success(weather),
    ));
  }
}
