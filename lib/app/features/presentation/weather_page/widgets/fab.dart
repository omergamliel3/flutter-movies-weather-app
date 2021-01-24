import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prospera_exercise/app/features/presentation/weather_page/controller/index.dart';

class FAB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        heroTag: 'weather_fab',
        onPressed: () =>
            BlocProvider.of<WeatherViewController>(context).getWeather(),
        child: const Icon(Icons.refresh));
  }
}
