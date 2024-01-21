// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'streak_content_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StreakContentState _$StreakContentStateFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'loading':
      return _Loading.fromJson(json);
    case 'withoutPremium':
      return _WithoutPremium.fromJson(json);
    case 'premiumStartedOrContinued':
      return _PremiumStartedOrContinued.fromJson(json);
    case 'premiumMissed':
      return _PremiumMissed.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'StreakContentState',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$StreakContentState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(int streaksCount, StreakQuoteData quote)
        withoutPremium,
    required TResult Function(StreakStatisticsData statistics, int streaksCount,
            StreakLivesData livesData, StreakQuoteData quote)
        premiumStartedOrContinued,
    required TResult Function(
            StreakStatisticsData statistics, StreakLivesData livesData)
        premiumMissed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(int streaksCount, StreakQuoteData quote)? withoutPremium,
    TResult? Function(StreakStatisticsData statistics, int streaksCount,
            StreakLivesData livesData, StreakQuoteData quote)?
        premiumStartedOrContinued,
    TResult? Function(
            StreakStatisticsData statistics, StreakLivesData livesData)?
        premiumMissed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(int streaksCount, StreakQuoteData quote)? withoutPremium,
    TResult Function(StreakStatisticsData statistics, int streaksCount,
            StreakLivesData livesData, StreakQuoteData quote)?
        premiumStartedOrContinued,
    TResult Function(
            StreakStatisticsData statistics, StreakLivesData livesData)?
        premiumMissed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_WithoutPremium value) withoutPremium,
    required TResult Function(_PremiumStartedOrContinued value)
        premiumStartedOrContinued,
    required TResult Function(_PremiumMissed value) premiumMissed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_WithoutPremium value)? withoutPremium,
    TResult? Function(_PremiumStartedOrContinued value)?
        premiumStartedOrContinued,
    TResult? Function(_PremiumMissed value)? premiumMissed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_WithoutPremium value)? withoutPremium,
    TResult Function(_PremiumStartedOrContinued value)?
        premiumStartedOrContinued,
    TResult Function(_PremiumMissed value)? premiumMissed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StreakContentStateCopyWith<$Res> {
  factory $StreakContentStateCopyWith(
          StreakContentState value, $Res Function(StreakContentState) then) =
      _$StreakContentStateCopyWithImpl<$Res, StreakContentState>;
}

/// @nodoc
class _$StreakContentStateCopyWithImpl<$Res, $Val extends StreakContentState>
    implements $StreakContentStateCopyWith<$Res> {
  _$StreakContentStateCopyWithImpl(this._value, this._then);

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
    extends _$StreakContentStateCopyWithImpl<$Res, _$LoadingImpl>
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
    return 'StreakContentState.loading()';
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
    required TResult Function(StreakStatisticsData statistics, int streaksCount,
            StreakLivesData livesData, StreakQuoteData quote)
        premiumStartedOrContinued,
    required TResult Function(
            StreakStatisticsData statistics, StreakLivesData livesData)
        premiumMissed,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(int streaksCount, StreakQuoteData quote)? withoutPremium,
    TResult? Function(StreakStatisticsData statistics, int streaksCount,
            StreakLivesData livesData, StreakQuoteData quote)?
        premiumStartedOrContinued,
    TResult? Function(
            StreakStatisticsData statistics, StreakLivesData livesData)?
        premiumMissed,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(int streaksCount, StreakQuoteData quote)? withoutPremium,
    TResult Function(StreakStatisticsData statistics, int streaksCount,
            StreakLivesData livesData, StreakQuoteData quote)?
        premiumStartedOrContinued,
    TResult Function(
            StreakStatisticsData statistics, StreakLivesData livesData)?
        premiumMissed,
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
    required TResult Function(_WithoutPremium value) withoutPremium,
    required TResult Function(_PremiumStartedOrContinued value)
        premiumStartedOrContinued,
    required TResult Function(_PremiumMissed value) premiumMissed,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_WithoutPremium value)? withoutPremium,
    TResult? Function(_PremiumStartedOrContinued value)?
        premiumStartedOrContinued,
    TResult? Function(_PremiumMissed value)? premiumMissed,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_WithoutPremium value)? withoutPremium,
    TResult Function(_PremiumStartedOrContinued value)?
        premiumStartedOrContinued,
    TResult Function(_PremiumMissed value)? premiumMissed,
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

