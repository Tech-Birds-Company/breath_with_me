import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:flutter/material.dart';

class PremiumPaywallProduct extends StatelessWidget {
  final String productId;
  final String title;
  final String price;
  final bool selected;
  final void Function(String id)? onPressed;

  const PremiumPaywallProduct({
    required this.productId,
    required this.title,
    required this.price,
    this.selected = false,
    this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return GestureDetector(
      onTap: () => onPressed?.call(productId),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: double.infinity,
        height: 75,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            width: selected ? 2.0 : 0.5,
            color: selected ? theme.purple2 : theme.gray2,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: theme.typography.bodyMTrue.copyWith(
                        color: theme.primaryColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
              Text(
                price,
                style: theme.typography.bodyMTrue.copyWith(
                  color: theme.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
