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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TrackPlayerState _$TrackPlayerStateFromJson(Map<String, dynamic> json) {
  return _TrackPlayerState.fromJson(json);
}

/// @nodoc
mixin _$TrackPlayerState {
  bool get isPaused => throw _privateConstructorUsedError;
  double? get progress => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
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
  $Res call({bool isPaused, double? progress});
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
    Object? progress = freezed,
  }) {
    return _then(_value.copyWith(
      isPaused: null == isPaused
          ? _value.isPaused
          : isPaused // ignore: cast_nullable_to_non_nullable
              as bool,
      progress: freezed == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double?,
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
  $Res call({bool isPaused, double? progress});
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
    Object? progress = freezed,
  }) {
    return _then(_$TrackPlayerStateImpl(
      isPaused: null == isPaused
          ? _value.isPaused
          : isPaused // ignore: cast_nullable_to_non_nullable
              as bool,
      progress: freezed == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TrackPlayerStateImpl implements _TrackPlayerState {
  const _$TrackPlayerStateImpl({this.isPaused = true, this.progress});

  factory _$TrackPlayerStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$TrackPlayerStateImplFromJson(json);

  @override
  @JsonKey()
  final bool isPaused;
  @override
  final double? progress;

  @override
  String toString() {
    return 'TrackPlayerState(isPaused: $isPaused, progress: $progress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrackPlayerStateImpl &&
            (identical(other.isPaused, isPaused) ||
                other.isPaused == isPaused) &&
            (identical(other.progress, progress) ||
                other.progress == progress));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isPaused, progress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TrackPlayerStateImplCopyWith<_$TrackPlayerStateImpl> get copyWith =>
      __$$TrackPlayerStateImplCopyWithImpl<_$TrackPlayerStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TrackPlayerStateImplToJson(
      this,
    );
  }
}

abstract class _TrackPlayerState implements TrackPlayerState {
  const factory _TrackPlayerState(
      {final bool isPaused, final double? progress}) = _$TrackPlayerStateImpl;

  factory _TrackPlayerState.fromJson(Map<String, dynamic> json) =
      _$TrackPlayerStateImpl.fromJson;

  @override
  bool get isPaused;
  @override
  double? get progress;
  @override
  @JsonKey(ignore: true)
  _$$TrackPlayerStateImplCopyWith<_$TrackPlayerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
