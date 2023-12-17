// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_progress.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserProgress _$UserProgressFromJson(Map<String, dynamic> json) {
  return _UserProgress.fromJson(json);
}

/// @nodoc
mixin _$UserProgress {
  int get streakDaysCompleted => throw _privateConstructorUsedError;
  DateTime get streakLastTimestamp => throw _privateConstructorUsedError;
  List<DateTime> get streakTimestamps => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserProgressCopyWith<UserProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProgressCopyWith<$Res> {
  factory $UserProgressCopyWith(
          UserProgress value, $Res Function(UserProgress) then) =
      _$UserProgressCopyWithImpl<$Res, UserProgress>;
  @useResult
  $Res call(
      {int streakDaysCompleted,
      DateTime streakLastTimestamp,
      List<DateTime> streakTimestamps});
}

/// @nodoc
class _$UserProgressCopyWithImpl<$Res, $Val extends UserProgress>
    implements $UserProgressCopyWith<$Res> {
  _$UserProgressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? streakDaysCompleted = null,
    Object? streakLastTimestamp = null,
    Object? streakTimestamps = null,
  }) {
    return _then(_value.copyWith(
      streakDaysCompleted: null == streakDaysCompleted
          ? _value.streakDaysCompleted
          : streakDaysCompleted // ignore: cast_nullable_to_non_nullable
              as int,
      streakLastTimestamp: null == streakLastTimestamp
          ? _value.streakLastTimestamp
          : streakLastTimestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      streakTimestamps: null == streakTimestamps
          ? _value.streakTimestamps
          : streakTimestamps // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserProgressImplCopyWith<$Res>
    implements $UserProgressCopyWith<$Res> {
  factory _$$UserProgressImplCopyWith(
          _$UserProgressImpl value, $Res Function(_$UserProgressImpl) then) =
      __$$UserProgressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int streakDaysCompleted,
      DateTime streakLastTimestamp,
      List<DateTime> streakTimestamps});
}

/// @nodoc
class __$$UserProgressImplCopyWithImpl<$Res>
    extends _$UserProgressCopyWithImpl<$Res, _$UserProgressImpl>
    implements _$$UserProgressImplCopyWith<$Res> {
  __$$UserProgressImplCopyWithImpl(
      _$UserProgressImpl _value, $Res Function(_$UserProgressImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? streakDaysCompleted = null,
    Object? streakLastTimestamp = null,
    Object? streakTimestamps = null,
  }) {
    return _then(_$UserProgressImpl(
      streakDaysCompleted: null == streakDaysCompleted
          ? _value.streakDaysCompleted
          : streakDaysCompleted // ignore: cast_nullable_to_non_nullable
              as int,
      streakLastTimestamp: null == streakLastTimestamp
          ? _value.streakLastTimestamp
          : streakLastTimestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      streakTimestamps: null == streakTimestamps
          ? _value._streakTimestamps
          : streakTimestamps // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserProgressImpl implements _UserProgress {
  const _$UserProgressImpl(
      {required this.streakDaysCompleted,
      required this.streakLastTimestamp,
      required final List<DateTime> streakTimestamps})
      : _streakTimestamps = streakTimestamps;

  factory _$UserProgressImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProgressImplFromJson(json);

  @override
  final int streakDaysCompleted;
  @override
  final DateTime streakLastTimestamp;
  final List<DateTime> _streakTimestamps;
  @override
  List<DateTime> get streakTimestamps {
    if (_streakTimestamps is EqualUnmodifiableListView)
      return _streakTimestamps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_streakTimestamps);
  }

  @override
  String toString() {
    return 'UserProgress(streakDaysCompleted: $streakDaysCompleted, streakLastTimestamp: $streakLastTimestamp, streakTimestamps: $streakTimestamps)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProgressImpl &&
            (identical(other.streakDaysCompleted, streakDaysCompleted) ||
                other.streakDaysCompleted == streakDaysCompleted) &&
            (identical(other.streakLastTimestamp, streakLastTimestamp) ||
                other.streakLastTimestamp == streakLastTimestamp) &&
            const DeepCollectionEquality()
                .equals(other._streakTimestamps, _streakTimestamps));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      streakDaysCompleted,
      streakLastTimestamp,
      const DeepCollectionEquality().hash(_streakTimestamps));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProgressImplCopyWith<_$UserProgressImpl> get copyWith =>
      __$$UserProgressImplCopyWithImpl<_$UserProgressImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProgressImplToJson(
      this,
    );
  }
}

abstract class _UserProgress implements UserProgress {
  const factory _UserProgress(
      {required final int streakDaysCompleted,
      required final DateTime streakLastTimestamp,
      required final List<DateTime> streakTimestamps}) = _$UserProgressImpl;

  factory _UserProgress.fromJson(Map<String, dynamic> json) =
      _$UserProgressImpl.fromJson;

  @override
  int get streakDaysCompleted;
  @override
  DateTime get streakLastTimestamp;
  @override
  List<DateTime> get streakTimestamps;
  @override
  @JsonKey(ignore: true)
  _$$UserProgressImplCopyWith<_$UserProgressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
