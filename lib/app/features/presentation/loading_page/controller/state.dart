import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:prospera_exercise/app/core/errors/failure.dart';

part 'state.freezed.dart';

@freezed
abstract class LoadingState with _$LoadingState {
  const factory LoadingState.loading() = Loading;
  const factory LoadingState.error(Failure failure) = Error;
}
