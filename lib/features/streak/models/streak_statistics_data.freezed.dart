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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StreakStatisticsData _$StreakStatisticsDataFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'full':
      return _Full.fromJson(json);
    case 'missed':
      return _Missed.fromJson(json);

    default:
      throw CheckedFromJsonException(
          json,
          'runtimeType',
          'StreakStatisticsData',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$StreakStatisticsData {
  int get streaksCount => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int streaksCount, int practicesCount, int minutesCount)
        full,
    required TResult Function(int streaksCount, int missedDaysCount) missed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int streaksCount, int practicesCount, int minutesCount)?
        full,
    TResult? Function(int streaksCount, int missedDaysCount)? missed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int streaksCount, int practicesCount, int minutesCount)?
        full,
    TResult Function(int streaksCount, int missedDaysCount)? missed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Full value) full,
    required TResult Function(_Missed value) missed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Full value)? full,
    TResult? Function(_Missed value)? missed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Full value)? full,
    TResult Function(_Missed value)? missed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
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
  $Res call({int streaksCount});
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
  }) {
    return _then(_value.copyWith(
      streaksCount: null == streaksCount
          ? _value.streaksCount
          : streaksCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FullImplCopyWith<$Res>
    implements $StreakStatisticsDataCopyWith<$Res> {
  factory _$$FullImplCopyWith(
          _$FullImpl value, $Res Function(_$FullImpl) then) =
      __$$FullImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int streaksCount, int practicesCount, int minutesCount});
}

/// @nodoc
class __$$FullImplCopyWithImpl<$Res>
    extends _$StreakStatisticsDataCopyWithImpl<$Res, _$FullImpl>
    implements _$$FullImplCopyWith<$Res> {
  __$$FullImplCopyWithImpl(_$FullImpl _value, $Res Function(_$FullImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? streaksCount = null,
    Object? practicesCount = null,
    Object? minutesCount = null,
  }) {
    return _then(_$FullImpl(
      null == streaksCount
          ? _value.streaksCount
          : streaksCount // ignore: cast_nullable_to_non_nullable
              as int,
      null == practicesCount
          ? _value.practicesCount
          : practicesCount // ignore: cast_nullable_to_non_nullable
              as int,
      null == minutesCount
          ? _value.minutesCount
          : minutesCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FullImpl implements _Full {
  const _$FullImpl(this.streaksCount, this.practicesCount, this.minutesCount,
      {final String? $type})
      : $type = $type ?? 'full';

  factory _$FullImpl.fromJson(Map<String, dynamic> json) =>
      _$$FullImplFromJson(json);

  @override
  final int streaksCount;
  @override
  final int practicesCount;
  @override
  final int minutesCount;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'StreakStatisticsData.full(streaksCount: $streaksCount, practicesCount: $practicesCount, minutesCount: $minutesCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FullImpl &&
            (identical(other.streaksCount, streaksCount) ||
                other.streaksCount == streaksCount) &&
            (identical(other.practicesCount, practicesCount) ||
                other.practicesCount == practicesCount) &&
            (identical(other.minutesCount, minutesCount) ||
                other.minutesCount == minutesCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, streaksCount, practicesCount, minutesCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FullImplCopyWith<_$FullImpl> get copyWith =>
      __$$FullImplCopyWithImpl<_$FullImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int streaksCount, int practicesCount, int minutesCount)
        full,
    required TResult Function(int streaksCount, int missedDaysCount) missed,
  }) {
    return full(streaksCount, practicesCount, minutesCount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int streaksCount, int practicesCount, int minutesCount)?
        full,
    TResult? Function(int streaksCount, int missedDaysCount)? missed,
  }) {
    return full?.call(streaksCount, practicesCount, minutesCount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int streaksCount, int practicesCount, int minutesCount)?
        full,
    TResult Function(int streaksCount, int missedDaysCount)? missed,
    required TResult orElse(),
  }) {
    if (full != null) {
      return full(streaksCount, practicesCount, minutesCount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Full value) full,
    required TResult Function(_Missed value) missed,
  }) {
    return full(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Full value)? full,
    TResult? Function(_Missed value)? missed,
  }) {
    return full?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Full value)? full,
    TResult Function(_Missed value)? missed,
    required TResult orElse(),
  }) {
    if (full != null) {
      return full(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$FullImplToJson(
      this,
    );
  }
}

abstract class _Full implements StreakStatisticsData {
  const factory _Full(final int streaksCount, final int practicesCount,
      final int minutesCount) = _$FullImpl;

  factory _Full.fromJson(Map<String, dynamic> json) = _$FullImpl.fromJson;

  @override
  int get streaksCount;
  int get practicesCount;
  int get minutesCount;
  @override
  @JsonKey(ignore: true)
  _$$FullImplCopyWith<_$FullImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MissedImplCopyWith<$Res>
    implements $StreakStatisticsDataCopyWith<$Res> {
  factory _$$MissedImplCopyWith(
          _$MissedImpl value, $Res Function(_$MissedImpl) then) =
      __$$MissedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int streaksCount, int missedDaysCount});
}

