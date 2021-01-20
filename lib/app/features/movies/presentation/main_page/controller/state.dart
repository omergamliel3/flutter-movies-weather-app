import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
abstract class MainState with _$MainState {
  const factory MainState.indexState(int index) = IndexState;
}
