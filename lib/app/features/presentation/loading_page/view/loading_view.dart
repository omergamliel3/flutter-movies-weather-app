import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:prospera_exercise/app/core/widgets/index.dart';

import 'package:prospera_exercise/di/injector.dart';

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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.movie,
                  size: 50,
                ),
                SizedBox(width: 15.0),
                Text(
                  'Prospera',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                )
              ],
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
