import 'package:dartz/dartz.dart';
import 'package:prospera_exercise/app/core/errors/failure.dart';
import 'package:prospera_exercise/app/features/feature/domain/entities/movie.dart';

abstract class Repository {
  Future<Either<Failure, List<Movie>>> getRemoteEntities();
  Future<Either<Failure, List<Movie>>> getLocalEntities();
}
