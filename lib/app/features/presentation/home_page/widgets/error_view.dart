import 'package:flutter/material.dart';

import 'package:prospera_exercise/app/core/errors/failure.dart';

class ErrorView extends StatelessWidget {
  final Failure failure;
  const ErrorView(this.failure);
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          failure.message,
          style: const TextStyle(fontSize: 30),
        ),
        const SizedBox(
          height: 20,
        ),
        const Icon(
          Icons.wifi_off,
          size: 40,
        ),
      ],
    ));
  }
}
