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
    case 'withoutPro':
      return WithoutPro.fromJson(json);
    case 'proStartedOrContinued':
      return _StartedOrContinued.fromJson(json);
    case 'proMissed':
      return Missed.fromJson(json);

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
    required TResult Function(int selectedDay, StreakQuoteData quote)
        withoutPro,
    required TResult Function(int? selectedDay, StreakStatisticsData statistics,
            StreakQuoteData quote)
        proStartedOrContinued,
    required TResult Function() proMissed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(int selectedDay, StreakQuoteData quote)? withoutPro,
    TResult? Function(int? selectedDay, StreakStatisticsData statistics,
            StreakQuoteData quote)?
        proStartedOrContinued,
    TResult? Function()? proMissed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(int selectedDay, StreakQuoteData quote)? withoutPro,
    TResult Function(int? selectedDay, StreakStatisticsData statistics,
            StreakQuoteData quote)?
        proStartedOrContinued,
    TResult Function()? proMissed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(WithoutPro value) withoutPro,
    required TResult Function(_StartedOrContinued value) proStartedOrContinued,
    required TResult Function(Missed value) proMissed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(WithoutPro value)? withoutPro,
    TResult? Function(_StartedOrContinued value)? proStartedOrContinued,
    TResult? Function(Missed value)? proMissed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(WithoutPro value)? withoutPro,
    TResult Function(_StartedOrContinued value)? proStartedOrContinued,
    TResult Function(Missed value)? proMissed,
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
    required TResult Function(int selectedDay, StreakQuoteData quote)
        withoutPro,
    required TResult Function(int? selectedDay, StreakStatisticsData statistics,
            StreakQuoteData quote)
        proStartedOrContinued,
    required TResult Function() proMissed,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(int selectedDay, StreakQuoteData quote)? withoutPro,
    TResult? Function(int? selectedDay, StreakStatisticsData statistics,
            StreakQuoteData quote)?
        proStartedOrContinued,
    TResult? Function()? proMissed,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(int selectedDay, StreakQuoteData quote)? withoutPro,
    TResult Function(int? selectedDay, StreakStatisticsData statistics,
            StreakQuoteData quote)?
        proStartedOrContinued,
    TResult Function()? proMissed,
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
    required TResult Function(WithoutPro value) withoutPro,
    required TResult Function(_StartedOrContinued value) proStartedOrContinued,
    required TResult Function(Missed value) proMissed,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(WithoutPro value)? withoutPro,
    TResult? Function(_StartedOrContinued value)? proStartedOrContinued,
    TResult? Function(Missed value)? proMissed,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(WithoutPro value)? withoutPro,
    TResult Function(_StartedOrContinued value)? proStartedOrContinued,
    TResult Function(Missed value)? proMissed,
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
abstract class _$$WithoutProImplCopyWith<$Res> {
  factory _$$WithoutProImplCopyWith(
          _$WithoutProImpl value, $Res Function(_$WithoutProImpl) then) =
      __$$WithoutProImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int selectedDay, StreakQuoteData quote});

  $StreakQuoteDataCopyWith<$Res> get quote;
}

