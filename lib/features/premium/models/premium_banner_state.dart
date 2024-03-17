import 'package:freezed_annotation/freezed_annotation.dart';

part 'premium_banner_state.freezed.dart';

@freezed
class PremiumBannerState with _$PremiumBannerState {
  const factory PremiumBannerState({
    @Default(0) int premiumBannerTracksPosition,
    @Default(false) bool premiumBannerTracksEnabled,
    @Default(false) bool premiumBannerTracksWasHidden,
    @Default(false) bool isPremiumUser,
  }) = _PremiumBannerState;
}
