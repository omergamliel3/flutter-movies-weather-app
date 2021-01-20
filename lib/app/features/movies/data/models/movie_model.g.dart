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
      'title': instance.title,
      'year': instance.year,
      'rated': instance.rated,
      'released': instance.released,
      'runtime': instance.runtime,
      'genre': instance.genre,
      'director': instance.director,
      'writer': instance.writer,
      'actors': instance.actors,
      'plot': instance.plot,
      'language': instance.language,
      'country': instance.country,
      'poster': instance.poster,
      'ratings': instance.ratings,
    };
