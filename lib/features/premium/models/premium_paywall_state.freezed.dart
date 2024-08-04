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
  String? get selectedSubscriptionId => throw _privateConstructorUsedError;
  Map<String, StoreProduct?> get storeProducts =>
      throw _privateConstructorUsedError;
  bool get premiumPurchaseProcessing => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PremiumPaywallStateCopyWith<PremiumPaywallState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PremiumPaywallStateCopyWith<$Res> {
  factory $PremiumPaywallStateCopyWith(
          PremiumPaywallState value, $Res Function(PremiumPaywallState) then) =
      _$PremiumPaywallStateCopyWithImpl<$Res, PremiumPaywallState>;
  @useResult
  $Res call(
      {String? selectedSubscriptionId,
      Map<String, StoreProduct?> storeProducts,
      bool premiumPurchaseProcessing});
}

/// @nodoc
class _$PremiumPaywallStateCopyWithImpl<$Res, $Val extends PremiumPaywallState>
    implements $PremiumPaywallStateCopyWith<$Res> {
  _$PremiumPaywallStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedSubscriptionId = freezed,
    Object? storeProducts = null,
    Object? premiumPurchaseProcessing = null,
  }) {
    return _then(_value.copyWith(
      selectedSubscriptionId: freezed == selectedSubscriptionId
          ? _value.selectedSubscriptionId
          : selectedSubscriptionId // ignore: cast_nullable_to_non_nullable
              as String?,
      storeProducts: null == storeProducts
          ? _value.storeProducts
          : storeProducts // ignore: cast_nullable_to_non_nullable
              as Map<String, StoreProduct?>,
      premiumPurchaseProcessing: null == premiumPurchaseProcessing
          ? _value.premiumPurchaseProcessing
          : premiumPurchaseProcessing // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PremiumPaywallDataImplCopyWith<$Res>
    implements $PremiumPaywallStateCopyWith<$Res> {
  factory _$$PremiumPaywallDataImplCopyWith(_$PremiumPaywallDataImpl value,
          $Res Function(_$PremiumPaywallDataImpl) then) =
      __$$PremiumPaywallDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? selectedSubscriptionId,
      Map<String, StoreProduct?> storeProducts,
      bool premiumPurchaseProcessing});
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
    Object? storeProducts = null,
    Object? premiumPurchaseProcessing = null,
  }) {
    return _then(_$PremiumPaywallDataImpl(
      selectedSubscriptionId: freezed == selectedSubscriptionId
          ? _value.selectedSubscriptionId
          : selectedSubscriptionId // ignore: cast_nullable_to_non_nullable
              as String?,
      storeProducts: null == storeProducts
          ? _value._storeProducts
          : storeProducts // ignore: cast_nullable_to_non_nullable
              as Map<String, StoreProduct?>,
      premiumPurchaseProcessing: null == premiumPurchaseProcessing
          ? _value.premiumPurchaseProcessing
          : premiumPurchaseProcessing // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PremiumPaywallDataImpl implements _PremiumPaywallData {
  const _$PremiumPaywallDataImpl(
      {this.selectedSubscriptionId,
      final Map<String, StoreProduct?> storeProducts =
          const <String, StoreProduct?>{},
      this.premiumPurchaseProcessing = false})
      : _storeProducts = storeProducts;

  @override
  final String? selectedSubscriptionId;
  final Map<String, StoreProduct?> _storeProducts;
  @override
  @JsonKey()
  Map<String, StoreProduct?> get storeProducts {
    if (_storeProducts is EqualUnmodifiableMapView) return _storeProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_storeProducts);
  }

  @override
  @JsonKey()
  final bool premiumPurchaseProcessing;

  @override
  String toString() {
    return 'PremiumPaywallState(selectedSubscriptionId: $selectedSubscriptionId, storeProducts: $storeProducts, premiumPurchaseProcessing: $premiumPurchaseProcessing)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PremiumPaywallDataImpl &&
            (identical(other.selectedSubscriptionId, selectedSubscriptionId) ||
                other.selectedSubscriptionId == selectedSubscriptionId) &&
            const DeepCollectionEquality()
                .equals(other._storeProducts, _storeProducts) &&
            (identical(other.premiumPurchaseProcessing,
                    premiumPurchaseProcessing) ||
                other.premiumPurchaseProcessing == premiumPurchaseProcessing));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      selectedSubscriptionId,
      const DeepCollectionEquality().hash(_storeProducts),
      premiumPurchaseProcessing);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PremiumPaywallDataImplCopyWith<_$PremiumPaywallDataImpl> get copyWith =>
      __$$PremiumPaywallDataImplCopyWithImpl<_$PremiumPaywallDataImpl>(
          this, _$identity);
}

abstract class _PremiumPaywallData implements PremiumPaywallState {
  const factory _PremiumPaywallData(
      {final String? selectedSubscriptionId,
      final Map<String, StoreProduct?> storeProducts,
      final bool premiumPurchaseProcessing}) = _$PremiumPaywallDataImpl;

  @override
  String? get selectedSubscriptionId;
  @override
  Map<String, StoreProduct?> get storeProducts;
  @override
  bool get premiumPurchaseProcessing;
  @override
  @JsonKey(ignore: true)
  _$$PremiumPaywallDataImplCopyWith<_$PremiumPaywallDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
