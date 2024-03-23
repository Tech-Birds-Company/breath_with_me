// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'streak_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StreakState _$StreakStateFromJson(Map<String, dynamic> json) {
  return _StreakState.fromJson(json);
}

/// @nodoc
mixin _$StreakState {
  StreakProgressV2 get progress => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StreakStateCopyWith<StreakState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StreakStateCopyWith<$Res> {
  factory $StreakStateCopyWith(
          StreakState value, $Res Function(StreakState) then) =
      _$StreakStateCopyWithImpl<$Res, StreakState>;
  @useResult
  $Res call({StreakProgressV2 progress});

  $StreakProgressV2CopyWith<$Res> get progress;
}

/// @nodoc
class _$StreakStateCopyWithImpl<$Res, $Val extends StreakState>
    implements $StreakStateCopyWith<$Res> {
  _$StreakStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? progress = null,
  }) {
    return _then(_value.copyWith(
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as StreakProgressV2,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StreakProgressV2CopyWith<$Res> get progress {
    return $StreakProgressV2CopyWith<$Res>(_value.progress, (value) {
      return _then(_value.copyWith(progress: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StreakStateImplCopyWith<$Res>
    implements $StreakStateCopyWith<$Res> {
  factory _$$StreakStateImplCopyWith(
          _$StreakStateImpl value, $Res Function(_$StreakStateImpl) then) =
      __$$StreakStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({StreakProgressV2 progress});

  @override
  $StreakProgressV2CopyWith<$Res> get progress;
}

/// @nodoc
class __$$StreakStateImplCopyWithImpl<$Res>
    extends _$StreakStateCopyWithImpl<$Res, _$StreakStateImpl>
    implements _$$StreakStateImplCopyWith<$Res> {
  __$$StreakStateImplCopyWithImpl(
      _$StreakStateImpl _value, $Res Function(_$StreakStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? progress = null,
  }) {
    return _then(_$StreakStateImpl(
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as StreakProgressV2,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StreakStateImpl implements _StreakState {
  const _$StreakStateImpl({this.progress = const StreakProgressV2()});

  factory _$StreakStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$StreakStateImplFromJson(json);

  @override
  @JsonKey()
  final StreakProgressV2 progress;

  @override
  String toString() {
    return 'StreakState(progress: $progress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StreakStateImpl &&
            (identical(other.progress, progress) ||
                other.progress == progress));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, progress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StreakStateImplCopyWith<_$StreakStateImpl> get copyWith =>
      __$$StreakStateImplCopyWithImpl<_$StreakStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StreakStateImplToJson(
      this,
    );
  }
}

abstract class _StreakState implements StreakState {
  const factory _StreakState({final StreakProgressV2 progress}) =
      _$StreakStateImpl;

  factory _StreakState.fromJson(Map<String, dynamic> json) =
      _$StreakStateImpl.fromJson;

  @override
  StreakProgressV2 get progress;
  @override
  @JsonKey(ignore: true)
  _$$StreakStateImplCopyWith<_$StreakStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
