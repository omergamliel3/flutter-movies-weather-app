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
  void _configureFeatureModuleFactories() {
    final KiwiContainer container = KiwiContainer();
    container.registerFactory(
        (c) => MovieRemoteDatasource(client: c<MovieRestClient>()));
    container.registerFactory<MovieRepository>((c) =>
        MovieRepositoryImpl(remoteDatasource: c<MovieRemoteDatasource>()));
    container.registerFactory((c) => GetRemoteMovie(c<MovieRepository>()));
    container.registerFactory((c) => LoadingViewController());
    container.registerFactory((c) => MainViewController());
    container.registerFactory(
        (c) => HomeViewController(c<NetworkInfoI>(), c<GetRemoteMovie>()));
    container.registerFactory((c) => SearchViewController());
    container.registerFactory((c) => SavedViewController());
  }
}
