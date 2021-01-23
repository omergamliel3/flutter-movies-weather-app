import 'package:flutter/material.dart';

import 'package:prospera_exercise/app/core/widgets/index.dart';
import 'package:prospera_exercise/app/features/movie/domain/entities/movie.dart';

class MovieView extends StatelessWidget {
  final List<Movie> movies;
  const MovieView(this.movies);

  Widget seperator() {
    return const Text('  \u{2022}  ',
        style: TextStyle(fontWeight: FontWeight.bold));
  }

  Widget buildMovieCard(Movie movie) {
    const bold = TextStyle(fontWeight: FontWeight.bold);
    return Card(
      elevation: 4.0,
      child: Column(
        children: [
          ImageHandlerWidget(urlToImage: movie.poster),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  movie.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                FittedBox(
                  fit: BoxFit.cover,
                  child: Row(
                    children: [
                      Text(
                        movie.genre,
                        style: bold,
                      ),
                      seperator(),
                      Text(
                        movie.year,
                        style: bold,
                      ),
                      seperator(),
                      Text(
                        movie.runtime,
                        style: bold,
                      ),
                      seperator(),
                      Text(
                        movie.language,
                        style: bold,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                FittedBox(
                  fit: BoxFit.cover,
                  child: Row(
                    children: [
                      const Text(
                        'Starring: ',
                        style: bold,
                      ),
                      Text(
                        movie.actors,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    const Text(
                      'Creator: ',
                      style: bold,
                    ),
                    Text(
                      movie.director,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  movie.plot,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                    alignment: Alignment.topRight,
                    padding: const EdgeInsets.only(right: 10),
                    child: const Icon(Icons.favorite_border)),
                const SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Container(
        //   padding: const EdgeInsets.symmetric(vertical: 4.0),
        //   alignment: Alignment.center,
        //   child: const Text(
        //     'IMDB TOP RATED MOVIES',
        //     style: TextStyle(fontWeight: FontWeight.normal, fontSize: 23),
        //   ),
        // ),
        Expanded(
            child: ListView.builder(
          padding: const EdgeInsets.all(4.0),
          itemCount: movies.length,
          itemBuilder: (context, index) {
            return KeepAliveWrapper(child: buildMovieCard(movies[index]));
          },
        ))
      ],
    );
  }
}
