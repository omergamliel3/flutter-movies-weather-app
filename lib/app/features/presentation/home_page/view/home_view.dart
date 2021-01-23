import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:prospera_exercise/di/injector.dart';

import 'package:prospera_exercise/app/core/widgets/index.dart';

import '../controller/cubit_controller.dart';
import '../controller/index.dart';

import '../widgets/widgets.dart';

class HomeView extends StatelessWidget {
  Widget buildBody(BuildContext context) {
    return BlocBuilder<HomeViewController, HomeState>(
      builder: (context, state) {
        return state.when(
          initial: () => const InitialView(),
          loading: () => const LoadingWidget(),
          success: (movie) => MovieView(movie),
          error: (failure) => ErrorView(failure),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => Injector.resolve<HomeViewController>()..getMovies(),
      child: Builder(
        builder: (context) => Scaffold(
          body: buildBody(context),
          floatingActionButton: FAB(),
        ),
      ),
    );
  }
}
