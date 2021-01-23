import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/index.dart';
import '../widgets/widgets.dart';

import 'package:prospera_exercise/app/core/widgets/index.dart';
import 'package:prospera_exercise/di/injector.dart';

class WeatherView extends StatelessWidget {
  Widget buildBody() {
    return BlocBuilder<WeatherViewController, WeatherState>(
      builder: (context, state) {
        return state.when(
          initial: () => const LoadingWidget(),
          loading: () => const LoadingWidget(),
          sucess: (weather) => WeatherWidget(weather),
          error: (failure) => ErrorView(failure),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => Injector.resolve<WeatherViewController>()..getWeather(),
      child: Builder(
        builder: (context) => Scaffold(
          body: buildBody(),
          floatingActionButton: FAB(),
        ),
      ),
    );
  }
}
