import 'package:flutter_bloc/flutter_bloc.dart';

import 'state.dart';

class WeaterViewController extends Cubit<WeatherState> {
  WeaterViewController() : super(const Initial());
}
