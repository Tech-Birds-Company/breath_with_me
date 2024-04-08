// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tracks_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TracksListState _$TracksListStateFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'data':
      return TracksListStateData.fromJson(json);
    case 'loading':
      return _TracksListStateLoading.fromJson(json);
    case 'error':
      return _TracksListStateError.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'TracksListState',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$TracksListState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Track> tracks, List<Track>? filteredTracks)
        data,
    required TResult Function() loading,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Track> tracks, List<Track>? filteredTracks)? data,
    TResult? Function()? loading,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Track> tracks, List<Track>? filteredTracks)? data,
    TResult Function()? loading,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TracksListStateData value) data,
    required TResult Function(_TracksListStateLoading value) loading,
    required TResult Function(_TracksListStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TracksListStateData value)? data,
    TResult? Function(_TracksListStateLoading value)? loading,
    TResult? Function(_TracksListStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TracksListStateData value)? data,
    TResult Function(_TracksListStateLoading value)? loading,
    TResult Function(_TracksListStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TracksListStateCopyWith<$Res> {
  factory $TracksListStateCopyWith(
          TracksListState value, $Res Function(TracksListState) then) =
      _$TracksListStateCopyWithImpl<$Res, TracksListState>;
}

/// @nodoc
class _$TracksListStateCopyWithImpl<$Res, $Val extends TracksListState>
    implements $TracksListStateCopyWith<$Res> {
  _$TracksListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$TracksListStateDataImplCopyWith<$Res> {
  factory _$$TracksListStateDataImplCopyWith(_$TracksListStateDataImpl value,
          $Res Function(_$TracksListStateDataImpl) then) =
      __$$TracksListStateDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Track> tracks, List<Track>? filteredTracks});
}

/// @nodoc
class __$$TracksListStateDataImplCopyWithImpl<$Res>
    extends _$TracksListStateCopyWithImpl<$Res, _$TracksListStateDataImpl>
    implements _$$TracksListStateDataImplCopyWith<$Res> {
  __$$TracksListStateDataImplCopyWithImpl(_$TracksListStateDataImpl _value,
      $Res Function(_$TracksListStateDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tracks = null,
    Object? filteredTracks = freezed,
  }) {
    return _then(_$TracksListStateDataImpl(
      null == tracks
          ? _value._tracks
          : tracks // ignore: cast_nullable_to_non_nullable
              as List<Track>,
      filteredTracks: freezed == filteredTracks
          ? _value._filteredTracks
          : filteredTracks // ignore: cast_nullable_to_non_nullable
              as List<Track>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TracksListStateDataImpl implements TracksListStateData {
  const _$TracksListStateDataImpl(final List<Track> tracks,
      {final List<Track>? filteredTracks, final String? $type})
      : _tracks = tracks,
        _filteredTracks = filteredTracks,
        $type = $type ?? 'data';

  factory _$TracksListStateDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$TracksListStateDataImplFromJson(json);

  final List<Track> _tracks;
  @override
  List<Track> get tracks {
    if (_tracks is EqualUnmodifiableListView) return _tracks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tracks);
  }

  final List<Track>? _filteredTracks;
  @override
  List<Track>? get filteredTracks {
    final value = _filteredTracks;
    if (value == null) return null;
    if (_filteredTracks is EqualUnmodifiableListView) return _filteredTracks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'TracksListState.data(tracks: $tracks, filteredTracks: $filteredTracks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TracksListStateDataImpl &&
            const DeepCollectionEquality().equals(other._tracks, _tracks) &&
            const DeepCollectionEquality()
                .equals(other._filteredTracks, _filteredTracks));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_tracks),
      const DeepCollectionEquality().hash(_filteredTracks));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TracksListStateDataImplCopyWith<_$TracksListStateDataImpl> get copyWith =>
      __$$TracksListStateDataImplCopyWithImpl<_$TracksListStateDataImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Track> tracks, List<Track>? filteredTracks)
        data,
    required TResult Function() loading,
    required TResult Function() error,
  }) {
    return data(tracks, filteredTracks);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Track> tracks, List<Track>? filteredTracks)? data,
    TResult? Function()? loading,
    TResult? Function()? error,
  }) {
    return data?.call(tracks, filteredTracks);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Track> tracks, List<Track>? filteredTracks)? data,
    TResult Function()? loading,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(tracks, filteredTracks);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TracksListStateData value) data,
    required TResult Function(_TracksListStateLoading value) loading,
    required TResult Function(_TracksListStateError value) error,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TracksListStateData value)? data,
    TResult? Function(_TracksListStateLoading value)? loading,
    TResult? Function(_TracksListStateError value)? error,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TracksListStateData value)? data,
    TResult Function(_TracksListStateLoading value)? loading,
    TResult Function(_TracksListStateError value)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$TracksListStateDataImplToJson(
      this,
    );
  }
}

