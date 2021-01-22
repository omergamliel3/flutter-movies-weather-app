import 'package:prospera_exercise/app/core/services/prefs.dart';
import 'package:kiwi/kiwi.dart';

import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';

import '../app/core/network/network_info.dart';
import '../app/features/movies/data/api/movie_api.dart';

import '../app/theme/theme_provider.dart';

import 'package:prospera_exercise/app/features/movies/data/datasources/remote/movie_remote_datasource.dart';
import 'package:prospera_exercise/app/features/movies/data/repositories/movie_repository_impl.dart';
import 'package:prospera_exercise/app/features/movies/domain/repositories/movie_repository.dart';
import 'package:prospera_exercise/app/features/movies/domain/usecases/get_remote_movie.dart';

import '../app/features/movies/presentation/home_page/controller/cubit_controller.dart';
import '../app/features/movies/presentation/loading_page/controller/cubit_controller.dart';
import '../app/features/movies/presentation/main_page/controller/cubit_controller.dart';
import '../app/features/movies/presentation/saved_page/controller/cubit_controller.dart';
import '../app/features/movies/presentation/search_page/controller/cubit_controller.dart';

part 'injector.g.dart';

abstract class Injector {
  static KiwiContainer container;

  static final resolve = container.resolve;

  static void setup() {
    _$Injector()._configure();
  }

  //! must run before setup()
  static Future<void> setupAsync() async {
    container = KiwiContainer();
    final prefs = Prefs();
    await prefs.initPrefs();
    container.registerInstance(prefs);
  }

  void _configure() {
    _configureCore();
    _configureFeatureModule();
  }

  // Core module
  @Register.singleton(Connectivity)
  @Register.singleton(NetworkInfoI, from: NetworkInfo)
  @Register.singleton(ThemeProvider)
  void _configureCore();

  // Feature module
  void _configureFeatureModule() {
    _configureFeatureModuleInstances();
    _configureFeatureModuleFactories();
  }

  // Register Feature module Instances
  void _configureFeatureModuleInstances() {
    container.registerInstance(MovieRestClient(Dio()));
  }

  // Register Movies module Factories
  @Register.factory(MovieRemoteDatasource)
  @Register.factory(MovieRepository, from: MovieRepositoryImpl)
  @Register.factory(GetRemoteMovie)
  @Register.factory(LoadingViewController)
  @Register.factory(MainViewController)
  @Register.factory(HomeViewController)
  @Register.factory(SearchViewController)
  @Register.factory(SavedViewController)
  void _configureFeatureModuleFactories();
}