abstract class _Loading implements StreakContentState {
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
    extends _$StreakContentStateCopyWithImpl<$Res, _$WithoutPremiumImpl>
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
class _$WithoutPremiumImpl implements _WithoutPremium {
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
    return 'StreakContentState.withoutPremium(streaksCount: $streaksCount, quote: $quote)';
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
    required TResult Function(StreakStatisticsData statistics, int streaksCount,
            StreakLivesData livesData, StreakQuoteData quote)
        premiumStartedOrContinued,
    required TResult Function(
            StreakStatisticsData statistics, StreakLivesData livesData)
        premiumMissed,
  }) {
    return withoutPremium(streaksCount, quote);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(int streaksCount, StreakQuoteData quote)? withoutPremium,
    TResult? Function(StreakStatisticsData statistics, int streaksCount,
            StreakLivesData livesData, StreakQuoteData quote)?
        premiumStartedOrContinued,
    TResult? Function(
            StreakStatisticsData statistics, StreakLivesData livesData)?
        premiumMissed,
  }) {
    return withoutPremium?.call(streaksCount, quote);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(int streaksCount, StreakQuoteData quote)? withoutPremium,
    TResult Function(StreakStatisticsData statistics, int streaksCount,
            StreakLivesData livesData, StreakQuoteData quote)?
        premiumStartedOrContinued,
    TResult Function(
            StreakStatisticsData statistics, StreakLivesData livesData)?
        premiumMissed,
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
    required TResult Function(_WithoutPremium value) withoutPremium,
    required TResult Function(_PremiumStartedOrContinued value)
        premiumStartedOrContinued,
    required TResult Function(_PremiumMissed value) premiumMissed,
  }) {
    return withoutPremium(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_WithoutPremium value)? withoutPremium,
    TResult? Function(_PremiumStartedOrContinued value)?
        premiumStartedOrContinued,
    TResult? Function(_PremiumMissed value)? premiumMissed,
  }) {
    return withoutPremium?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_WithoutPremium value)? withoutPremium,
    TResult Function(_PremiumStartedOrContinued value)?
        premiumStartedOrContinued,
    TResult Function(_PremiumMissed value)? premiumMissed,
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

abstract class _WithoutPremium implements StreakContentState {
  const factory _WithoutPremium(
          final int streaksCount, final StreakQuoteData quote) =
      _$WithoutPremiumImpl;

  factory _WithoutPremium.fromJson(Map<String, dynamic> json) =
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
      {StreakStatisticsData statistics,
      int streaksCount,
      StreakLivesData livesData,
      StreakQuoteData quote});

  $StreakStatisticsDataCopyWith<$Res> get statistics;
  $StreakLivesDataCopyWith<$Res> get livesData;
  $StreakQuoteDataCopyWith<$Res> get quote;
}

