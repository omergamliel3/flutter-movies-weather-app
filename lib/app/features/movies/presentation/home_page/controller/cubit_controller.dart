import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prospera_exercise/app/core/usecases/usecase.dart';

import '../../../domain/usecases/get_remote_movie.dart';

import 'index.dart';
import 'state.dart';

import '../../../../../core/network/network_info.dart';
import '../../../../../core/errors/failure.dart';

const ERROR_MSG = 'No internet connection';

class HomeViewController extends Cubit<HomeState> {
  HomeViewController(
    this.networkInfo,
    this.getRemoteMovie,
  ) : super(const Initial());

  NetworkInfoI networkInfo;
  GetRemoteMovie getRemoteMovie;

  Future<void> getMovie() async {
    emit(const Loading());
    final connectivity = await networkInfo.isConnected();
    if (!connectivity) {
      await Future.delayed(const Duration(seconds: 1));
      waitForConnectivityAndCallGetMovie();
      emit(const Error(Failure(ERROR_MSG)));
    } else {
      final failureOrMovie = await getRemoteMovie.call(NoParams());
      emit(failureOrMovie.fold(
        (failure) => Error(failure),
        (movie) => Success(movie),
      ));
    }
  }

  void waitForConnectivityAndCallGetMovie() {
    StreamSubscription subscription;
    subscription = networkInfo.onConnectivityChanged.listen((event) {
      if (event != ConnectivityResult.none) {
        subscription.cancel();
        getMovie();
      }
    });
  }
}