/// @nodoc
class __$$WithoutProImplCopyWithImpl<$Res>
    extends _$StreakStateCopyWithImpl<$Res, _$WithoutProImpl>
    implements _$$WithoutProImplCopyWith<$Res> {
  __$$WithoutProImplCopyWithImpl(
      _$WithoutProImpl _value, $Res Function(_$WithoutProImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedDay = null,
    Object? quote = null,
  }) {
    return _then(_$WithoutProImpl(
      null == selectedDay
          ? _value.selectedDay
          : selectedDay // ignore: cast_nullable_to_non_nullable
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
class _$WithoutProImpl implements WithoutPro {
  const _$WithoutProImpl(this.selectedDay, this.quote, {final String? $type})
      : $type = $type ?? 'withoutPro';

  factory _$WithoutProImpl.fromJson(Map<String, dynamic> json) =>
      _$$WithoutProImplFromJson(json);

  @override
  final int selectedDay;
  @override
  final StreakQuoteData quote;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'StreakState.withoutPro(selectedDay: $selectedDay, quote: $quote)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WithoutProImpl &&
            (identical(other.selectedDay, selectedDay) ||
                other.selectedDay == selectedDay) &&
            (identical(other.quote, quote) || other.quote == quote));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, selectedDay, quote);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WithoutProImplCopyWith<_$WithoutProImpl> get copyWith =>
      __$$WithoutProImplCopyWithImpl<_$WithoutProImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(int selectedDay, StreakQuoteData quote)
        withoutPro,
    required TResult Function(int? selectedDay, StreakStatisticsData statistics,
            StreakQuoteData quote)
        proStartedOrContinued,
    required TResult Function() proMissed,
  }) {
    return withoutPro(selectedDay, quote);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(int selectedDay, StreakQuoteData quote)? withoutPro,
    TResult? Function(int? selectedDay, StreakStatisticsData statistics,
            StreakQuoteData quote)?
        proStartedOrContinued,
    TResult? Function()? proMissed,
  }) {
    return withoutPro?.call(selectedDay, quote);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(int selectedDay, StreakQuoteData quote)? withoutPro,
    TResult Function(int? selectedDay, StreakStatisticsData statistics,
            StreakQuoteData quote)?
        proStartedOrContinued,
    TResult Function()? proMissed,
    required TResult orElse(),
  }) {
    if (withoutPro != null) {
      return withoutPro(selectedDay, quote);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(WithoutPro value) withoutPro,
    required TResult Function(_StartedOrContinued value) proStartedOrContinued,
    required TResult Function(Missed value) proMissed,
  }) {
    return withoutPro(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(WithoutPro value)? withoutPro,
    TResult? Function(_StartedOrContinued value)? proStartedOrContinued,
    TResult? Function(Missed value)? proMissed,
  }) {
    return withoutPro?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(WithoutPro value)? withoutPro,
    TResult Function(_StartedOrContinued value)? proStartedOrContinued,
    TResult Function(Missed value)? proMissed,
    required TResult orElse(),
  }) {
    if (withoutPro != null) {
      return withoutPro(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$WithoutProImplToJson(
      this,
    );
  }
}

abstract class WithoutPro implements StreakState {
  const factory WithoutPro(final int selectedDay, final StreakQuoteData quote) =
      _$WithoutProImpl;

  factory WithoutPro.fromJson(Map<String, dynamic> json) =
      _$WithoutProImpl.fromJson;

  int get selectedDay;
  StreakQuoteData get quote;
  @JsonKey(ignore: true)
  _$$WithoutProImplCopyWith<_$WithoutProImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StartedOrContinuedImplCopyWith<$Res> {
  factory _$$StartedOrContinuedImplCopyWith(_$StartedOrContinuedImpl value,
          $Res Function(_$StartedOrContinuedImpl) then) =
      __$$StartedOrContinuedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int? selectedDay,
      StreakStatisticsData statistics,
      StreakQuoteData quote});

  $StreakStatisticsDataCopyWith<$Res> get statistics;
  $StreakQuoteDataCopyWith<$Res> get quote;
}

