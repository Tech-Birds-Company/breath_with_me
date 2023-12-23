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
  switch (json['runtimeType']) {
    case 'loading':
      return _Loading.fromJson(json);
    case 'withoutPremium':
      return WithoutPremium.fromJson(json);
    case 'premiumStartedOrContinued':
      return _PremiumStartedOrContinued.fromJson(json);
    case 'premiumMissed':
      return PremiumMissed.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'StreakState',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$StreakState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(int streaksCount, StreakQuoteData quote)
        withoutPremium,
    required TResult Function(int selectedDay, StreakStatisticsData statistics,
            StreakQuoteData quote)
        premiumStartedOrContinued,
    required TResult Function() premiumMissed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(int streaksCount, StreakQuoteData quote)? withoutPremium,
    TResult? Function(int selectedDay, StreakStatisticsData statistics,
            StreakQuoteData quote)?
        premiumStartedOrContinued,
    TResult? Function()? premiumMissed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(int streaksCount, StreakQuoteData quote)? withoutPremium,
    TResult Function(int selectedDay, StreakStatisticsData statistics,
            StreakQuoteData quote)?
        premiumStartedOrContinued,
    TResult Function()? premiumMissed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(WithoutPremium value) withoutPremium,
    required TResult Function(_PremiumStartedOrContinued value)
        premiumStartedOrContinued,
    required TResult Function(PremiumMissed value) premiumMissed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(WithoutPremium value)? withoutPremium,
    TResult? Function(_PremiumStartedOrContinued value)?
        premiumStartedOrContinued,
    TResult? Function(PremiumMissed value)? premiumMissed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(WithoutPremium value)? withoutPremium,
    TResult Function(_PremiumStartedOrContinued value)?
        premiumStartedOrContinued,
    TResult Function(PremiumMissed value)? premiumMissed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StreakStateCopyWith<$Res> {
  factory $StreakStateCopyWith(
          StreakState value, $Res Function(StreakState) then) =
      _$StreakStateCopyWithImpl<$Res, StreakState>;
}

/// @nodoc
class _$StreakStateCopyWithImpl<$Res, $Val extends StreakState>
    implements $StreakStateCopyWith<$Res> {
  _$StreakStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$StreakStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$LoadingImpl implements _Loading {
  const _$LoadingImpl({final String? $type}) : $type = $type ?? 'loading';

  factory _$LoadingImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoadingImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'StreakState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(int streaksCount, StreakQuoteData quote)
        withoutPremium,
    required TResult Function(int selectedDay, StreakStatisticsData statistics,
            StreakQuoteData quote)
        premiumStartedOrContinued,
    required TResult Function() premiumMissed,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(int streaksCount, StreakQuoteData quote)? withoutPremium,
    TResult? Function(int selectedDay, StreakStatisticsData statistics,
            StreakQuoteData quote)?
        premiumStartedOrContinued,
    TResult? Function()? premiumMissed,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(int streaksCount, StreakQuoteData quote)? withoutPremium,
    TResult Function(int selectedDay, StreakStatisticsData statistics,
            StreakQuoteData quote)?
        premiumStartedOrContinued,
    TResult Function()? premiumMissed,
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
    required TResult Function(_Loading value) loading,
    required TResult Function(WithoutPremium value) withoutPremium,
    required TResult Function(_PremiumStartedOrContinued value)
        premiumStartedOrContinued,
    required TResult Function(PremiumMissed value) premiumMissed,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(WithoutPremium value)? withoutPremium,
    TResult? Function(_PremiumStartedOrContinued value)?
        premiumStartedOrContinued,
    TResult? Function(PremiumMissed value)? premiumMissed,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(WithoutPremium value)? withoutPremium,
    TResult Function(_PremiumStartedOrContinued value)?
        premiumStartedOrContinued,
    TResult Function(PremiumMissed value)? premiumMissed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$LoadingImplToJson(
      this,
    );
  }
}

abstract class _Loading implements StreakState {
  const factory _Loading() = _$LoadingImpl;

  factory _Loading.fromJson(Map<String, dynamic> json) = _$LoadingImpl.fromJson;
}

/// @nodoc
abstract class _$$WithoutPremiumImplCopyWith<$Res> {
  factory _$$WithoutPremiumImplCopyWith(_$WithoutPremiumImpl value,
          $Res Function(_$WithoutPremiumImpl) then) =
      __$$WithoutPremiumImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int streaksCount, StreakQuoteData quote});

  $StreakQuoteDataCopyWith<$Res> get quote;
}

