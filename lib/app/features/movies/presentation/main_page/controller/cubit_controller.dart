import 'package:flutter_bloc/flutter_bloc.dart';

import 'index.dart';
import 'state.dart';

const HOME_PAGE_INDEX = 0;

class MainViewController extends Cubit<MainState> {
  MainViewController() : super(const IndexState(HOME_PAGE_INDEX));

  void setPageIndex(int index) {
    emit(IndexState(index));
  }
}
