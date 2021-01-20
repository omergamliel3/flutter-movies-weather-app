import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:prospera_exercise/di/injector.dart';
import 'package:prospera_exercise/localization/app_localizations.dart';

import '../controller/index.dart';

import '../widgets/widgets.dart';

class HomeView extends StatelessWidget {
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
        create: (_) => Injector.resolve<HomeViewController>(),
        child: Scaffold(
          appBar: appBar(context),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Center(
                child: Text(
                  'HOME PAGE',
                ),
              )
            ],
          ),
          floatingActionButton: FAB(),
        ),
      ),
    );
  }
}
