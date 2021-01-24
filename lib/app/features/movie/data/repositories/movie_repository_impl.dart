import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import 'package:prospera_exercise/app/core/errors/failure.dart';
import 'package:prospera_exercise/app/core/network/network_info.dart';
import 'package:prospera_exercise/app/features/movie/data/datasources/local/movie_cache_datasource.dart';

import 'package:prospera_exercise/app/features/movie/domain/entities/movie.dart';
import 'package:prospera_exercise/app/features/movie/domain/repositories/movie_repository.dart';

import '../datasources/remote/movie_remote_datasource.dart';

const ERROR_MSG = 'Something went wrong';
const NO_INTERNET_MSG = 'Device offline';

class MovieRepositoryImpl implements MovieRepository {
  MovieRepositoryImpl({
    @required this.remoteDatasource,
    @required this.cacheDatasource,
    @required this.networkInfo,
  });

  final MovieRemoteDatasource remoteDatasource;
  final MovieCacheDatasource cacheDatasource;
  final NetworkInfoI networkInfo;

  @override
  Future<Either<Failure, Movie>> getMovie(String movie) async {
    try {
      //! first, try to get movie from local cache data source
      final failureOrMovie = await cacheDatasource.getMovie(movie);
      if (failureOrMovie.isRight()) {
        return failureOrMovie;
      }
      //! second, checks for internet connection and return failure if there is not
      final connection = await networkInfo.isConnected();
      if (!connection) {
        return const Left(Failure(NO_INTERNET_MSG));
      }
      //! third, try to get movie from remote data source
      final response = await remoteDatasource.getMovie(movie);
      return response.fold((failure) => Left(failure), (movie) {
        //! cache movie model data in cache data source
        cacheDatasource.insertMovie(movie);
        return Right(movie);
      });
    } catch (_) {
      return const Left(Failure(ERROR_MSG));
    }
  }
}