/// @nodoc
class __$$WithoutPremiumImplCopyWithImpl<$Res>
    extends _$StreakStateCopyWithImpl<$Res, _$WithoutPremiumImpl>
    implements _$$WithoutPremiumImplCopyWith<$Res> {
  __$$WithoutPremiumImplCopyWithImpl(
      _$WithoutPremiumImpl _value, $Res Function(_$WithoutPremiumImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? streaksCount = null,
    Object? quote = null,
  }) {
    return _then(_$WithoutPremiumImpl(
      null == streaksCount
          ? _value.streaksCount
          : streaksCount // ignore: cast_nullable_to_non_nullable
              as int,
      null == quote
          ? _value.quote
          : quote // ignore: cast_nullable_to_non_nullable
              as StreakQuoteData,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $StreakQuoteDataCopyWith<$Res> get quote {
    return $StreakQuoteDataCopyWith<$Res>(_value.quote, (value) {
      return _then(_value.copyWith(quote: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$WithoutPremiumImpl implements WithoutPremium {
  const _$WithoutPremiumImpl(this.streaksCount, this.quote,
      {final String? $type})
      : $type = $type ?? 'withoutPremium';

  factory _$WithoutPremiumImpl.fromJson(Map<String, dynamic> json) =>
      _$$WithoutPremiumImplFromJson(json);

  @override
  final int streaksCount;
  @override
  final StreakQuoteData quote;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'StreakState.withoutPremium(streaksCount: $streaksCount, quote: $quote)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WithoutPremiumImpl &&
            (identical(other.streaksCount, streaksCount) ||
                other.streaksCount == streaksCount) &&
            (identical(other.quote, quote) || other.quote == quote));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, streaksCount, quote);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WithoutPremiumImplCopyWith<_$WithoutPremiumImpl> get copyWith =>
      __$$WithoutPremiumImplCopyWithImpl<_$WithoutPremiumImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(int streaksCount, StreakQuoteData quote)
        withoutPremium,
    required TResult Function(int selectedDay, StreakStatisticsData statistics,
            StreakQuoteData quote)
        premiumStartedOrContinued,
    required TResult Function() premiumMissed,
  }) {
    return withoutPremium(streaksCount, quote);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(int streaksCount, StreakQuoteData quote)? withoutPremium,
    TResult? Function(int selectedDay, StreakStatisticsData statistics,
            StreakQuoteData quote)?
        premiumStartedOrContinued,
    TResult? Function()? premiumMissed,
  }) {
    return withoutPremium?.call(streaksCount, quote);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(int streaksCount, StreakQuoteData quote)? withoutPremium,
    TResult Function(int selectedDay, StreakStatisticsData statistics,
            StreakQuoteData quote)?
        premiumStartedOrContinued,
    TResult Function()? premiumMissed,
    required TResult orElse(),
  }) {
    if (withoutPremium != null) {
      return withoutPremium(streaksCount, quote);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(WithoutPremium value) withoutPremium,
    required TResult Function(_PremiumStartedOrContinued value)
        premiumStartedOrContinued,
    required TResult Function(PremiumMissed value) premiumMissed,
  }) {
    return withoutPremium(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(WithoutPremium value)? withoutPremium,
    TResult? Function(_PremiumStartedOrContinued value)?
        premiumStartedOrContinued,
    TResult? Function(PremiumMissed value)? premiumMissed,
  }) {
    return withoutPremium?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(WithoutPremium value)? withoutPremium,
    TResult Function(_PremiumStartedOrContinued value)?
        premiumStartedOrContinued,
    TResult Function(PremiumMissed value)? premiumMissed,
    required TResult orElse(),
  }) {
    if (withoutPremium != null) {
      return withoutPremium(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$WithoutPremiumImplToJson(
      this,
    );
  }
}

abstract class WithoutPremium implements StreakState {
  const factory WithoutPremium(
          final int streaksCount, final StreakQuoteData quote) =
      _$WithoutPremiumImpl;

  factory WithoutPremium.fromJson(Map<String, dynamic> json) =
      _$WithoutPremiumImpl.fromJson;

  int get streaksCount;
  StreakQuoteData get quote;
  @JsonKey(ignore: true)
  _$$WithoutPremiumImplCopyWith<_$WithoutPremiumImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PremiumStartedOrContinuedImplCopyWith<$Res> {
  factory _$$PremiumStartedOrContinuedImplCopyWith(
          _$PremiumStartedOrContinuedImpl value,
          $Res Function(_$PremiumStartedOrContinuedImpl) then) =
      __$$PremiumStartedOrContinuedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int selectedDay,
      StreakStatisticsData statistics,
      StreakQuoteData quote});

  $StreakStatisticsDataCopyWith<$Res> get statistics;
  $StreakQuoteDataCopyWith<$Res> get quote;
}

/// @nodoc
class __$$PremiumStartedOrContinuedImplCopyWithImpl<$Res>
    extends _$StreakStateCopyWithImpl<$Res, _$PremiumStartedOrContinuedImpl>
    implements _$$PremiumStartedOrContinuedImplCopyWith<$Res> {
  __$$PremiumStartedOrContinuedImplCopyWithImpl(
      _$PremiumStartedOrContinuedImpl _value,
      $Res Function(_$PremiumStartedOrContinuedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedDay = null,
    Object? statistics = null,
    Object? quote = null,
  }) {
    return _then(_$PremiumStartedOrContinuedImpl(
      null == selectedDay
          ? _value.selectedDay
          : selectedDay // ignore: cast_nullable_to_non_nullable
              as int,
      null == statistics
          ? _value.statistics
          : statistics // ignore: cast_nullable_to_non_nullable
              as StreakStatisticsData,
      null == quote
          ? _value.quote
          : quote // ignore: cast_nullable_to_non_nullable
              as StreakQuoteData,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $StreakStatisticsDataCopyWith<$Res> get statistics {
    return $StreakStatisticsDataCopyWith<$Res>(_value.statistics, (value) {
      return _then(_value.copyWith(statistics: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $StreakQuoteDataCopyWith<$Res> get quote {
    return $StreakQuoteDataCopyWith<$Res>(_value.quote, (value) {
      return _then(_value.copyWith(quote: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$PremiumStartedOrContinuedImpl implements _PremiumStartedOrContinued {
  const _$PremiumStartedOrContinuedImpl(
      this.selectedDay, this.statistics, this.quote,
      {final String? $type})
      : $type = $type ?? 'premiumStartedOrContinued';

  factory _$PremiumStartedOrContinuedImpl.fromJson(Map<String, dynamic> json) =>
      _$$PremiumStartedOrContinuedImplFromJson(json);

  @override
  final int selectedDay;
  @override
  final StreakStatisticsData statistics;
  @override
  final StreakQuoteData quote;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'StreakState.premiumStartedOrContinued(selectedDay: $selectedDay, statistics: $statistics, quote: $quote)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PremiumStartedOrContinuedImpl &&
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
  _$$PremiumStartedOrContinuedImplCopyWith<_$PremiumStartedOrContinuedImpl>
      get copyWith => __$$PremiumStartedOrContinuedImplCopyWithImpl<
          _$PremiumStartedOrContinuedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(int streaksCount, StreakQuoteData quote)
        withoutPremium,
    required TResult Function(int selectedDay, StreakStatisticsData statistics,
            StreakQuoteData quote)
        premiumStartedOrContinued,
    required TResult Function() premiumMissed,
  }) {
    return premiumStartedOrContinued(selectedDay, statistics, quote);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(int streaksCount, StreakQuoteData quote)? withoutPremium,
    TResult? Function(int selectedDay, StreakStatisticsData statistics,
            StreakQuoteData quote)?
        premiumStartedOrContinued,
    TResult? Function()? premiumMissed,
  }) {
    return premiumStartedOrContinued?.call(selectedDay, statistics, quote);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(int streaksCount, StreakQuoteData quote)? withoutPremium,
    TResult Function(int selectedDay, StreakStatisticsData statistics,
            StreakQuoteData quote)?
        premiumStartedOrContinued,
    TResult Function()? premiumMissed,
    required TResult orElse(),
  }) {
    if (premiumStartedOrContinued != null) {
      return premiumStartedOrContinued(selectedDay, statistics, quote);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(WithoutPremium value) withoutPremium,
    required TResult Function(_PremiumStartedOrContinued value)
        premiumStartedOrContinued,
    required TResult Function(PremiumMissed value) premiumMissed,
  }) {
    return premiumStartedOrContinued(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(WithoutPremium value)? withoutPremium,
    TResult? Function(_PremiumStartedOrContinued value)?
        premiumStartedOrContinued,
    TResult? Function(PremiumMissed value)? premiumMissed,
  }) {
    return premiumStartedOrContinued?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(WithoutPremium value)? withoutPremium,
    TResult Function(_PremiumStartedOrContinued value)?
        premiumStartedOrContinued,
    TResult Function(PremiumMissed value)? premiumMissed,
    required TResult orElse(),
  }) {
    if (premiumStartedOrContinued != null) {
      return premiumStartedOrContinued(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PremiumStartedOrContinuedImplToJson(
      this,
    );
  }
}

abstract class _PremiumStartedOrContinued implements StreakState {
  const factory _PremiumStartedOrContinued(
      final int selectedDay,
      final StreakStatisticsData statistics,
      final StreakQuoteData quote) = _$PremiumStartedOrContinuedImpl;

  factory _PremiumStartedOrContinued.fromJson(Map<String, dynamic> json) =
      _$PremiumStartedOrContinuedImpl.fromJson;

  int get selectedDay;
  StreakStatisticsData get statistics;
  StreakQuoteData get quote;
  @JsonKey(ignore: true)
  _$$PremiumStartedOrContinuedImplCopyWith<_$PremiumStartedOrContinuedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PremiumMissedImplCopyWith<$Res> {
  factory _$$PremiumMissedImplCopyWith(
          _$PremiumMissedImpl value, $Res Function(_$PremiumMissedImpl) then) =
      __$$PremiumMissedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PremiumMissedImplCopyWithImpl<$Res>
    extends _$StreakStateCopyWithImpl<$Res, _$PremiumMissedImpl>
    implements _$$PremiumMissedImplCopyWith<$Res> {
  __$$PremiumMissedImplCopyWithImpl(
      _$PremiumMissedImpl _value, $Res Function(_$PremiumMissedImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$PremiumMissedImpl implements PremiumMissed {
  const _$PremiumMissedImpl({final String? $type})
      : $type = $type ?? 'premiumMissed';

  factory _$PremiumMissedImpl.fromJson(Map<String, dynamic> json) =>
      _$$PremiumMissedImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'StreakState.premiumMissed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PremiumMissedImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(int streaksCount, StreakQuoteData quote)
        withoutPremium,
    required TResult Function(int selectedDay, StreakStatisticsData statistics,
            StreakQuoteData quote)
        premiumStartedOrContinued,
    required TResult Function() premiumMissed,
  }) {
    return premiumMissed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(int streaksCount, StreakQuoteData quote)? withoutPremium,
    TResult? Function(int selectedDay, StreakStatisticsData statistics,
            StreakQuoteData quote)?
        premiumStartedOrContinued,
    TResult? Function()? premiumMissed,
  }) {
    return premiumMissed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(int streaksCount, StreakQuoteData quote)? withoutPremium,
    TResult Function(int selectedDay, StreakStatisticsData statistics,
            StreakQuoteData quote)?
        premiumStartedOrContinued,
    TResult Function()? premiumMissed,
    required TResult orElse(),
  }) {
    if (premiumMissed != null) {
      return premiumMissed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(WithoutPremium value) withoutPremium,
    required TResult Function(_PremiumStartedOrContinued value)
        premiumStartedOrContinued,
    required TResult Function(PremiumMissed value) premiumMissed,
  }) {
    return premiumMissed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(WithoutPremium value)? withoutPremium,
    TResult? Function(_PremiumStartedOrContinued value)?
        premiumStartedOrContinued,
    TResult? Function(PremiumMissed value)? premiumMissed,
  }) {
    return premiumMissed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(WithoutPremium value)? withoutPremium,
    TResult Function(_PremiumStartedOrContinued value)?
        premiumStartedOrContinued,
    TResult Function(PremiumMissed value)? premiumMissed,
    required TResult orElse(),
  }) {
    if (premiumMissed != null) {
      return premiumMissed(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PremiumMissedImplToJson(
      this,
    );
  }
}

abstract class PremiumMissed implements StreakState {
  const factory PremiumMissed() = _$PremiumMissedImpl;

  factory PremiumMissed.fromJson(Map<String, dynamic> json) =
      _$PremiumMissedImpl.fromJson;
}
