// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'premium_banner_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PremiumBannerState {
  int get premiumBannerTracksPosition => throw _privateConstructorUsedError;
  bool get premiumBannerTracksEnabled => throw _privateConstructorUsedError;
  bool get premiumBannerTracksWasHidden => throw _privateConstructorUsedError;
  bool get isPremiumUser => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PremiumBannerStateCopyWith<PremiumBannerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PremiumBannerStateCopyWith<$Res> {
  factory $PremiumBannerStateCopyWith(
          PremiumBannerState value, $Res Function(PremiumBannerState) then) =
      _$PremiumBannerStateCopyWithImpl<$Res, PremiumBannerState>;
  @useResult
  $Res call(
      {int premiumBannerTracksPosition,
      bool premiumBannerTracksEnabled,
      bool premiumBannerTracksWasHidden,
      bool isPremiumUser});
}

/// @nodoc
class _$PremiumBannerStateCopyWithImpl<$Res, $Val extends PremiumBannerState>
    implements $PremiumBannerStateCopyWith<$Res> {
  _$PremiumBannerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? premiumBannerTracksPosition = null,
    Object? premiumBannerTracksEnabled = null,
    Object? premiumBannerTracksWasHidden = null,
    Object? isPremiumUser = null,
  }) {
    return _then(_value.copyWith(
      premiumBannerTracksPosition: null == premiumBannerTracksPosition
          ? _value.premiumBannerTracksPosition
          : premiumBannerTracksPosition // ignore: cast_nullable_to_non_nullable
              as int,
      premiumBannerTracksEnabled: null == premiumBannerTracksEnabled
          ? _value.premiumBannerTracksEnabled
          : premiumBannerTracksEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      premiumBannerTracksWasHidden: null == premiumBannerTracksWasHidden
          ? _value.premiumBannerTracksWasHidden
          : premiumBannerTracksWasHidden // ignore: cast_nullable_to_non_nullable
              as bool,
      isPremiumUser: null == isPremiumUser
          ? _value.isPremiumUser
          : isPremiumUser // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PremiumBannerStateImplCopyWith<$Res>
    implements $PremiumBannerStateCopyWith<$Res> {
  factory _$$PremiumBannerStateImplCopyWith(_$PremiumBannerStateImpl value,
          $Res Function(_$PremiumBannerStateImpl) then) =
      __$$PremiumBannerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int premiumBannerTracksPosition,
      bool premiumBannerTracksEnabled,
      bool premiumBannerTracksWasHidden,
      bool isPremiumUser});
}

/// @nodoc
class __$$PremiumBannerStateImplCopyWithImpl<$Res>
    extends _$PremiumBannerStateCopyWithImpl<$Res, _$PremiumBannerStateImpl>
    implements _$$PremiumBannerStateImplCopyWith<$Res> {
  __$$PremiumBannerStateImplCopyWithImpl(_$PremiumBannerStateImpl _value,
      $Res Function(_$PremiumBannerStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? premiumBannerTracksPosition = null,
    Object? premiumBannerTracksEnabled = null,
    Object? premiumBannerTracksWasHidden = null,
    Object? isPremiumUser = null,
  }) {
    return _then(_$PremiumBannerStateImpl(
      premiumBannerTracksPosition: null == premiumBannerTracksPosition
          ? _value.premiumBannerTracksPosition
          : premiumBannerTracksPosition // ignore: cast_nullable_to_non_nullable
              as int,
      premiumBannerTracksEnabled: null == premiumBannerTracksEnabled
          ? _value.premiumBannerTracksEnabled
          : premiumBannerTracksEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      premiumBannerTracksWasHidden: null == premiumBannerTracksWasHidden
          ? _value.premiumBannerTracksWasHidden
          : premiumBannerTracksWasHidden // ignore: cast_nullable_to_non_nullable
              as bool,
      isPremiumUser: null == isPremiumUser
          ? _value.isPremiumUser
          : isPremiumUser // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PremiumBannerStateImpl implements _PremiumBannerState {
  const _$PremiumBannerStateImpl(
      {this.premiumBannerTracksPosition = 0,
      this.premiumBannerTracksEnabled = false,
      this.premiumBannerTracksWasHidden = false,
      this.isPremiumUser = false});

  @override
  @JsonKey()
  final int premiumBannerTracksPosition;
  @override
  @JsonKey()
  final bool premiumBannerTracksEnabled;
  @override
  @JsonKey()
  final bool premiumBannerTracksWasHidden;
  @override
  @JsonKey()
  final bool isPremiumUser;

  @override
  String toString() {
    return 'PremiumBannerState(premiumBannerTracksPosition: $premiumBannerTracksPosition, premiumBannerTracksEnabled: $premiumBannerTracksEnabled, premiumBannerTracksWasHidden: $premiumBannerTracksWasHidden, isPremiumUser: $isPremiumUser)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PremiumBannerStateImpl &&
            (identical(other.premiumBannerTracksPosition,
                    premiumBannerTracksPosition) ||
                other.premiumBannerTracksPosition ==
                    premiumBannerTracksPosition) &&
            (identical(other.premiumBannerTracksEnabled,
                    premiumBannerTracksEnabled) ||
                other.premiumBannerTracksEnabled ==
                    premiumBannerTracksEnabled) &&
            (identical(other.premiumBannerTracksWasHidden,
                    premiumBannerTracksWasHidden) ||
                other.premiumBannerTracksWasHidden ==
                    premiumBannerTracksWasHidden) &&
            (identical(other.isPremiumUser, isPremiumUser) ||
                other.isPremiumUser == isPremiumUser));
  }

  @override
  int get hashCode => Object.hash(runtimeType, premiumBannerTracksPosition,
      premiumBannerTracksEnabled, premiumBannerTracksWasHidden, isPremiumUser);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PremiumBannerStateImplCopyWith<_$PremiumBannerStateImpl> get copyWith =>
      __$$PremiumBannerStateImplCopyWithImpl<_$PremiumBannerStateImpl>(
          this, _$identity);
}

abstract class _PremiumBannerState implements PremiumBannerState {
  const factory _PremiumBannerState(
      {final int premiumBannerTracksPosition,
      final bool premiumBannerTracksEnabled,
      final bool premiumBannerTracksWasHidden,
      final bool isPremiumUser}) = _$PremiumBannerStateImpl;

  @override
  int get premiumBannerTracksPosition;
  @override
  bool get premiumBannerTracksEnabled;
  @override
  bool get premiumBannerTracksWasHidden;
  @override
  bool get isPremiumUser;
  @override
  @JsonKey(ignore: true)
  _$$PremiumBannerStateImplCopyWith<_$PremiumBannerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
