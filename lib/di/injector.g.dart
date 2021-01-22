// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$Injector extends Injector {
  @override
  void _configureCore() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton((c) => Connectivity());
    container.registerSingleton<NetworkInfoI>(
        (c) => NetworkInfo(connectivity: c<Connectivity>()));
    container.registerSingleton((c) => ThemeProvider(c<Prefs>()));
  }

  @override
  void _configureControllers() {
    final KiwiContainer container = KiwiContainer();
    container.registerFactory((c) => LoadingViewController());
    container.registerFactory((c) => MainViewController());
    container.registerFactory(
        (c) => HomeViewController(c<NetworkInfoI>(), c<GetRemoteMovie>()));
    container.registerFactory((c) => SearchViewController());
    container.registerFactory((c) => SavedViewController());
    container.registerFactory((c) => WeatherViewController());
  }

  @override
  void _configureMovieModuleFactories() {
    final KiwiContainer container = KiwiContainer();
    container.registerFactory(
        (c) => MovieRemoteDatasource(client: c<MovieRestClient>()));
    container.registerFactory<MovieRepository>((c) =>
        MovieRepositoryImpl(remoteDatasource: c<MovieRemoteDatasource>()));
    container.registerFactory((c) => GetRemoteMovie(c<MovieRepository>()));
  }

  @override
  void _configureWeatherModuleFactories() {
    final KiwiContainer container = KiwiContainer();
    container.registerFactory(
        (c) => WeatherRemoteDatasource(client: c<WeatherRestClient>()));
    container.registerFactory((c) => WeatherCacheDatasource(c<Prefs>()));
    container.registerFactory<WeatherRepository>((c) => WeatherRepositoryImpl(
        remoteDatasource: c<WeatherRemoteDatasource>(),
        cacheDatasource: c<WeatherCacheDatasource>()));
    container
        .registerFactory((c) => GetRemoteWeatherByCity(c<WeatherRepository>()));
    container.registerFactory(
        (c) => GetRemoteWeatherByCoords(c<WeatherRepository>()));
  }
}
