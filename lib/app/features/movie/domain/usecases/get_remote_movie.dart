import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:prospera_exercise/app/core/errors/failure.dart';
import 'package:prospera_exercise/app/core/usecases/usecase.dart';

import '../entities/movie.dart';

import '../repositories/movie_repository.dart';

class GetMovie implements UseCase<Movie, Params> {
  final MovieRepository repository;
  GetMovie(this.repository);
  @override
  Future<Either<Failure, Movie>> call(Params params) async {
    return repository.getMovie(params.movie);
  }
}

class Params extends Equatable {
  final String movie;

  const Params({@required this.movie});

  @override
  List<Object> get props => [movie];
}
