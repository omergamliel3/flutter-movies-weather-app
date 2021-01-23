import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prospera_exercise/app/features/movie/domain/entities/movie.dart';

import 'package:prospera_exercise/app/features/movie/domain/usecases/get_remote_movie.dart';

import 'package:prospera_exercise/app/core/errors/failure.dart';
import 'package:prospera_exercise/app/core/network/network_info.dart';

import 'index.dart';
import 'state.dart';

const ERROR_MSG = 'No internet connection';

const MOVIE_TITLES = <String>[
  'The Shawshank Redemption',
  'The Godfather',
  'The Godfather: Part II',
  'The Dark Knight',
  'Angry Men',
  "Schindler's List",
  'The Lord of the Rings: The Return of the King',
  'Pulp Fiction',
  'The Good, the Bad and the Ugly',
  'Fight Club',
  'Forrest Gump',
  'Inception',
  'The Matrix',
  'Goodfellas',
  'Se7en',
  'Interstellar',
  'Spirited Away',
  'Parasite',
];

class HomeViewController extends Cubit<HomeState> {
  HomeViewController(
    this.networkInfo,
    this.getRemoteMovie,
  ) : super(const Initial());

  NetworkInfoI networkInfo;
  GetRemoteMovie getRemoteMovie;

  Future<void> getMovies() async {
    // movies list
    final movies = <Movie>[];
    // emit loading state
    emit(const Loading());
    // check connectivity
    final connectivity = await networkInfo.isConnected();
    if (!connectivity) {
      await Future.delayed(const Duration(seconds: 1));
      waitForConnectivityAndCallGetMovies();
      // emit error state (failed to get movies)
      emit(const Error(Failure(ERROR_MSG)));
    } else {
      for (final title in MOVIE_TITLES) {
        final failureOrMovie = await getRemoteMovie.call(Params(movie: title));
        failureOrMovie.fold(
          (failure) => print(failure.message),
          (movie) => movies.add(movie),
        );
      }
      emit(Success(movies));
    }
  }

  void waitForConnectivityAndCallGetMovies() {
    StreamSubscription subscription;
    subscription = networkInfo.onConnectivityChanged.listen((event) {
      if (event != ConnectivityResult.none) {
        subscription.cancel();
        getMovies();
      }
    });
  }
}
