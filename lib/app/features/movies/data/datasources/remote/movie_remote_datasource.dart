import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:dio/dio.dart';

import 'package:meta/meta.dart';

import '../../../../../core/errors/failure.dart';

import '../../models/movie_model.dart';
import '../../api/api.dart';

const ERROR_MSG = 'Something went wrong';

class MovieRemoteDatasource {
  final RestClient client;
  MovieRemoteDatasource({@required this.client});

  // get movie from api endpoint
  // return Failure if catch error or status code is not 200
  // return decoded data as Map if status code is 200
  Future<Either<Failure, MovieModel>> getMovie() async {
    try {
      final movie = await client.getMovie('avatar', env['API_KEY']);
      if (movie == null) {
        throw Exception(ERROR_MSG);
      }
      return Right(movie);
    } on DioError catch (error) {
      print(error.type);
      print(error.message);
      return Left(Failure(error.message));
    } on Exception catch (_) {
      return const Left(Failure(ERROR_MSG));
    }
  }
}
