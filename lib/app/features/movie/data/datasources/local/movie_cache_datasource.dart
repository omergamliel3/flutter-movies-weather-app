import 'dart:convert';

import 'package:dartz/dartz.dart';

import 'package:prospera_exercise/app/core/errors/failure.dart';
import 'package:prospera_exercise/app/core/services/prefs.dart';
import 'package:prospera_exercise/app/features/movie/data/models/movie_model.dart';

const MOVIES_CACHE_KEY = 'movies_cache';

const NO_CACHE_MOVIE = 'can not find movie in local cache';

class MovieCacheDatasource {
  final Prefs prefs;
  MovieCacheDatasource(this.prefs);

  // try to find [title] in movies local cache
  Future<Either<Failure, MovieModel>> getMovie(String title) async {
    try {
      final cacheMovies =
          prefs.instance.getStringList(MOVIES_CACHE_KEY) ?? <String>[];

      for (final cacheMovie in cacheMovies) {
        final movie = MovieModel.fromJson(
            json.decode(cacheMovie) as Map<String, dynamic>);
        if (movie.title.toLowerCase() == title.toLowerCase()) {
          return Right(movie);
        }
      }
      return const Left(Failure(NO_CACHE_MOVIE));
    } catch (e) {
      print(e);
      return const Left(Failure(NO_CACHE_MOVIE));
    }
  }

  // insert movie model in local cache
  Future<bool> insertMovie(MovieModel movie) async {
    try {
      final cacheMovies =
          prefs.instance.getStringList(MOVIES_CACHE_KEY) ?? <String>[];
      cacheMovies.add(json.encode(movie.toJson()));
      return prefs.instance.setStringList(MOVIES_CACHE_KEY, cacheMovies);
    } catch (e) {
      print(e);
      return false;
    }
  }
}
