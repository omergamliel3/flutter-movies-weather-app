import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/widgets/image_handler_widget.dart';
import '../../../domain/entities/movie.dart';

import 'package:prospera_exercise/di/injector.dart';

import '../../../../../core/widgets/index.dart';
import '../controller/cubit_controller.dart';
import '../controller/index.dart';

import '../widgets/widgets.dart';

class HomeView extends StatelessWidget {
  Widget buildBody(BuildContext context) {
    return BlocBuilder<HomeViewController, HomeState>(
      builder: (context, state) {
        return state.when(
          initial: () => buildInitial(context),
          loading: () => LoadingWidget(),
          success: (movie) => buildMovie(movie),
          error: (failure) => buildError(context, failure),
        );
      },
    );
  }

  Widget buildInitial(BuildContext context) {
    return const Center(
        child: Text(
      'Home Page',
      style: TextStyle(fontSize: 30),
    ));
  }

  Widget buildMovie(Movie movie) {
    return Card(
      elevation: 4.0,
      child: Column(
        children: [
          Expanded(
              flex: 2, child: ImageHandlerWidget(urlToImage: movie.poster)),
          Expanded(
            child: Column(
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                Text(movie.title),
                const SizedBox(
                  height: 10.0,
                ),
                Text(movie.year),
                const SizedBox(
                  height: 10.0,
                ),
                Text(movie.actors),
                const SizedBox(
                  height: 10.0,
                ),
                Text(movie.genre),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildError(BuildContext context, Failure failure) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(failure.message),
        const SizedBox(
          height: 30,
        ),
        buildInitial(context),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => Injector.resolve<HomeViewController>(),
      child: Builder(
        builder: (context) => Scaffold(
          body: buildBody(context),
          floatingActionButton: FAB(),
        ),
      ),
    );
  }
}
