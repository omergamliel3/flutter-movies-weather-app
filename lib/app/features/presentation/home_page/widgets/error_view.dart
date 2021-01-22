import 'package:flutter/material.dart';

import 'package:prospera_exercise/app/core/errors/failure.dart';

import 'widgets.dart';

class ErrorView extends StatelessWidget {
  final Failure failure;
  const ErrorView(this.failure);
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(failure.message),
        const SizedBox(
          height: 30,
        ),
        const InitialView(),
      ],
    ));
  }
}
