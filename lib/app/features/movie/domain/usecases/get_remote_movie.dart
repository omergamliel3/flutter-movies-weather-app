import 'package:dartz/dartz.dart';

import 'package:prospera_exercise/app/core/errors/failure.dart';
import 'package:prospera_exercise/app/core/usecases/usecase.dart';

import '../entities/movie.dart';

import '../repositories/movie_repository.dart';

class GetRemoteMovie implements UseCase<Movie, NoParams> {
  final MovieRepository repository;
  GetRemoteMovie(this.repository);
  @override
  Future<Either<Failure, Movie>> call(NoParams params) async {
    return repository.getRemoteMovie();
  }
}
