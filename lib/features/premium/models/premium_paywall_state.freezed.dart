// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'premium_paywall_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PremiumPaywallState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? selectedSubscriptionId, bool premiumPurchaseProcessing)
        data,
    required TResult Function() loading,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String? selectedSubscriptionId, bool premiumPurchaseProcessing)?
        data,
    TResult? Function()? loading,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String? selectedSubscriptionId, bool premiumPurchaseProcessing)?
        data,
    TResult Function()? loading,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PremiumPaywallData value) data,
    required TResult Function(PremiumPaywallLoading value) loading,
    required TResult Function(PremiumPaywallError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PremiumPaywallData value)? data,
    TResult? Function(PremiumPaywallLoading value)? loading,
    TResult? Function(PremiumPaywallError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PremiumPaywallData value)? data,
    TResult Function(PremiumPaywallLoading value)? loading,
    TResult Function(PremiumPaywallError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PremiumPaywallStateCopyWith<$Res> {
  factory $PremiumPaywallStateCopyWith(
          PremiumPaywallState value, $Res Function(PremiumPaywallState) then) =
      _$PremiumPaywallStateCopyWithImpl<$Res, PremiumPaywallState>;
}

/// @nodoc
class _$PremiumPaywallStateCopyWithImpl<$Res, $Val extends PremiumPaywallState>
    implements $PremiumPaywallStateCopyWith<$Res> {
  _$PremiumPaywallStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$PremiumPaywallDataImplCopyWith<$Res> {
  factory _$$PremiumPaywallDataImplCopyWith(_$PremiumPaywallDataImpl value,
          $Res Function(_$PremiumPaywallDataImpl) then) =
      __$$PremiumPaywallDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? selectedSubscriptionId, bool premiumPurchaseProcessing});
}

