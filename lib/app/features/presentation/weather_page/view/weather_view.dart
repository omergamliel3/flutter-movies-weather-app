import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:prospera_exercise/app/core/widgets/index.dart';
import '../controller/index.dart';

import 'package:prospera_exercise/di/injector.dart';

class WeatherView extends StatelessWidget {
  Widget buildShowWeather() {
    const style = TextStyle(fontSize: 25);
    return BlocBuilder<WeatherViewController, WeatherState>(
      builder: (context, state) {
        return state.when(
          initial: () => const Text(
            'Wait for weather',
            style: style,
          ),
          loading: () => const LoadingWidget(),
          sucess: (weather) => Text(
            weather.description,
            style: style,
          ),
          error: (failure) => Text(
            failure.message,
            style: style,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => Injector.resolve<WeatherViewController>(),
      child: Builder(
        builder: (context) => Scaffold(
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildShowWeather(),
              const SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                onPressed: () => BlocProvider.of<WeatherViewController>(context)
                    .getWeather(),
                child: const Text('Fetch Weather'),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
