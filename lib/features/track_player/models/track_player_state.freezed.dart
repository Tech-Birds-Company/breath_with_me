// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'track_player_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TrackPlayerState {
  bool get isPaused => throw _privateConstructorUsedError;
  double get downloadProgress => throw _privateConstructorUsedError;
  int get currentTimeMs => throw _privateConstructorUsedError;
  int get totalMs => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TrackPlayerStateCopyWith<TrackPlayerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrackPlayerStateCopyWith<$Res> {
  factory $TrackPlayerStateCopyWith(
          TrackPlayerState value, $Res Function(TrackPlayerState) then) =
      _$TrackPlayerStateCopyWithImpl<$Res, TrackPlayerState>;
  @useResult
  $Res call(
      {bool isPaused, double downloadProgress, int currentTimeMs, int totalMs});
}

/// @nodoc
class _$TrackPlayerStateCopyWithImpl<$Res, $Val extends TrackPlayerState>
    implements $TrackPlayerStateCopyWith<$Res> {
  _$TrackPlayerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isPaused = null,
    Object? downloadProgress = null,
    Object? currentTimeMs = null,
    Object? totalMs = null,
  }) {
    return _then(_value.copyWith(
      isPaused: null == isPaused
          ? _value.isPaused
          : isPaused // ignore: cast_nullable_to_non_nullable
              as bool,
      downloadProgress: null == downloadProgress
          ? _value.downloadProgress
          : downloadProgress // ignore: cast_nullable_to_non_nullable
              as double,
      currentTimeMs: null == currentTimeMs
          ? _value.currentTimeMs
          : currentTimeMs // ignore: cast_nullable_to_non_nullable
              as int,
      totalMs: null == totalMs
          ? _value.totalMs
          : totalMs // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TrackPlayerStateImplCopyWith<$Res>
    implements $TrackPlayerStateCopyWith<$Res> {
  factory _$$TrackPlayerStateImplCopyWith(_$TrackPlayerStateImpl value,
          $Res Function(_$TrackPlayerStateImpl) then) =
      __$$TrackPlayerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isPaused, double downloadProgress, int currentTimeMs, int totalMs});
}

/// @nodoc
class __$$TrackPlayerStateImplCopyWithImpl<$Res>
    extends _$TrackPlayerStateCopyWithImpl<$Res, _$TrackPlayerStateImpl>
    implements _$$TrackPlayerStateImplCopyWith<$Res> {
  __$$TrackPlayerStateImplCopyWithImpl(_$TrackPlayerStateImpl _value,
      $Res Function(_$TrackPlayerStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isPaused = null,
    Object? downloadProgress = null,
    Object? currentTimeMs = null,
    Object? totalMs = null,
  }) {
    return _then(_$TrackPlayerStateImpl(
      isPaused: null == isPaused
          ? _value.isPaused
          : isPaused // ignore: cast_nullable_to_non_nullable
              as bool,
      downloadProgress: null == downloadProgress
          ? _value.downloadProgress
          : downloadProgress // ignore: cast_nullable_to_non_nullable
              as double,
      currentTimeMs: null == currentTimeMs
          ? _value.currentTimeMs
          : currentTimeMs // ignore: cast_nullable_to_non_nullable
              as int,
      totalMs: null == totalMs
          ? _value.totalMs
          : totalMs // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$TrackPlayerStateImpl implements _TrackPlayerState {
  const _$TrackPlayerStateImpl(
      {this.isPaused = true,
      this.downloadProgress = 0,
      this.currentTimeMs = 0,
      this.totalMs = 0});

  @override
  @JsonKey()
  final bool isPaused;
  @override
  @JsonKey()
  final double downloadProgress;
  @override
  @JsonKey()
  final int currentTimeMs;
  @override
  @JsonKey()
  final int totalMs;

  @override
  String toString() {
    return 'TrackPlayerState(isPaused: $isPaused, downloadProgress: $downloadProgress, currentTimeMs: $currentTimeMs, totalMs: $totalMs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrackPlayerStateImpl &&
            (identical(other.isPaused, isPaused) ||
                other.isPaused == isPaused) &&
            (identical(other.downloadProgress, downloadProgress) ||
                other.downloadProgress == downloadProgress) &&
            (identical(other.currentTimeMs, currentTimeMs) ||
                other.currentTimeMs == currentTimeMs) &&
            (identical(other.totalMs, totalMs) || other.totalMs == totalMs));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isPaused, downloadProgress, currentTimeMs, totalMs);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TrackPlayerStateImplCopyWith<_$TrackPlayerStateImpl> get copyWith =>
      __$$TrackPlayerStateImplCopyWithImpl<_$TrackPlayerStateImpl>(
          this, _$identity);
}

abstract class _TrackPlayerState implements TrackPlayerState {
  const factory _TrackPlayerState(
      {final bool isPaused,
      final double downloadProgress,
      final int currentTimeMs,
      final int totalMs}) = _$TrackPlayerStateImpl;

  @override
  bool get isPaused;
  @override
  double get downloadProgress;
  @override
  int get currentTimeMs;
  @override
  int get totalMs;
  @override
  @JsonKey(ignore: true)
  _$$TrackPlayerStateImplCopyWith<_$TrackPlayerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
