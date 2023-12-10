// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'streak_statistics_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StreakStatisticsData _$StreakStatisticsDataFromJson(Map<String, dynamic> json) {
  return _StreakStatisticsData.fromJson(json);
}

/// @nodoc
mixin _$StreakStatisticsData {
  int get streaksCount => throw _privateConstructorUsedError;
  int? get practicesCount => throw _privateConstructorUsedError;
  int? get minutesCount => throw _privateConstructorUsedError;
  int? get dayMissedCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StreakStatisticsDataCopyWith<StreakStatisticsData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StreakStatisticsDataCopyWith<$Res> {
  factory $StreakStatisticsDataCopyWith(StreakStatisticsData value,
          $Res Function(StreakStatisticsData) then) =
      _$StreakStatisticsDataCopyWithImpl<$Res, StreakStatisticsData>;
  @useResult
  $Res call(
      {int streaksCount,
      int? practicesCount,
      int? minutesCount,
      int? dayMissedCount});
}

/// @nodoc
class _$StreakStatisticsDataCopyWithImpl<$Res,
        $Val extends StreakStatisticsData>
    implements $StreakStatisticsDataCopyWith<$Res> {
  _$StreakStatisticsDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? streaksCount = null,
    Object? practicesCount = freezed,
    Object? minutesCount = freezed,
    Object? dayMissedCount = freezed,
  }) {
    return _then(_value.copyWith(
      streaksCount: null == streaksCount
          ? _value.streaksCount
          : streaksCount // ignore: cast_nullable_to_non_nullable
              as int,
      practicesCount: freezed == practicesCount
          ? _value.practicesCount
          : practicesCount // ignore: cast_nullable_to_non_nullable
              as int?,
      minutesCount: freezed == minutesCount
          ? _value.minutesCount
          : minutesCount // ignore: cast_nullable_to_non_nullable
              as int?,
      dayMissedCount: freezed == dayMissedCount
          ? _value.dayMissedCount
          : dayMissedCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StreakStatisticsDataImplCopyWith<$Res>
    implements $StreakStatisticsDataCopyWith<$Res> {
  factory _$$StreakStatisticsDataImplCopyWith(_$StreakStatisticsDataImpl value,
          $Res Function(_$StreakStatisticsDataImpl) then) =
      __$$StreakStatisticsDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int streaksCount,
      int? practicesCount,
      int? minutesCount,
      int? dayMissedCount});
}

/// @nodoc
class __$$StreakStatisticsDataImplCopyWithImpl<$Res>
    extends _$StreakStatisticsDataCopyWithImpl<$Res, _$StreakStatisticsDataImpl>
    implements _$$StreakStatisticsDataImplCopyWith<$Res> {
  __$$StreakStatisticsDataImplCopyWithImpl(_$StreakStatisticsDataImpl _value,
      $Res Function(_$StreakStatisticsDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? streaksCount = null,
    Object? practicesCount = freezed,
    Object? minutesCount = freezed,
    Object? dayMissedCount = freezed,
  }) {
    return _then(_$StreakStatisticsDataImpl(
      streaksCount: null == streaksCount
          ? _value.streaksCount
          : streaksCount // ignore: cast_nullable_to_non_nullable
              as int,
      practicesCount: freezed == practicesCount
          ? _value.practicesCount
          : practicesCount // ignore: cast_nullable_to_non_nullable
              as int?,
      minutesCount: freezed == minutesCount
          ? _value.minutesCount
          : minutesCount // ignore: cast_nullable_to_non_nullable
              as int?,
      dayMissedCount: freezed == dayMissedCount
          ? _value.dayMissedCount
          : dayMissedCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StreakStatisticsDataImpl implements _StreakStatisticsData {
  const _$StreakStatisticsDataImpl(
      {this.streaksCount = 0,
      this.practicesCount,
      this.minutesCount,
      this.dayMissedCount});

  factory _$StreakStatisticsDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$StreakStatisticsDataImplFromJson(json);

  @override
  @JsonKey()
  final int streaksCount;
  @override
  final int? practicesCount;
  @override
  final int? minutesCount;
  @override
  final int? dayMissedCount;

  @override
  String toString() {
    return 'StreakStatisticsData(streaksCount: $streaksCount, practicesCount: $practicesCount, minutesCount: $minutesCount, dayMissedCount: $dayMissedCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StreakStatisticsDataImpl &&
            (identical(other.streaksCount, streaksCount) ||
                other.streaksCount == streaksCount) &&
            (identical(other.practicesCount, practicesCount) ||
                other.practicesCount == practicesCount) &&
            (identical(other.minutesCount, minutesCount) ||
                other.minutesCount == minutesCount) &&
            (identical(other.dayMissedCount, dayMissedCount) ||
                other.dayMissedCount == dayMissedCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, streaksCount, practicesCount, minutesCount, dayMissedCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StreakStatisticsDataImplCopyWith<_$StreakStatisticsDataImpl>
      get copyWith =>
          __$$StreakStatisticsDataImplCopyWithImpl<_$StreakStatisticsDataImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StreakStatisticsDataImplToJson(
      this,
    );
  }
}

abstract class _StreakStatisticsData implements StreakStatisticsData {
  const factory _StreakStatisticsData(
      {final int streaksCount,
      final int? practicesCount,
      final int? minutesCount,
      final int? dayMissedCount}) = _$StreakStatisticsDataImpl;

  factory _StreakStatisticsData.fromJson(Map<String, dynamic> json) =
      _$StreakStatisticsDataImpl.fromJson;

  @override
  int get streaksCount;
  @override
  int? get practicesCount;
  @override
  int? get minutesCount;
  @override
  int? get dayMissedCount;
  @override
  @JsonKey(ignore: true)
  _$$StreakStatisticsDataImplCopyWith<_$StreakStatisticsDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
