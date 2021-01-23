import 'package:flutter/material.dart';
import 'package:prospera_exercise/app/core/errors/failure.dart';

class ErrorView extends StatelessWidget {
  final Failure failure;
  const ErrorView(this.failure);
  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontSize: 25);
    return Center(
      child: Text(
        failure.message,
        style: style,
      ),
    );
  }
}