abstract class TracksListStateData implements TracksListState {
  const factory TracksListStateData(final List<Track> tracks,
      {final List<Track>? filteredTracks}) = _$TracksListStateDataImpl;

  factory TracksListStateData.fromJson(Map<String, dynamic> json) =
      _$TracksListStateDataImpl.fromJson;

  List<Track> get tracks;
  List<Track>? get filteredTracks;
  @JsonKey(ignore: true)
  _$$TracksListStateDataImplCopyWith<_$TracksListStateDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TracksListStateLoadingImplCopyWith<$Res> {
  factory _$$TracksListStateLoadingImplCopyWith(
          _$TracksListStateLoadingImpl value,
          $Res Function(_$TracksListStateLoadingImpl) then) =
      __$$TracksListStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TracksListStateLoadingImplCopyWithImpl<$Res>
    extends _$TracksListStateCopyWithImpl<$Res, _$TracksListStateLoadingImpl>
    implements _$$TracksListStateLoadingImplCopyWith<$Res> {
  __$$TracksListStateLoadingImplCopyWithImpl(
      _$TracksListStateLoadingImpl _value,
      $Res Function(_$TracksListStateLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$TracksListStateLoadingImpl implements _TracksListStateLoading {
  const _$TracksListStateLoadingImpl({final String? $type})
      : $type = $type ?? 'loading';

  factory _$TracksListStateLoadingImpl.fromJson(Map<String, dynamic> json) =>
      _$$TracksListStateLoadingImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'TracksListState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TracksListStateLoadingImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Track> tracks, List<Track>? filteredTracks)
        data,
    required TResult Function() loading,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Track> tracks, List<Track>? filteredTracks)? data,
    TResult? Function()? loading,
    TResult? Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Track> tracks, List<Track>? filteredTracks)? data,
    TResult Function()? loading,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TracksListStateData value) data,
    required TResult Function(_TracksListStateLoading value) loading,
    required TResult Function(_TracksListStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TracksListStateData value)? data,
    TResult? Function(_TracksListStateLoading value)? loading,
    TResult? Function(_TracksListStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TracksListStateData value)? data,
    TResult Function(_TracksListStateLoading value)? loading,
    TResult Function(_TracksListStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$TracksListStateLoadingImplToJson(
      this,
    );
  }
}

abstract class _TracksListStateLoading implements TracksListState {
  const factory _TracksListStateLoading() = _$TracksListStateLoadingImpl;

  factory _TracksListStateLoading.fromJson(Map<String, dynamic> json) =
      _$TracksListStateLoadingImpl.fromJson;
}

/// @nodoc
abstract class _$$TracksListStateErrorImplCopyWith<$Res> {
  factory _$$TracksListStateErrorImplCopyWith(_$TracksListStateErrorImpl value,
          $Res Function(_$TracksListStateErrorImpl) then) =
      __$$TracksListStateErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TracksListStateErrorImplCopyWithImpl<$Res>
    extends _$TracksListStateCopyWithImpl<$Res, _$TracksListStateErrorImpl>
    implements _$$TracksListStateErrorImplCopyWith<$Res> {
  __$$TracksListStateErrorImplCopyWithImpl(_$TracksListStateErrorImpl _value,
      $Res Function(_$TracksListStateErrorImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$TracksListStateErrorImpl implements _TracksListStateError {
  const _$TracksListStateErrorImpl({final String? $type})
      : $type = $type ?? 'error';

  factory _$TracksListStateErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$TracksListStateErrorImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'TracksListState.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TracksListStateErrorImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Track> tracks, List<Track>? filteredTracks)
        data,
    required TResult Function() loading,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Track> tracks, List<Track>? filteredTracks)? data,
    TResult? Function()? loading,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Track> tracks, List<Track>? filteredTracks)? data,
    TResult Function()? loading,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TracksListStateData value) data,
    required TResult Function(_TracksListStateLoading value) loading,
    required TResult Function(_TracksListStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TracksListStateData value)? data,
    TResult? Function(_TracksListStateLoading value)? loading,
    TResult? Function(_TracksListStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TracksListStateData value)? data,
    TResult Function(_TracksListStateLoading value)? loading,
    TResult Function(_TracksListStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$TracksListStateErrorImplToJson(
      this,
    );
  }
}

abstract class _TracksListStateError implements TracksListState {
  const factory _TracksListStateError() = _$TracksListStateErrorImpl;

  factory _TracksListStateError.fromJson(Map<String, dynamic> json) =
      _$TracksListStateErrorImpl.fromJson;
}
