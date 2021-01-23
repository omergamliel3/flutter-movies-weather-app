import 'package:kiwi/kiwi.dart';

import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:prospera_exercise/app/core/services/location.dart';
import 'package:prospera_exercise/app/features/movie/data/datasources/local/movie_cache_datasource.dart';

import 'package:prospera_exercise/app/features/weather/data/api/weather_api.dart';
import 'package:prospera_exercise/app/features/weather/data/datasources/local/weather_city_cache_datasource.dart';
import '../app/features/movie/data/api/movie_api.dart';

import 'package:prospera_exercise/app/features/weather/data/datasources/local/weather_coords_cache_datasource.dart';
import 'package:prospera_exercise/app/features/weather/data/datasources/remote/weather_remote_datasource.dart';
import 'package:prospera_exercise/app/features/weather/data/repositories/weather_repository_impl.dart';

import 'package:prospera_exercise/app/features/weather/domain/repositories/weather_repository.dart';
import 'package:prospera_exercise/app/features/weather/domain/usecases/get_remote_weather_city.dart';
import 'package:prospera_exercise/app/features/weather/domain/usecases/get_remote_weather_coords.dart';
import 'package:prospera_exercise/app/features/movie/domain/repositories/movie_repository.dart';
import 'package:prospera_exercise/app/features/movie/domain/usecases/get_remote_movie.dart';

import 'package:prospera_exercise/app/features/movie/data/datasources/remote/movie_remote_datasource.dart';
import 'package:prospera_exercise/app/features/movie/data/repositories/movie_repository_impl.dart';

import '../app/core/network/network_info.dart';
import 'package:prospera_exercise/app/core/services/prefs.dart';
import '../app/theme/theme_provider.dart';

import '../app/features/presentation/home_page/controller/cubit_controller.dart';
import '../app/features/presentation/loading_page/controller/cubit_controller.dart';
import '../app/features/presentation/main_page/controller/cubit_controller.dart';
import '../app/features/presentation/saved_page/controller/cubit_controller.dart';
import '../app/features/presentation/search_page/controller/cubit_controller.dart';
import '../app/features/presentation/weather_page/controller/cubit_controller.dart';

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
    // register shared preferences
    final prefs = Prefs();
    await prefs.initPrefs();
    container.registerInstance(prefs);

    // register weather city cache datasource (sembast database)
    final weatherDatabase = WeatherCityCacheDatasource();
    await weatherDatabase.initDb();
    container.registerInstance(weatherDatabase);
  }

  void _configure() {
    _configureCore();
    _configureControllers();
    _configureMovieModule();
    _configureWeatherModule();
  }

  // Core module
  @Register.singleton(Connectivity)
  @Register.singleton(NetworkInfoI, from: NetworkInfo)
  @Register.singleton(ThemeProvider)
  @Register.singleton(LocationService)
  void _configureCore();

  // Controllers module
  @Register.factory(LoadingViewController)
  @Register.factory(MainViewController)
  @Register.factory(HomeViewController)
  @Register.factory(SearchViewController)
  @Register.factory(SavedViewController)
  @Register.factory(WeatherViewController)
  void _configureControllers();

  // Movie module
  void _configureMovieModule() {
    _configureMovieModuleInstances();
    _configureMovieModuleFactories();
  }

  // Register Movie module Instances
  void _configureMovieModuleInstances() {
    container.registerInstance(MovieRestClient(Dio()));
  }

  // Register Movie module Factories
  @Register.factory(MovieRemoteDatasource)
  @Register.factory(MovieCacheDatasource)
  @Register.factory(MovieRepository, from: MovieRepositoryImpl)
  @Register.factory(GetRemoteMovie)
  void _configureMovieModuleFactories();

  // Weather module
  void _configureWeatherModule() {
    _configureWeatherModuleInstances();
    _configureWeatherModuleFactories();
  }

  // Register Weather module Instances
  void _configureWeatherModuleInstances() {
    container.registerInstance(WeatherRestClient(Dio()));
  }

  // Register Weather module Factories
  @Register.factory(WeatherRemoteDatasource)
  @Register.factory(WeatherCoordsCacheDatasource)
  @Register.factory(WeatherRepository, from: WeatherRepositoryImpl)
  // TODO: remove remote - repo should resolv remote or cache
  @Register.factory(GetRemoteWeatherByCity)
  @Register.factory(GetRemoteWeatherByCoords)
  void _configureWeatherModuleFactories();
}