/// @nodoc
class __$$PremiumStartedOrContinuedImplCopyWithImpl<$Res>
    extends _$StreakContentStateCopyWithImpl<$Res,
        _$PremiumStartedOrContinuedImpl>
    implements _$$PremiumStartedOrContinuedImplCopyWith<$Res> {
  __$$PremiumStartedOrContinuedImplCopyWithImpl(
      _$PremiumStartedOrContinuedImpl _value,
      $Res Function(_$PremiumStartedOrContinuedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statistics = null,
    Object? streaksCount = null,
    Object? livesData = null,
    Object? quote = null,
  }) {
    return _then(_$PremiumStartedOrContinuedImpl(
      null == statistics
          ? _value.statistics
          : statistics // ignore: cast_nullable_to_non_nullable
              as StreakStatisticsData,
      null == streaksCount
          ? _value.streaksCount
          : streaksCount // ignore: cast_nullable_to_non_nullable
              as int,
      null == livesData
          ? _value.livesData
          : livesData // ignore: cast_nullable_to_non_nullable
              as StreakLivesData,
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
  $StreakLivesDataCopyWith<$Res> get livesData {
    return $StreakLivesDataCopyWith<$Res>(_value.livesData, (value) {
      return _then(_value.copyWith(livesData: value));
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
      this.statistics, this.streaksCount, this.livesData, this.quote,
      {final String? $type})
      : $type = $type ?? 'premiumStartedOrContinued';

  factory _$PremiumStartedOrContinuedImpl.fromJson(Map<String, dynamic> json) =>
      _$$PremiumStartedOrContinuedImplFromJson(json);

  @override
  final StreakStatisticsData statistics;
  @override
  final int streaksCount;
  @override
  final StreakLivesData livesData;
  @override
  final StreakQuoteData quote;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'StreakContentState.premiumStartedOrContinued(statistics: $statistics, streaksCount: $streaksCount, livesData: $livesData, quote: $quote)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PremiumStartedOrContinuedImpl &&
            (identical(other.statistics, statistics) ||
                other.statistics == statistics) &&
            (identical(other.streaksCount, streaksCount) ||
                other.streaksCount == streaksCount) &&
            (identical(other.livesData, livesData) ||
                other.livesData == livesData) &&
            (identical(other.quote, quote) || other.quote == quote));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, statistics, streaksCount, livesData, quote);

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
    required TResult Function(StreakStatisticsData statistics, int streaksCount,
            StreakLivesData livesData, StreakQuoteData quote)
        premiumStartedOrContinued,
    required TResult Function(
            StreakStatisticsData statistics, StreakLivesData livesData)
        premiumMissed,
  }) {
    return premiumStartedOrContinued(
        statistics, streaksCount, livesData, quote);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(int streaksCount, StreakQuoteData quote)? withoutPremium,
    TResult? Function(StreakStatisticsData statistics, int streaksCount,
            StreakLivesData livesData, StreakQuoteData quote)?
        premiumStartedOrContinued,
    TResult? Function(
            StreakStatisticsData statistics, StreakLivesData livesData)?
        premiumMissed,
  }) {
    return premiumStartedOrContinued?.call(
        statistics, streaksCount, livesData, quote);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(int streaksCount, StreakQuoteData quote)? withoutPremium,
    TResult Function(StreakStatisticsData statistics, int streaksCount,
            StreakLivesData livesData, StreakQuoteData quote)?
        premiumStartedOrContinued,
    TResult Function(
            StreakStatisticsData statistics, StreakLivesData livesData)?
        premiumMissed,
    required TResult orElse(),
  }) {
    if (premiumStartedOrContinued != null) {
      return premiumStartedOrContinued(
          statistics, streaksCount, livesData, quote);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_WithoutPremium value) withoutPremium,
    required TResult Function(_PremiumStartedOrContinued value)
        premiumStartedOrContinued,
    required TResult Function(_PremiumMissed value) premiumMissed,
  }) {
    return premiumStartedOrContinued(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_WithoutPremium value)? withoutPremium,
    TResult? Function(_PremiumStartedOrContinued value)?
        premiumStartedOrContinued,
    TResult? Function(_PremiumMissed value)? premiumMissed,
  }) {
    return premiumStartedOrContinued?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_WithoutPremium value)? withoutPremium,
    TResult Function(_PremiumStartedOrContinued value)?
        premiumStartedOrContinued,
    TResult Function(_PremiumMissed value)? premiumMissed,
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

abstract class _PremiumStartedOrContinued implements StreakContentState {
  const factory _PremiumStartedOrContinued(
      final StreakStatisticsData statistics,
      final int streaksCount,
      final StreakLivesData livesData,
      final StreakQuoteData quote) = _$PremiumStartedOrContinuedImpl;

  factory _PremiumStartedOrContinued.fromJson(Map<String, dynamic> json) =
      _$PremiumStartedOrContinuedImpl.fromJson;

  StreakStatisticsData get statistics;
  int get streaksCount;
  StreakLivesData get livesData;
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
  @useResult
  $Res call({StreakStatisticsData statistics, StreakLivesData livesData});

  $StreakStatisticsDataCopyWith<$Res> get statistics;
  $StreakLivesDataCopyWith<$Res> get livesData;
}

