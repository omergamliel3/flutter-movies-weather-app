import 'package:flutter/foundation.dart';
import 'package:prospera_exercise/app/core/errors/failure.dart';
import 'package:prospera_exercise/app/features/movie/domain/entities/movie.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState.initial() = Initial;
  const factory HomeState.loading() = Loading;
  const factory HomeState.success(List<Movie> movie) = Success;
  const factory HomeState.error(Failure failure) = Error;
}
