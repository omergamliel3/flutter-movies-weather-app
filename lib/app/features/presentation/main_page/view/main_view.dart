import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:prospera_exercise/di/injector.dart';

import 'package:prospera_exercise/localization/app_localizations.dart';

import '../controller/index.dart';
import '../widgets/widgets.dart';

import '../../index.dart';

class MainView extends StatelessWidget {
  final _pageController = PageController();
  final _pages = <Widget>[HomeView(), WeatherView()];

  PreferredSizeWidget appBar(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          const Icon(Icons.movie),
          const SizedBox(
            width: 10.0,
          ),
          Text(AppLocalizations.of(context).translate(APP_TITLE))
        ],
      ),
      actions: [
        IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => showSearch(
                  context: context,
                  delegate: null,
                )),
        const SizedBox(
          width: 10.0,
        ),
      ],
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
