import 'package:flutter_bloc/flutter_bloc.dart';

import 'state.dart';

class WeatherViewController extends Cubit<WeatherState> {
  WeatherViewController() : super(const Initial());
}