/// @nodoc
class __$$PremiumMissedImplCopyWithImpl<$Res>
    extends _$StreakContentStateCopyWithImpl<$Res, _$PremiumMissedImpl>
    implements _$$PremiumMissedImplCopyWith<$Res> {
  __$$PremiumMissedImplCopyWithImpl(
      _$PremiumMissedImpl _value, $Res Function(_$PremiumMissedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statistics = null,
    Object? livesData = null,
  }) {
    return _then(_$PremiumMissedImpl(
      null == statistics
          ? _value.statistics
          : statistics // ignore: cast_nullable_to_non_nullable
              as StreakStatisticsData,
      null == livesData
          ? _value.livesData
          : livesData // ignore: cast_nullable_to_non_nullable
              as StreakLivesData,
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
  $StreakLivesDataCopyWith<$Res> get livesData {
    return $StreakLivesDataCopyWith<$Res>(_value.livesData, (value) {
      return _then(_value.copyWith(livesData: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$PremiumMissedImpl implements _PremiumMissed {
  const _$PremiumMissedImpl(this.statistics, this.livesData,
      {final String? $type})
      : $type = $type ?? 'premiumMissed';

  factory _$PremiumMissedImpl.fromJson(Map<String, dynamic> json) =>
      _$$PremiumMissedImplFromJson(json);

  @override
  final StreakStatisticsData statistics;
  @override
  final StreakLivesData livesData;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'StreakContentState.premiumMissed(statistics: $statistics, livesData: $livesData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PremiumMissedImpl &&
            (identical(other.statistics, statistics) ||
                other.statistics == statistics) &&
            (identical(other.livesData, livesData) ||
                other.livesData == livesData));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, statistics, livesData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PremiumMissedImplCopyWith<_$PremiumMissedImpl> get copyWith =>
      __$$PremiumMissedImplCopyWithImpl<_$PremiumMissedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(int streaksCount, StreakQuoteData quote)
        withoutPremium,
    required TResult Function(StreakStatisticsData statistics, int streaksCount,
            StreakLivesData livesData, StreakQuoteData quote)
        premiumStartedOrContinued,
    required TResult Function(
            StreakStatisticsData statistics, StreakLivesData livesData)
        premiumMissed,
  }) {
    return premiumMissed(statistics, livesData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(int streaksCount, StreakQuoteData quote)? withoutPremium,
    TResult? Function(StreakStatisticsData statistics, int streaksCount,
            StreakLivesData livesData, StreakQuoteData quote)?
        premiumStartedOrContinued,
    TResult? Function(
            StreakStatisticsData statistics, StreakLivesData livesData)?
        premiumMissed,
  }) {
    return premiumMissed?.call(statistics, livesData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(int streaksCount, StreakQuoteData quote)? withoutPremium,
    TResult Function(StreakStatisticsData statistics, int streaksCount,
            StreakLivesData livesData, StreakQuoteData quote)?
        premiumStartedOrContinued,
    TResult Function(
            StreakStatisticsData statistics, StreakLivesData livesData)?
        premiumMissed,
    required TResult orElse(),
  }) {
    if (premiumMissed != null) {
      return premiumMissed(statistics, livesData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_WithoutPremium value) withoutPremium,
    required TResult Function(_PremiumStartedOrContinued value)
        premiumStartedOrContinued,
    required TResult Function(_PremiumMissed value) premiumMissed,
  }) {
    return premiumMissed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_WithoutPremium value)? withoutPremium,
    TResult? Function(_PremiumStartedOrContinued value)?
        premiumStartedOrContinued,
    TResult? Function(_PremiumMissed value)? premiumMissed,
  }) {
    return premiumMissed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_WithoutPremium value)? withoutPremium,
    TResult Function(_PremiumStartedOrContinued value)?
        premiumStartedOrContinued,
    TResult Function(_PremiumMissed value)? premiumMissed,
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

abstract class _PremiumMissed implements StreakContentState {
  const factory _PremiumMissed(final StreakStatisticsData statistics,
      final StreakLivesData livesData) = _$PremiumMissedImpl;

  factory _PremiumMissed.fromJson(Map<String, dynamic> json) =
      _$PremiumMissedImpl.fromJson;

  StreakStatisticsData get statistics;
  StreakLivesData get livesData;
  @JsonKey(ignore: true)
  _$$PremiumMissedImplCopyWith<_$PremiumMissedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
