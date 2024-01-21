// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'streaks_progress.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StreaksProgress _$StreaksProgressFromJson(Map<String, dynamic> json) {
  return _StreaksProgress.fromJson(json);
}

/// @nodoc
mixin _$StreaksProgress {
  int get livesCount => throw _privateConstructorUsedError;
  DateTime get livesExpireTimestamp => throw _privateConstructorUsedError;
  int get minutesCount => throw _privateConstructorUsedError;
  int get practicesCount => throw _privateConstructorUsedError;
  List<DateTime> get timeline => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StreaksProgressCopyWith<StreaksProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StreaksProgressCopyWith<$Res> {
  factory $StreaksProgressCopyWith(
          StreaksProgress value, $Res Function(StreaksProgress) then) =
      _$StreaksProgressCopyWithImpl<$Res, StreaksProgress>;
  @useResult
  $Res call(
      {int livesCount,
      DateTime livesExpireTimestamp,
      int minutesCount,
      int practicesCount,
      List<DateTime> timeline});
}

/// @nodoc
class _$StreaksProgressCopyWithImpl<$Res, $Val extends StreaksProgress>
    implements $StreaksProgressCopyWith<$Res> {
  _$StreaksProgressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? livesCount = null,
    Object? livesExpireTimestamp = null,
    Object? minutesCount = null,
    Object? practicesCount = null,
    Object? timeline = null,
  }) {
    return _then(_value.copyWith(
      livesCount: null == livesCount
          ? _value.livesCount
          : livesCount // ignore: cast_nullable_to_non_nullable
              as int,
      livesExpireTimestamp: null == livesExpireTimestamp
          ? _value.livesExpireTimestamp
          : livesExpireTimestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      minutesCount: null == minutesCount
          ? _value.minutesCount
          : minutesCount // ignore: cast_nullable_to_non_nullable
              as int,
      practicesCount: null == practicesCount
          ? _value.practicesCount
          : practicesCount // ignore: cast_nullable_to_non_nullable
              as int,
      timeline: null == timeline
          ? _value.timeline
          : timeline // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StreaksProgressImplCopyWith<$Res>
    implements $StreaksProgressCopyWith<$Res> {
  factory _$$StreaksProgressImplCopyWith(_$StreaksProgressImpl value,
          $Res Function(_$StreaksProgressImpl) then) =
      __$$StreaksProgressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int livesCount,
      DateTime livesExpireTimestamp,
      int minutesCount,
      int practicesCount,
      List<DateTime> timeline});
}

/// @nodoc
class __$$StreaksProgressImplCopyWithImpl<$Res>
    extends _$StreaksProgressCopyWithImpl<$Res, _$StreaksProgressImpl>
    implements _$$StreaksProgressImplCopyWith<$Res> {
  __$$StreaksProgressImplCopyWithImpl(
      _$StreaksProgressImpl _value, $Res Function(_$StreaksProgressImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? livesCount = null,
    Object? livesExpireTimestamp = null,
    Object? minutesCount = null,
    Object? practicesCount = null,
    Object? timeline = null,
  }) {
    return _then(_$StreaksProgressImpl(
      livesCount: null == livesCount
          ? _value.livesCount
          : livesCount // ignore: cast_nullable_to_non_nullable
              as int,
      livesExpireTimestamp: null == livesExpireTimestamp
          ? _value.livesExpireTimestamp
          : livesExpireTimestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      minutesCount: null == minutesCount
          ? _value.minutesCount
          : minutesCount // ignore: cast_nullable_to_non_nullable
              as int,
      practicesCount: null == practicesCount
          ? _value.practicesCount
          : practicesCount // ignore: cast_nullable_to_non_nullable
              as int,
      timeline: null == timeline
          ? _value._timeline
          : timeline // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StreaksProgressImpl extends _StreaksProgress {
  const _$StreaksProgressImpl(
      {required this.livesCount,
      required this.livesExpireTimestamp,
      required this.minutesCount,
      required this.practicesCount,
      required final List<DateTime> timeline})
      : _timeline = timeline,
        super._();

  factory _$StreaksProgressImpl.fromJson(Map<String, dynamic> json) =>
      _$$StreaksProgressImplFromJson(json);

  @override
  final int livesCount;
  @override
  final DateTime livesExpireTimestamp;
  @override
  final int minutesCount;
  @override
  final int practicesCount;
  final List<DateTime> _timeline;
  @override
  List<DateTime> get timeline {
    if (_timeline is EqualUnmodifiableListView) return _timeline;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_timeline);
  }

  @override
  String toString() {
    return 'StreaksProgress(livesCount: $livesCount, livesExpireTimestamp: $livesExpireTimestamp, minutesCount: $minutesCount, practicesCount: $practicesCount, timeline: $timeline)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StreaksProgressImpl &&
            (identical(other.livesCount, livesCount) ||
                other.livesCount == livesCount) &&
            (identical(other.livesExpireTimestamp, livesExpireTimestamp) ||
                other.livesExpireTimestamp == livesExpireTimestamp) &&
            (identical(other.minutesCount, minutesCount) ||
                other.minutesCount == minutesCount) &&
            (identical(other.practicesCount, practicesCount) ||
                other.practicesCount == practicesCount) &&
            const DeepCollectionEquality().equals(other._timeline, _timeline));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      livesCount,
      livesExpireTimestamp,
      minutesCount,
      practicesCount,
      const DeepCollectionEquality().hash(_timeline));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StreaksProgressImplCopyWith<_$StreaksProgressImpl> get copyWith =>
      __$$StreaksProgressImplCopyWithImpl<_$StreaksProgressImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StreaksProgressImplToJson(
      this,
    );
  }
}

abstract class _StreaksProgress extends StreaksProgress {
  const factory _StreaksProgress(
      {required final int livesCount,
      required final DateTime livesExpireTimestamp,
      required final int minutesCount,
      required final int practicesCount,
      required final List<DateTime> timeline}) = _$StreaksProgressImpl;
  const _StreaksProgress._() : super._();

  factory _StreaksProgress.fromJson(Map<String, dynamic> json) =
      _$StreaksProgressImpl.fromJson;

  @override
  int get livesCount;
  @override
  DateTime get livesExpireTimestamp;
  @override
  int get minutesCount;
  @override
  int get practicesCount;
  @override
  List<DateTime> get timeline;
  @override
  @JsonKey(ignore: true)
  _$$StreaksProgressImplCopyWith<_$StreaksProgressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
