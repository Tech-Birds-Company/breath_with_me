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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StreakState _$StreakStateFromJson(Map<String, dynamic> json) {
  return _StreakState.fromJson(json);
}

/// @nodoc
mixin _$StreakState {
  int? get selectedDay => throw _privateConstructorUsedError;
  StreakStatisticsData? get statistics => throw _privateConstructorUsedError;
  StreakQuoteData? get quote => throw _privateConstructorUsedError;

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
  $Res call(
      {int? selectedDay,
      StreakStatisticsData? statistics,
      StreakQuoteData? quote});

  $StreakStatisticsDataCopyWith<$Res>? get statistics;
  $StreakQuoteDataCopyWith<$Res>? get quote;
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
    Object? selectedDay = freezed,
    Object? statistics = freezed,
    Object? quote = freezed,
  }) {
    return _then(_value.copyWith(
      selectedDay: freezed == selectedDay
          ? _value.selectedDay
          : selectedDay // ignore: cast_nullable_to_non_nullable
              as int?,
      statistics: freezed == statistics
          ? _value.statistics
          : statistics // ignore: cast_nullable_to_non_nullable
              as StreakStatisticsData?,
      quote: freezed == quote
          ? _value.quote
          : quote // ignore: cast_nullable_to_non_nullable
              as StreakQuoteData?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StreakStatisticsDataCopyWith<$Res>? get statistics {
    if (_value.statistics == null) {
      return null;
    }

    return $StreakStatisticsDataCopyWith<$Res>(_value.statistics!, (value) {
      return _then(_value.copyWith(statistics: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $StreakQuoteDataCopyWith<$Res>? get quote {
    if (_value.quote == null) {
      return null;
    }

    return $StreakQuoteDataCopyWith<$Res>(_value.quote!, (value) {
      return _then(_value.copyWith(quote: value) as $Val);
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
  $Res call(
      {int? selectedDay,
      StreakStatisticsData? statistics,
      StreakQuoteData? quote});

  @override
  $StreakStatisticsDataCopyWith<$Res>? get statistics;
  @override
  $StreakQuoteDataCopyWith<$Res>? get quote;
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
    Object? selectedDay = freezed,
    Object? statistics = freezed,
    Object? quote = freezed,
  }) {
    return _then(_$StreakStateImpl(
      selectedDay: freezed == selectedDay
          ? _value.selectedDay
          : selectedDay // ignore: cast_nullable_to_non_nullable
              as int?,
      statistics: freezed == statistics
          ? _value.statistics
          : statistics // ignore: cast_nullable_to_non_nullable
              as StreakStatisticsData?,
      quote: freezed == quote
          ? _value.quote
          : quote // ignore: cast_nullable_to_non_nullable
              as StreakQuoteData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StreakStateImpl implements _StreakState {
  const _$StreakStateImpl({this.selectedDay, this.statistics, this.quote});

  factory _$StreakStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$StreakStateImplFromJson(json);

  @override
  final int? selectedDay;
  @override
  final StreakStatisticsData? statistics;
  @override
  final StreakQuoteData? quote;

  @override
  String toString() {
    return 'StreakState(selectedDay: $selectedDay, statistics: $statistics, quote: $quote)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StreakStateImpl &&
            (identical(other.selectedDay, selectedDay) ||
                other.selectedDay == selectedDay) &&
            (identical(other.statistics, statistics) ||
                other.statistics == statistics) &&
            (identical(other.quote, quote) || other.quote == quote));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, selectedDay, statistics, quote);

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
  const factory _StreakState(
      {final int? selectedDay,
      final StreakStatisticsData? statistics,
      final StreakQuoteData? quote}) = _$StreakStateImpl;

  factory _StreakState.fromJson(Map<String, dynamic> json) =
      _$StreakStateImpl.fromJson;

  @override
  int? get selectedDay;
  @override
  StreakStatisticsData? get statistics;
  @override
  StreakQuoteData? get quote;
  @override
  @JsonKey(ignore: true)
  _$$StreakStateImplCopyWith<_$StreakStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
