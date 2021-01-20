import 'package:flutter/material.dart';

import '../../../domain/entities/movie.dart';

import '../../../../../core/widgets/index.dart';

class MovieView extends StatelessWidget {
  final Movie movie;
  const MovieView(this.movie);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Column(
        children: [
          Expanded(
              flex: 2, child: ImageHandlerWidget(urlToImage: movie.poster)),
          Expanded(
            child: Column(
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                Text(movie.title),
                const SizedBox(
                  height: 10.0,
                ),
                Text(movie.year),
                const SizedBox(
                  height: 10.0,
                ),
                Text(movie.actors),
                const SizedBox(
                  height: 10.0,
                ),
                Text(movie.genre),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
