// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_statistics_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProfileStatisticsState _$ProfileStatisticsStateFromJson(
    Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'empty':
      return _Empty.fromJson(json);
    case 'premiumOffer':
      return _PremiumOffer.fromJson(json);
    case 'streakStatistics':
      return _StreakStatistics.fromJson(json);

    default:
      throw CheckedFromJsonException(
          json,
          'runtimeType',
          'ProfileStatisticsState',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$ProfileStatisticsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() premiumOffer,
    required TResult Function(StreakStatisticsData streakStatistics)
        streakStatistics,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? premiumOffer,
    TResult? Function(StreakStatisticsData streakStatistics)? streakStatistics,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? premiumOffer,
    TResult Function(StreakStatisticsData streakStatistics)? streakStatistics,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Empty value) empty,
    required TResult Function(_PremiumOffer value) premiumOffer,
    required TResult Function(_StreakStatistics value) streakStatistics,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Empty value)? empty,
    TResult? Function(_PremiumOffer value)? premiumOffer,
    TResult? Function(_StreakStatistics value)? streakStatistics,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Empty value)? empty,
    TResult Function(_PremiumOffer value)? premiumOffer,
    TResult Function(_StreakStatistics value)? streakStatistics,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileStatisticsStateCopyWith<$Res> {
  factory $ProfileStatisticsStateCopyWith(ProfileStatisticsState value,
          $Res Function(ProfileStatisticsState) then) =
      _$ProfileStatisticsStateCopyWithImpl<$Res, ProfileStatisticsState>;
}

