// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tracks_filters_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TracksFiltersState {
  bool get likedTracksOnly => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TracksFiltersStateCopyWith<TracksFiltersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TracksFiltersStateCopyWith<$Res> {
  factory $TracksFiltersStateCopyWith(
          TracksFiltersState value, $Res Function(TracksFiltersState) then) =
      _$TracksFiltersStateCopyWithImpl<$Res, TracksFiltersState>;
  @useResult
  $Res call({bool likedTracksOnly});
}

/// @nodoc
class _$TracksFiltersStateCopyWithImpl<$Res, $Val extends TracksFiltersState>
    implements $TracksFiltersStateCopyWith<$Res> {
  _$TracksFiltersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? likedTracksOnly = null,
  }) {
    return _then(_value.copyWith(
      likedTracksOnly: null == likedTracksOnly
          ? _value.likedTracksOnly
          : likedTracksOnly // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TracksFiltersStateImplCopyWith<$Res>
    implements $TracksFiltersStateCopyWith<$Res> {
  factory _$$TracksFiltersStateImplCopyWith(_$TracksFiltersStateImpl value,
          $Res Function(_$TracksFiltersStateImpl) then) =
      __$$TracksFiltersStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool likedTracksOnly});
}

/// @nodoc
class __$$TracksFiltersStateImplCopyWithImpl<$Res>
    extends _$TracksFiltersStateCopyWithImpl<$Res, _$TracksFiltersStateImpl>
    implements _$$TracksFiltersStateImplCopyWith<$Res> {
  __$$TracksFiltersStateImplCopyWithImpl(_$TracksFiltersStateImpl _value,
      $Res Function(_$TracksFiltersStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? likedTracksOnly = null,
  }) {
    return _then(_$TracksFiltersStateImpl(
      likedTracksOnly: null == likedTracksOnly
          ? _value.likedTracksOnly
          : likedTracksOnly // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$TracksFiltersStateImpl implements _TracksFiltersState {
  const _$TracksFiltersStateImpl({this.likedTracksOnly = false});

  @override
  @JsonKey()
  final bool likedTracksOnly;

  @override
  String toString() {
    return 'TracksFiltersState(likedTracksOnly: $likedTracksOnly)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TracksFiltersStateImpl &&
            (identical(other.likedTracksOnly, likedTracksOnly) ||
                other.likedTracksOnly == likedTracksOnly));
  }

  @override
  int get hashCode => Object.hash(runtimeType, likedTracksOnly);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TracksFiltersStateImplCopyWith<_$TracksFiltersStateImpl> get copyWith =>
      __$$TracksFiltersStateImplCopyWithImpl<_$TracksFiltersStateImpl>(
          this, _$identity);
}

abstract class _TracksFiltersState implements TracksFiltersState {
  const factory _TracksFiltersState({final bool likedTracksOnly}) =
      _$TracksFiltersStateImpl;

  @override
  bool get likedTracksOnly;
  @override
  @JsonKey(ignore: true)
  _$$TracksFiltersStateImplCopyWith<_$TracksFiltersStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
