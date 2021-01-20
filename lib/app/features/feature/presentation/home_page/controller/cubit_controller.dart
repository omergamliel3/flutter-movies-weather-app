import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'state.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/network/network_info.dart';

class HomeViewController extends Cubit<HomeState> {
  HomeViewController(this.networkInfo) : super(const Initial());

  NetworkInfoI networkInfo;
}
