import 'package:connectivity/connectivity.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:prospera_exercise/app/core/network/network_info.dart';
import 'package:prospera_exercise/app/features/movie/domain/usecases/get_remote_movie.dart';
import 'package:prospera_exercise/app/features/presentation/home_page/controller/cubit_controller.dart';
import 'package:prospera_exercise/app/features/presentation/home_page/controller/state.dart';

class MockNetworkInfo extends Mock implements NetworkInfoI {}

class MockGetRemoteMovie extends Mock implements GetRemoteMovie {}

void main() {
  NetworkInfoI networkInfo;
  GetRemoteMovie getRemoteMovie;
  HomeViewController cubitController;

  setUp(() {
    networkInfo = MockNetworkInfo();
    getRemoteMovie = MockGetRemoteMovie();
    cubitController = HomeViewController(networkInfo, getRemoteMovie);
  });
  group('is online', () {
    blocTest<HomeViewController, HomeState>(
      'should emits [Loading, Success] when cubit.checkConnectivity is called succesfuly.',
      build: () {
        when(networkInfo.isConnected())
            .thenAnswer((realInvocation) => Future.value(true));
        when(networkInfo.connectivityResult).thenAnswer(
            (realInvocation) => Future.value(ConnectivityResult.wifi));
        return cubitController;
      },
      act: (cubit) => null,
      expect: [isA<Loading>(), isA<Success>()],
      verify: (_) {
        verifyInOrder(
            [networkInfo.isConnected(), networkInfo.connectivityResult]);
        verifyNoMoreInteractions(networkInfo);
      },
    );
  });

  group('is offline', () {
    blocTest<HomeViewController, HomeState>(
      'should emits [Loading, Error] when cubit.checkConnectivity is called unsuccesfuly.',
      build: () {
        when(networkInfo.isConnected())
            .thenAnswer((realInvocation) => Future.value(false));
        when(networkInfo.connectivityResult).thenAnswer(
            (realInvocation) => Future.value(ConnectivityResult.none));
        when(networkInfo.onConnectivityChanged).thenAnswer(
            (realInvocation) => Stream.fromIterable([ConnectivityResult.none]));
        return cubitController;
      },
      act: (cubit) => null,
      expect: [isA<Loading>(), isA<Error>()],
      verify: (_) {
        verifyInOrder([
          networkInfo.isConnected(),
          networkInfo.connectivityResult,
          networkInfo.onConnectivityChanged
        ]);
        verifyNoMoreInteractions(networkInfo);
      },
    );
  });
}
