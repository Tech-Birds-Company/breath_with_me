// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'practice_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PracticeListState _$PracticeListStateFromJson(Map<String, dynamic> json) {
  return _PracticeListState.fromJson(json);
}

/// @nodoc
mixin _$PracticeListState {
  List<Track> get tracks => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PracticeListStateCopyWith<PracticeListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PracticeListStateCopyWith<$Res> {
  factory $PracticeListStateCopyWith(
          PracticeListState value, $Res Function(PracticeListState) then) =
      _$PracticeListStateCopyWithImpl<$Res, PracticeListState>;
  @useResult
  $Res call({List<Track> tracks});
}

/// @nodoc
class _$PracticeListStateCopyWithImpl<$Res, $Val extends PracticeListState>
    implements $PracticeListStateCopyWith<$Res> {
  _$PracticeListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tracks = null,
  }) {
    return _then(_value.copyWith(
      tracks: null == tracks
          ? _value.tracks
          : tracks // ignore: cast_nullable_to_non_nullable
              as List<Track>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PracticeListStateImplCopyWith<$Res>
    implements $PracticeListStateCopyWith<$Res> {
  factory _$$PracticeListStateImplCopyWith(_$PracticeListStateImpl value,
          $Res Function(_$PracticeListStateImpl) then) =
      __$$PracticeListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Track> tracks});
}

/// @nodoc
class __$$PracticeListStateImplCopyWithImpl<$Res>
    extends _$PracticeListStateCopyWithImpl<$Res, _$PracticeListStateImpl>
    implements _$$PracticeListStateImplCopyWith<$Res> {
  __$$PracticeListStateImplCopyWithImpl(_$PracticeListStateImpl _value,
      $Res Function(_$PracticeListStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tracks = null,
  }) {
    return _then(_$PracticeListStateImpl(
      tracks: null == tracks
          ? _value._tracks
          : tracks // ignore: cast_nullable_to_non_nullable
              as List<Track>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PracticeListStateImpl implements _PracticeListState {
  const _$PracticeListStateImpl({final List<Track> tracks = const []})
      : _tracks = tracks;

  factory _$PracticeListStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$PracticeListStateImplFromJson(json);

  final List<Track> _tracks;
  @override
  @JsonKey()
  List<Track> get tracks {
    if (_tracks is EqualUnmodifiableListView) return _tracks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tracks);
  }

  @override
  String toString() {
    return 'PracticeListState(tracks: $tracks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PracticeListStateImpl &&
            const DeepCollectionEquality().equals(other._tracks, _tracks));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_tracks));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PracticeListStateImplCopyWith<_$PracticeListStateImpl> get copyWith =>
      __$$PracticeListStateImplCopyWithImpl<_$PracticeListStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PracticeListStateImplToJson(
      this,
    );
  }
}

abstract class _PracticeListState implements PracticeListState {
  const factory _PracticeListState({final List<Track> tracks}) =
      _$PracticeListStateImpl;

  factory _PracticeListState.fromJson(Map<String, dynamic> json) =
      _$PracticeListStateImpl.fromJson;

  @override
  List<Track> get tracks;
  @override
  @JsonKey(ignore: true)
  _$$PracticeListStateImplCopyWith<_$PracticeListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
