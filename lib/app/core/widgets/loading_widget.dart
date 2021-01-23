import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget();
  @override
  Widget build(BuildContext context) {
    return SpinKitFadingCircle(
      itemBuilder: (context, index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).accentColor,
          ),
        );
      },
    );
  }
}
