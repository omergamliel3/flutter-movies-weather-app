import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:prospera_exercise/app/core/widgets/index.dart';

import 'package:prospera_exercise/di/injector.dart';

import 'package:prospera_exercise/localization/app_localizations.dart';

import '../controller/index.dart';

class LoadingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => Injector.resolve<LoadingViewController>()..loadAppData(),
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context).translate(LOADING),
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(height: 40.0),
            BlocBuilder<LoadingViewController, LoadingState>(
              builder: (context, state) {
                return state.when(
                  loading: () => const LoadingWidget(),
                  error: (failure) => Text(
                    failure.message,
                    textAlign: TextAlign.center,
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
