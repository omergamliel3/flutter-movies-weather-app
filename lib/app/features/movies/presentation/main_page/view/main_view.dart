import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:prospera_exercise/di/injector.dart';

import '../../../../../../localization/app_localizations.dart';

import '../controller/index.dart';
import '../widgets/widgets.dart';

import '../../index.dart';

class MainView extends StatelessWidget {
  final _pageController = PageController();
  final _pages = <Widget>[HomeView(), SearchView(), SavedView()];

  PreferredSizeWidget appBar(BuildContext context) {
    return AppBar(
      title: Text(AppLocalizations.of(context).translate(APP_TITLE)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: BlocProvider(
        create: (_) => Injector.resolve<MainViewController>(),
        child: Builder(
          builder: (context) => Scaffold(
              appBar: appBar(context),
              bottomNavigationBar: NavBar(_pageController),
              body: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                children: _pages,
              )),
        ),
      ),
    );
  }
}
