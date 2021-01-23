// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieModel _$MovieModelFromJson(Map<String, dynamic> json) {
  return MovieModel(
    title: json['Title'] as String,
    year: json['Year'] as String,
    rated: json['Rated'] as String,
    released: json['Released'] as String,
    runtime: json['Runtime'] as String,
    genre: json['Genre'] as String,
    director: json['Director'] as String,
    writer: json['Writer'] as String,
    actors: json['Actors'] as String,
    plot: json['Plot'] as String,
    language: json['Language'] as String,
    country: json['Country'] as String,
    poster: json['Poster'] as String,
    ratings: json['Ratings'] as List,
  );
}

Map<String, dynamic> _$MovieModelToJson(MovieModel instance) =>
    <String, dynamic>{
      'Title': instance.title,
      'Year': instance.year,
      'Rated': instance.rated,
      'Released': instance.released,
      'Runtime': instance.runtime,
      'Genre': instance.genre,
      'Director': instance.director,
      'Writer': instance.writer,
      'Actors': instance.actors,
      'Plot': instance.plot,
      'Language': instance.language,
      'Country': instance.country,
      'Poster': instance.poster,
      'Ratings': instance.ratings,
    };
