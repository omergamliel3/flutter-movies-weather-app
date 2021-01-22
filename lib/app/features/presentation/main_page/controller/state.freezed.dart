// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$MainStateTearOff {
  const _$MainStateTearOff();

// ignore: unused_element
  IndexState indexState(int index) {
    return IndexState(
      index,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $MainState = _$MainStateTearOff();

/// @nodoc
mixin _$MainState {
  int get index;

  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult indexState(int index),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult indexState(int index),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult indexState(IndexState value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult indexState(IndexState value),
    @required TResult orElse(),
  });

  @JsonKey(ignore: true)
  $MainStateCopyWith<MainState> get copyWith;
}

/// @nodoc
abstract class $MainStateCopyWith<$Res> {
  factory $MainStateCopyWith(MainState value, $Res Function(MainState) then) =
      _$MainStateCopyWithImpl<$Res>;
  $Res call({int index});
}

/// @nodoc
class _$MainStateCopyWithImpl<$Res> implements $MainStateCopyWith<$Res> {
  _$MainStateCopyWithImpl(this._value, this._then);

  final MainState _value;
  // ignore: unused_field
  final $Res Function(MainState) _then;

  @override
  $Res call({
    Object index = freezed,
  }) {
    return _then(_value.copyWith(
      index: index == freezed ? _value.index : index as int,
    ));
  }
}

/// @nodoc
abstract class $IndexStateCopyWith<$Res> implements $MainStateCopyWith<$Res> {
  factory $IndexStateCopyWith(
          IndexState value, $Res Function(IndexState) then) =
      _$IndexStateCopyWithImpl<$Res>;
  @override
  $Res call({int index});
}

/// @nodoc
class _$IndexStateCopyWithImpl<$Res> extends _$MainStateCopyWithImpl<$Res>
    implements $IndexStateCopyWith<$Res> {
  _$IndexStateCopyWithImpl(IndexState _value, $Res Function(IndexState) _then)
      : super(_value, (v) => _then(v as IndexState));

  @override
  IndexState get _value => super._value as IndexState;

  @override
  $Res call({
    Object index = freezed,
  }) {
    return _then(IndexState(
      index == freezed ? _value.index : index as int,
    ));
  }
}

/// @nodoc
class _$IndexState with DiagnosticableTreeMixin implements IndexState {
  const _$IndexState(this.index) : assert(index != null);

  @override
  final int index;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MainState.indexState(index: $index)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MainState.indexState'))
      ..add(DiagnosticsProperty('index', index));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is IndexState &&
            (identical(other.index, index) ||
                const DeepCollectionEquality().equals(other.index, index)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(index);

  @JsonKey(ignore: true)
  @override
  $IndexStateCopyWith<IndexState> get copyWith =>
      _$IndexStateCopyWithImpl<IndexState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult indexState(int index),
  }) {
    assert(indexState != null);
    return indexState(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult indexState(int index),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (indexState != null) {
      return indexState(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult indexState(IndexState value),
  }) {
    assert(indexState != null);
    return indexState(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult indexState(IndexState value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (indexState != null) {
      return indexState(this);
    }
    return orElse();
  }
}

abstract class IndexState implements MainState {
  const factory IndexState(int index) = _$IndexState;

  @override
  int get index;
  @override
  @JsonKey(ignore: true)
  $IndexStateCopyWith<IndexState> get copyWith;
}
