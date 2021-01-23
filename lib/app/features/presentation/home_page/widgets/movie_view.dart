import 'package:flutter/material.dart';

import 'package:prospera_exercise/app/core/widgets/index.dart';
import 'package:prospera_exercise/app/features/movie/domain/entities/movie.dart';

class MovieView extends StatelessWidget {
  final List<Movie> movies;
  const MovieView(this.movies);

  Widget buildMovieCard(Movie movie) {
    return Card(
      elevation: 4.0,
      child: Column(
        children: [
          ImageHandlerWidget(urlToImage: movie.poster),
          Column(
            children: [
              const SizedBox(
                height: 10.0,
              ),
              Text(
                movie.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
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
              const SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(4.0),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return KeepAliveWrapper(child: buildMovieCard(movies[index]));
      },
    );
  }
}