/// @nodoc
class _$ProfileStatisticsStateCopyWithImpl<$Res,
        $Val extends ProfileStatisticsState>
    implements $ProfileStatisticsStateCopyWith<$Res> {
  _$ProfileStatisticsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$EmptyImplCopyWith<$Res> {
  factory _$$EmptyImplCopyWith(
          _$EmptyImpl value, $Res Function(_$EmptyImpl) then) =
      __$$EmptyImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EmptyImplCopyWithImpl<$Res>
    extends _$ProfileStatisticsStateCopyWithImpl<$Res, _$EmptyImpl>
    implements _$$EmptyImplCopyWith<$Res> {
  __$$EmptyImplCopyWithImpl(
      _$EmptyImpl _value, $Res Function(_$EmptyImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$EmptyImpl implements _Empty {
  const _$EmptyImpl({final String? $type}) : $type = $type ?? 'empty';

  factory _$EmptyImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmptyImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ProfileStatisticsState.empty()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EmptyImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() premiumOffer,
    required TResult Function(StreakStatisticsData streakStatistics)
        streakStatistics,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? premiumOffer,
    TResult? Function(StreakStatisticsData streakStatistics)? streakStatistics,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? premiumOffer,
    TResult Function(StreakStatisticsData streakStatistics)? streakStatistics,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Empty value) empty,
    required TResult Function(_PremiumOffer value) premiumOffer,
    required TResult Function(_StreakStatistics value) streakStatistics,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Empty value)? empty,
    TResult? Function(_PremiumOffer value)? premiumOffer,
    TResult? Function(_StreakStatistics value)? streakStatistics,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Empty value)? empty,
    TResult Function(_PremiumOffer value)? premiumOffer,
    TResult Function(_StreakStatistics value)? streakStatistics,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$EmptyImplToJson(
      this,
    );
  }
}

abstract class _Empty implements ProfileStatisticsState {
  const factory _Empty() = _$EmptyImpl;

  factory _Empty.fromJson(Map<String, dynamic> json) = _$EmptyImpl.fromJson;
}

/// @nodoc
abstract class _$$PremiumOfferImplCopyWith<$Res> {
  factory _$$PremiumOfferImplCopyWith(
          _$PremiumOfferImpl value, $Res Function(_$PremiumOfferImpl) then) =
      __$$PremiumOfferImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PremiumOfferImplCopyWithImpl<$Res>
    extends _$ProfileStatisticsStateCopyWithImpl<$Res, _$PremiumOfferImpl>
    implements _$$PremiumOfferImplCopyWith<$Res> {
  __$$PremiumOfferImplCopyWithImpl(
      _$PremiumOfferImpl _value, $Res Function(_$PremiumOfferImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$PremiumOfferImpl implements _PremiumOffer {
  const _$PremiumOfferImpl({final String? $type})
      : $type = $type ?? 'premiumOffer';

  factory _$PremiumOfferImpl.fromJson(Map<String, dynamic> json) =>
      _$$PremiumOfferImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ProfileStatisticsState.premiumOffer()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PremiumOfferImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() premiumOffer,
    required TResult Function(StreakStatisticsData streakStatistics)
        streakStatistics,
  }) {
    return premiumOffer();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? premiumOffer,
    TResult? Function(StreakStatisticsData streakStatistics)? streakStatistics,
  }) {
    return premiumOffer?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? premiumOffer,
    TResult Function(StreakStatisticsData streakStatistics)? streakStatistics,
    required TResult orElse(),
  }) {
    if (premiumOffer != null) {
      return premiumOffer();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Empty value) empty,
    required TResult Function(_PremiumOffer value) premiumOffer,
    required TResult Function(_StreakStatistics value) streakStatistics,
  }) {
    return premiumOffer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Empty value)? empty,
    TResult? Function(_PremiumOffer value)? premiumOffer,
    TResult? Function(_StreakStatistics value)? streakStatistics,
  }) {
    return premiumOffer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Empty value)? empty,
    TResult Function(_PremiumOffer value)? premiumOffer,
    TResult Function(_StreakStatistics value)? streakStatistics,
    required TResult orElse(),
  }) {
    if (premiumOffer != null) {
      return premiumOffer(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PremiumOfferImplToJson(
      this,
    );
  }
}

abstract class _PremiumOffer implements ProfileStatisticsState {
  const factory _PremiumOffer() = _$PremiumOfferImpl;

  factory _PremiumOffer.fromJson(Map<String, dynamic> json) =
      _$PremiumOfferImpl.fromJson;
}

/// @nodoc
abstract class _$$StreakStatisticsImplCopyWith<$Res> {
  factory _$$StreakStatisticsImplCopyWith(_$StreakStatisticsImpl value,
          $Res Function(_$StreakStatisticsImpl) then) =
      __$$StreakStatisticsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({StreakStatisticsData streakStatistics});

  $StreakStatisticsDataCopyWith<$Res> get streakStatistics;
}

/// @nodoc
class __$$StreakStatisticsImplCopyWithImpl<$Res>
    extends _$ProfileStatisticsStateCopyWithImpl<$Res, _$StreakStatisticsImpl>
    implements _$$StreakStatisticsImplCopyWith<$Res> {
  __$$StreakStatisticsImplCopyWithImpl(_$StreakStatisticsImpl _value,
      $Res Function(_$StreakStatisticsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? streakStatistics = null,
  }) {
    return _then(_$StreakStatisticsImpl(
      null == streakStatistics
          ? _value.streakStatistics
          : streakStatistics // ignore: cast_nullable_to_non_nullable
              as StreakStatisticsData,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $StreakStatisticsDataCopyWith<$Res> get streakStatistics {
    return $StreakStatisticsDataCopyWith<$Res>(_value.streakStatistics,
        (value) {
      return _then(_value.copyWith(streakStatistics: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$StreakStatisticsImpl implements _StreakStatistics {
  const _$StreakStatisticsImpl(this.streakStatistics, {final String? $type})
      : $type = $type ?? 'streakStatistics';

  factory _$StreakStatisticsImpl.fromJson(Map<String, dynamic> json) =>
      _$$StreakStatisticsImplFromJson(json);

  @override
  final StreakStatisticsData streakStatistics;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ProfileStatisticsState.streakStatistics(streakStatistics: $streakStatistics)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StreakStatisticsImpl &&
            (identical(other.streakStatistics, streakStatistics) ||
                other.streakStatistics == streakStatistics));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, streakStatistics);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StreakStatisticsImplCopyWith<_$StreakStatisticsImpl> get copyWith =>
      __$$StreakStatisticsImplCopyWithImpl<_$StreakStatisticsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() premiumOffer,
    required TResult Function(StreakStatisticsData streakStatistics)
        streakStatistics,
  }) {
    return streakStatistics(this.streakStatistics);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? premiumOffer,
    TResult? Function(StreakStatisticsData streakStatistics)? streakStatistics,
  }) {
    return streakStatistics?.call(this.streakStatistics);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? premiumOffer,
    TResult Function(StreakStatisticsData streakStatistics)? streakStatistics,
    required TResult orElse(),
  }) {
    if (streakStatistics != null) {
      return streakStatistics(this.streakStatistics);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Empty value) empty,
    required TResult Function(_PremiumOffer value) premiumOffer,
    required TResult Function(_StreakStatistics value) streakStatistics,
  }) {
    return streakStatistics(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Empty value)? empty,
    TResult? Function(_PremiumOffer value)? premiumOffer,
    TResult? Function(_StreakStatistics value)? streakStatistics,
  }) {
    return streakStatistics?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Empty value)? empty,
    TResult Function(_PremiumOffer value)? premiumOffer,
    TResult Function(_StreakStatistics value)? streakStatistics,
    required TResult orElse(),
  }) {
    if (streakStatistics != null) {
      return streakStatistics(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$StreakStatisticsImplToJson(
      this,
    );
  }
}

abstract class _StreakStatistics implements ProfileStatisticsState {
  const factory _StreakStatistics(final StreakStatisticsData streakStatistics) =
      _$StreakStatisticsImpl;

  factory _StreakStatistics.fromJson(Map<String, dynamic> json) =
      _$StreakStatisticsImpl.fromJson;

  StreakStatisticsData get streakStatistics;
  @JsonKey(ignore: true)
  _$$StreakStatisticsImplCopyWith<_$StreakStatisticsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
