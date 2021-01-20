import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Movie extends Equatable {
  final String title;
  final String year;
  final String rated;
  final String released;
  final String runtime;
  final String genre;
  final String director;
  final String writer;
  final String actors;
  final String plot;
  final String language;
  final String country;
  final String poster;
  final List<dynamic> ratings;
  const Movie({
    @required this.title,
    @required this.year,
    @required this.rated,
    @required this.released,
    @required this.runtime,
    @required this.genre,
    @required this.director,
    @required this.writer,
    @required this.actors,
    @required this.plot,
    @required this.language,
    @required this.country,
    @required this.poster,
    @required this.ratings,
  });

  @override
  List<Object> get props => [
        title,
        year,
        rated,
        released,
        runtime,
        genre,
        director,
        writer,
        actors,
        plot,
        language,
        country,
        poster,
        ratings,
      ];
}
