import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/index.dart';

class FAB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => BlocProvider.of<HomeViewController>(context).getMovies(),
      child: const Icon(Icons.refresh_sharp),
    );
  }
}
