import 'package:dartz/dartz.dart';
import 'package:prospera_exercise/app/core/errors/failure.dart';
import 'package:prospera_exercise/app/features/movie/domain/entities/movie.dart';

abstract class MovieRepository {
  Future<Either<Failure, Movie>> getRemoteMovie();
}
