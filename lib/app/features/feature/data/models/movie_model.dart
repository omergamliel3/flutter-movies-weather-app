import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/movie.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class MovieModel extends Movie {
  const MovieModel({
    @required String title,
    @required String year,
    @required String rated,
    @required String released,
    @required String runtime,
    @required String genre,
    @required String director,
    @required String writer,
    @required String actors,
    @required String plot,
    @required String language,
    @required String country,
    @required String poster,
    @required List<dynamic> ratings,
  }) : super(
          title: title,
          year: year,
          rated: rated,
          released: released,
          runtime: runtime,
          genre: genre,
          director: director,
          writer: writer,
          actors: actors,
          plot: plot,
          language: language,
          country: country,
          poster: poster,
          ratings: ratings,
        );

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);
  Map<String, dynamic> toJson() => _$MovieModelToJson(this);
}