/// @nodoc
class __$$StartedOrContinuedImplCopyWithImpl<$Res>
    extends _$StreakStateCopyWithImpl<$Res, _$StartedOrContinuedImpl>
    implements _$$StartedOrContinuedImplCopyWith<$Res> {
  __$$StartedOrContinuedImplCopyWithImpl(_$StartedOrContinuedImpl _value,
      $Res Function(_$StartedOrContinuedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedDay = freezed,
    Object? statistics = null,
    Object? quote = null,
  }) {
    return _then(_$StartedOrContinuedImpl(
      freezed == selectedDay
          ? _value.selectedDay
          : selectedDay // ignore: cast_nullable_to_non_nullable
              as int?,
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
class _$StartedOrContinuedImpl implements _StartedOrContinued {
  const _$StartedOrContinuedImpl(this.selectedDay, this.statistics, this.quote,
      {final String? $type})
      : $type = $type ?? 'proStartedOrContinued';

  factory _$StartedOrContinuedImpl.fromJson(Map<String, dynamic> json) =>
      _$$StartedOrContinuedImplFromJson(json);

  @override
  final int? selectedDay;
  @override
  final StreakStatisticsData statistics;
  @override
  final StreakQuoteData quote;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'StreakState.proStartedOrContinued(selectedDay: $selectedDay, statistics: $statistics, quote: $quote)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartedOrContinuedImpl &&
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
  _$$StartedOrContinuedImplCopyWith<_$StartedOrContinuedImpl> get copyWith =>
      __$$StartedOrContinuedImplCopyWithImpl<_$StartedOrContinuedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(int selectedDay, StreakQuoteData quote)
        withoutPro,
    required TResult Function(int? selectedDay, StreakStatisticsData statistics,
            StreakQuoteData quote)
        proStartedOrContinued,
    required TResult Function() proMissed,
  }) {
    return proStartedOrContinued(selectedDay, statistics, quote);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(int selectedDay, StreakQuoteData quote)? withoutPro,
    TResult? Function(int? selectedDay, StreakStatisticsData statistics,
            StreakQuoteData quote)?
        proStartedOrContinued,
    TResult? Function()? proMissed,
  }) {
    return proStartedOrContinued?.call(selectedDay, statistics, quote);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(int selectedDay, StreakQuoteData quote)? withoutPro,
    TResult Function(int? selectedDay, StreakStatisticsData statistics,
            StreakQuoteData quote)?
        proStartedOrContinued,
    TResult Function()? proMissed,
    required TResult orElse(),
  }) {
    if (proStartedOrContinued != null) {
      return proStartedOrContinued(selectedDay, statistics, quote);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(WithoutPro value) withoutPro,
    required TResult Function(_StartedOrContinued value) proStartedOrContinued,
    required TResult Function(Missed value) proMissed,
  }) {
    return proStartedOrContinued(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(WithoutPro value)? withoutPro,
    TResult? Function(_StartedOrContinued value)? proStartedOrContinued,
    TResult? Function(Missed value)? proMissed,
  }) {
    return proStartedOrContinued?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(WithoutPro value)? withoutPro,
    TResult Function(_StartedOrContinued value)? proStartedOrContinued,
    TResult Function(Missed value)? proMissed,
    required TResult orElse(),
  }) {
    if (proStartedOrContinued != null) {
      return proStartedOrContinued(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$StartedOrContinuedImplToJson(
      this,
    );
  }
}

abstract class _StartedOrContinued implements StreakState {
  const factory _StartedOrContinued(
      final int? selectedDay,
      final StreakStatisticsData statistics,
      final StreakQuoteData quote) = _$StartedOrContinuedImpl;

  factory _StartedOrContinued.fromJson(Map<String, dynamic> json) =
      _$StartedOrContinuedImpl.fromJson;

  int? get selectedDay;
  StreakStatisticsData get statistics;
  StreakQuoteData get quote;
  @JsonKey(ignore: true)
  _$$StartedOrContinuedImplCopyWith<_$StartedOrContinuedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MissedImplCopyWith<$Res> {
  factory _$$MissedImplCopyWith(
          _$MissedImpl value, $Res Function(_$MissedImpl) then) =
      __$$MissedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MissedImplCopyWithImpl<$Res>
    extends _$StreakStateCopyWithImpl<$Res, _$MissedImpl>
    implements _$$MissedImplCopyWith<$Res> {
  __$$MissedImplCopyWithImpl(
      _$MissedImpl _value, $Res Function(_$MissedImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$MissedImpl implements Missed {
  const _$MissedImpl({final String? $type}) : $type = $type ?? 'proMissed';

  factory _$MissedImpl.fromJson(Map<String, dynamic> json) =>
      _$$MissedImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'StreakState.proMissed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MissedImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(int selectedDay, StreakQuoteData quote)
        withoutPro,
    required TResult Function(int? selectedDay, StreakStatisticsData statistics,
            StreakQuoteData quote)
        proStartedOrContinued,
    required TResult Function() proMissed,
  }) {
    return proMissed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(int selectedDay, StreakQuoteData quote)? withoutPro,
    TResult? Function(int? selectedDay, StreakStatisticsData statistics,
            StreakQuoteData quote)?
        proStartedOrContinued,
    TResult? Function()? proMissed,
  }) {
    return proMissed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(int selectedDay, StreakQuoteData quote)? withoutPro,
    TResult Function(int? selectedDay, StreakStatisticsData statistics,
            StreakQuoteData quote)?
        proStartedOrContinued,
    TResult Function()? proMissed,
    required TResult orElse(),
  }) {
    if (proMissed != null) {
      return proMissed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(WithoutPro value) withoutPro,
    required TResult Function(_StartedOrContinued value) proStartedOrContinued,
    required TResult Function(Missed value) proMissed,
  }) {
    return proMissed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(WithoutPro value)? withoutPro,
    TResult? Function(_StartedOrContinued value)? proStartedOrContinued,
    TResult? Function(Missed value)? proMissed,
  }) {
    return proMissed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(WithoutPro value)? withoutPro,
    TResult Function(_StartedOrContinued value)? proStartedOrContinued,
    TResult Function(Missed value)? proMissed,
    required TResult orElse(),
  }) {
    if (proMissed != null) {
      return proMissed(this);
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

abstract class Missed implements StreakState {
  const factory Missed() = _$MissedImpl;

  factory Missed.fromJson(Map<String, dynamic> json) = _$MissedImpl.fromJson;
}
