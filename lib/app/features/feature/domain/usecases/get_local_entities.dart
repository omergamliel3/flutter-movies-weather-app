import 'package:dartz/dartz.dart';
import 'package:prospera_exercise/app/core/errors/failure.dart';
import 'package:prospera_exercise/app/core/usecases/usecase.dart';

import '../entities/movie.dart';
import '../repositories/repository.dart';

class GetLocalEntities implements UseCase<List<Movie>> {
  final Repository repository;
  GetLocalEntities(this.repository);
  @override
  Future<Either<Failure, List<Movie>>> call() async {
    await Future.delayed(const Duration(seconds: 1));
    return repository.getLocalEntities();
  }
}