/// @nodoc
class __$$PremiumPaywallDataImplCopyWithImpl<$Res>
    extends _$PremiumPaywallStateCopyWithImpl<$Res, _$PremiumPaywallDataImpl>
    implements _$$PremiumPaywallDataImplCopyWith<$Res> {
  __$$PremiumPaywallDataImplCopyWithImpl(_$PremiumPaywallDataImpl _value,
      $Res Function(_$PremiumPaywallDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedSubscriptionId = freezed,
    Object? premiumPurchaseProcessing = null,
  }) {
    return _then(_$PremiumPaywallDataImpl(
      selectedSubscriptionId: freezed == selectedSubscriptionId
          ? _value.selectedSubscriptionId
          : selectedSubscriptionId // ignore: cast_nullable_to_non_nullable
              as String?,
      premiumPurchaseProcessing: null == premiumPurchaseProcessing
          ? _value.premiumPurchaseProcessing
          : premiumPurchaseProcessing // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PremiumPaywallDataImpl implements PremiumPaywallData {
  const _$PremiumPaywallDataImpl(
      {this.selectedSubscriptionId, this.premiumPurchaseProcessing = false});

  @override
  final String? selectedSubscriptionId;
  @override
  @JsonKey()
  final bool premiumPurchaseProcessing;

  @override
  String toString() {
    return 'PremiumPaywallState.data(selectedSubscriptionId: $selectedSubscriptionId, premiumPurchaseProcessing: $premiumPurchaseProcessing)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PremiumPaywallDataImpl &&
            (identical(other.selectedSubscriptionId, selectedSubscriptionId) ||
                other.selectedSubscriptionId == selectedSubscriptionId) &&
            (identical(other.premiumPurchaseProcessing,
                    premiumPurchaseProcessing) ||
                other.premiumPurchaseProcessing == premiumPurchaseProcessing));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, selectedSubscriptionId, premiumPurchaseProcessing);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PremiumPaywallDataImplCopyWith<_$PremiumPaywallDataImpl> get copyWith =>
      __$$PremiumPaywallDataImplCopyWithImpl<_$PremiumPaywallDataImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? selectedSubscriptionId, bool premiumPurchaseProcessing)
        data,
    required TResult Function() loading,
    required TResult Function() error,
  }) {
    return data(selectedSubscriptionId, premiumPurchaseProcessing);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String? selectedSubscriptionId, bool premiumPurchaseProcessing)?
        data,
    TResult? Function()? loading,
    TResult? Function()? error,
  }) {
    return data?.call(selectedSubscriptionId, premiumPurchaseProcessing);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String? selectedSubscriptionId, bool premiumPurchaseProcessing)?
        data,
    TResult Function()? loading,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(selectedSubscriptionId, premiumPurchaseProcessing);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PremiumPaywallData value) data,
    required TResult Function(PremiumPaywallLoading value) loading,
    required TResult Function(PremiumPaywallError value) error,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PremiumPaywallData value)? data,
    TResult? Function(PremiumPaywallLoading value)? loading,
    TResult? Function(PremiumPaywallError value)? error,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PremiumPaywallData value)? data,
    TResult Function(PremiumPaywallLoading value)? loading,
    TResult Function(PremiumPaywallError value)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class PremiumPaywallData implements PremiumPaywallState {
  const factory PremiumPaywallData(
      {final String? selectedSubscriptionId,
      final bool premiumPurchaseProcessing}) = _$PremiumPaywallDataImpl;

  String? get selectedSubscriptionId;
  bool get premiumPurchaseProcessing;
  @JsonKey(ignore: true)
  _$$PremiumPaywallDataImplCopyWith<_$PremiumPaywallDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PremiumPaywallLoadingImplCopyWith<$Res> {
  factory _$$PremiumPaywallLoadingImplCopyWith(
          _$PremiumPaywallLoadingImpl value,
          $Res Function(_$PremiumPaywallLoadingImpl) then) =
      __$$PremiumPaywallLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PremiumPaywallLoadingImplCopyWithImpl<$Res>
    extends _$PremiumPaywallStateCopyWithImpl<$Res, _$PremiumPaywallLoadingImpl>
    implements _$$PremiumPaywallLoadingImplCopyWith<$Res> {
  __$$PremiumPaywallLoadingImplCopyWithImpl(_$PremiumPaywallLoadingImpl _value,
      $Res Function(_$PremiumPaywallLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PremiumPaywallLoadingImpl implements PremiumPaywallLoading {
  const _$PremiumPaywallLoadingImpl();

  @override
  String toString() {
    return 'PremiumPaywallState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PremiumPaywallLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? selectedSubscriptionId, bool premiumPurchaseProcessing)
        data,
    required TResult Function() loading,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String? selectedSubscriptionId, bool premiumPurchaseProcessing)?
        data,
    TResult? Function()? loading,
    TResult? Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String? selectedSubscriptionId, bool premiumPurchaseProcessing)?
        data,
    TResult Function()? loading,
    TResult Function()? error,
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
    required TResult Function(PremiumPaywallData value) data,
    required TResult Function(PremiumPaywallLoading value) loading,
    required TResult Function(PremiumPaywallError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PremiumPaywallData value)? data,
    TResult? Function(PremiumPaywallLoading value)? loading,
    TResult? Function(PremiumPaywallError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PremiumPaywallData value)? data,
    TResult Function(PremiumPaywallLoading value)? loading,
    TResult Function(PremiumPaywallError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class PremiumPaywallLoading implements PremiumPaywallState {
  const factory PremiumPaywallLoading() = _$PremiumPaywallLoadingImpl;
}

/// @nodoc
abstract class _$$PremiumPaywallErrorImplCopyWith<$Res> {
  factory _$$PremiumPaywallErrorImplCopyWith(_$PremiumPaywallErrorImpl value,
          $Res Function(_$PremiumPaywallErrorImpl) then) =
      __$$PremiumPaywallErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PremiumPaywallErrorImplCopyWithImpl<$Res>
    extends _$PremiumPaywallStateCopyWithImpl<$Res, _$PremiumPaywallErrorImpl>
    implements _$$PremiumPaywallErrorImplCopyWith<$Res> {
  __$$PremiumPaywallErrorImplCopyWithImpl(_$PremiumPaywallErrorImpl _value,
      $Res Function(_$PremiumPaywallErrorImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PremiumPaywallErrorImpl implements PremiumPaywallError {
  const _$PremiumPaywallErrorImpl();

  @override
  String toString() {
    return 'PremiumPaywallState.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PremiumPaywallErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? selectedSubscriptionId, bool premiumPurchaseProcessing)
        data,
    required TResult Function() loading,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String? selectedSubscriptionId, bool premiumPurchaseProcessing)?
        data,
    TResult? Function()? loading,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String? selectedSubscriptionId, bool premiumPurchaseProcessing)?
        data,
    TResult Function()? loading,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PremiumPaywallData value) data,
    required TResult Function(PremiumPaywallLoading value) loading,
    required TResult Function(PremiumPaywallError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PremiumPaywallData value)? data,
    TResult? Function(PremiumPaywallLoading value)? loading,
    TResult? Function(PremiumPaywallError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PremiumPaywallData value)? data,
    TResult Function(PremiumPaywallLoading value)? loading,
    TResult Function(PremiumPaywallError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class PremiumPaywallError implements PremiumPaywallState {
  const factory PremiumPaywallError() = _$PremiumPaywallErrorImpl;
}
