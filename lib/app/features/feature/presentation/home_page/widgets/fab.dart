import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/cubit_controller.dart';

class FAB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: () => null, child: const Icon(Icons.movie));
  }
}