/// @nodoc
class __$$MissedImplCopyWithImpl<$Res>
    extends _$StreakStatisticsDataCopyWithImpl<$Res, _$MissedImpl>
    implements _$$MissedImplCopyWith<$Res> {
  __$$MissedImplCopyWithImpl(
      _$MissedImpl _value, $Res Function(_$MissedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? streaksCount = null,
    Object? missedDaysCount = null,
  }) {
    return _then(_$MissedImpl(
      null == streaksCount
          ? _value.streaksCount
          : streaksCount // ignore: cast_nullable_to_non_nullable
              as int,
      null == missedDaysCount
          ? _value.missedDaysCount
          : missedDaysCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MissedImpl implements _Missed {
  const _$MissedImpl(this.streaksCount, this.missedDaysCount,
      {final String? $type})
      : $type = $type ?? 'missed';

  factory _$MissedImpl.fromJson(Map<String, dynamic> json) =>
      _$$MissedImplFromJson(json);

  @override
  final int streaksCount;
  @override
  final int missedDaysCount;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'StreakStatisticsData.missed(streaksCount: $streaksCount, missedDaysCount: $missedDaysCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MissedImpl &&
            (identical(other.streaksCount, streaksCount) ||
                other.streaksCount == streaksCount) &&
            (identical(other.missedDaysCount, missedDaysCount) ||
                other.missedDaysCount == missedDaysCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, streaksCount, missedDaysCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MissedImplCopyWith<_$MissedImpl> get copyWith =>
      __$$MissedImplCopyWithImpl<_$MissedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int streaksCount, int practicesCount, int minutesCount)
        full,
    required TResult Function(int streaksCount, int missedDaysCount) missed,
  }) {
    return missed(streaksCount, missedDaysCount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int streaksCount, int practicesCount, int minutesCount)?
        full,
    TResult? Function(int streaksCount, int missedDaysCount)? missed,
  }) {
    return missed?.call(streaksCount, missedDaysCount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int streaksCount, int practicesCount, int minutesCount)?
        full,
    TResult Function(int streaksCount, int missedDaysCount)? missed,
    required TResult orElse(),
  }) {
    if (missed != null) {
      return missed(streaksCount, missedDaysCount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Full value) full,
    required TResult Function(_Missed value) missed,
  }) {
    return missed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Full value)? full,
    TResult? Function(_Missed value)? missed,
  }) {
    return missed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Full value)? full,
    TResult Function(_Missed value)? missed,
    required TResult orElse(),
  }) {
    if (missed != null) {
      return missed(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MissedImplToJson(
      this,
    );
  }
}

abstract class _Missed implements StreakStatisticsData {
  const factory _Missed(final int streaksCount, final int missedDaysCount) =
      _$MissedImpl;

  factory _Missed.fromJson(Map<String, dynamic> json) = _$MissedImpl.fromJson;

  @override
  int get streaksCount;
  int get missedDaysCount;
  @override
  @JsonKey(ignore: true)
  _$$MissedImplCopyWith<_$MissedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
