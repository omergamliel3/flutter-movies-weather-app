import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:prospera_exercise/app/core/errors/failure.dart';
import 'package:prospera_exercise/app/features/movie/domain/entities/movie.dart';
import 'package:prospera_exercise/app/features/movie/domain/repositories/movie_repository.dart';

import '../../../../core/errors/failure.dart';
import '../datasources/remote/movie_remote_datasource.dart';

const ERROR_MSG = 'Something went wrong';

class MovieRepositoryImpl implements MovieRepository {
  MovieRepositoryImpl({@required this.remoteDatasource});

  final MovieRemoteDatasource remoteDatasource;

  @override
  Future<Either<Failure, Movie>> getRemoteMovie(String movie) async {
    try {
      final response = await remoteDatasource.getMovie(movie);
      return response.fold((failure) => Left(failure), (movie) => Right(movie));
    } catch (_) {
      return const Left(Failure(ERROR_MSG));
    }
  }
}
