// import 'package:meta/meta.dart';
// import 'package:dartz/dartz.dart';

// import '../datasources/local/articles_local_datasource.dart';
// import '../datasources/remote/articles_remote_datasource.dart';

// import '../../domain/entities/article.dart';
// import '../../domain/repositories/articles_repository.dart';

// import 'package:getx_hacker_news_api/app/core/errors/failure.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter_boilerplate_project/app/core/errors/failure.dart';
import 'package:flutter_boilerplate_project/app/features/feature/domain/entities/entity.dart';
import 'package:flutter_boilerplate_project/app/features/feature/domain/repositories/repository.dart';

class EntitiesRepositoryImpl implements Repository {
  @override
  Future<Either<Failure, List<Entity>>> getLocalEntities() {
    // TODO: implement getLocalEntities
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Entity>>> getRemoteEntities() {
    // TODO: implement getRemoteEntities
    throw UnimplementedError();
  }
}

// class ArticlesRepositoryImpl implements ArticlesRepository {
//   ArticlesRepositoryImpl(
//       {@required this.localDataSource, @required this.remoteDataSource});
//   // local data source
//   final ArticlesLocalDatasource localDataSource;
//   // remote data source
//   final ArticlesRemoteDatasource remoteDataSource;

//   /// return either failure or list of articles
//   @override
//   Future<Either<Failure, List<Article>>> getRemoteArticles() async {
//     try {
//       final response = await remoteDataSource.getArticles();
//       return response.fold((failure) => Left(failure), (articles) async {
//         if (articles != null && articles.isNotEmpty) {
//           await localDataSource.insertArticles(articles);
//           return Right(articles);
//         }
//         return const Left(Failure('Can not find articles right now'));
//       });
//     } on Exception catch (_) {
//       return const Left(Failure('Something went wrong'));
//     }
//   }

//   /// return either failure or list of articles from saved local database
//   @override
//   Future<Either<Failure, List<Article>>> getLocalArticles() async {
//     final articles = await localDataSource.getArticles();
//     if (articles == null || articles.isEmpty) {
//       return const Left(Failure('No internet connection'));
//     }
//     return Right(articles);
//   }
// }
