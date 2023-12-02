import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:flutter/material.dart';

class BWMTimePicker extends StatefulWidget {
  final int initialHours;
  final int initialMinutes;
  final void Function(int hours) onHoursChanged;
  final void Function(int minutes) onMinutesChanged;

  const BWMTimePicker({
    required this.initialHours,
    required this.initialMinutes,
    required this.onHoursChanged,
    required this.onMinutesChanged,
    super.key,
  });

  @override
  State<BWMTimePicker> createState() => _BWMTimePickerState();
}

class _BWMTimePickerState extends State<BWMTimePicker> {
  late final _hourScrollController =
      FixedExtentScrollController(initialItem: widget.initialHours);
  late final _minuteScrollController =
      FixedExtentScrollController(initialItem: widget.initialMinutes);

  @override
  void dispose() {
    _hourScrollController.dispose();
    _minuteScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return SizedBox(
      width: double.infinity,
      height: 168,
      child: Stack(
        children: [
          Align(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: theme.gray3,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: [
              const Spacer(),
              Expanded(
                child: _TimeScroll(
                  scrollController: _hourScrollController,
                  itemsCount: 24,
                  onValueChanged: widget.onHoursChanged,
                ),
              ),
              SizedBox(
                height: 56,
                child: ColoredBox(
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: Text(
                      ':',
                      style: theme.typography.heading1.copyWith(
                        color: theme.primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: _TimeScroll(
                  scrollController: _minuteScrollController,
                  itemsCount: 60,
                  onValueChanged: widget.onMinutesChanged,
                ),
              ),
              const Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}

class _TimeScroll extends StatelessWidget {
  final FixedExtentScrollController scrollController;
  final int itemsCount;
  final void Function(int value) onValueChanged;

  const _TimeScroll({
    required this.scrollController,
    required this.itemsCount,
    required this.onValueChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;

    return ListWheelScrollView.useDelegate(
      physics: const FixedExtentScrollPhysics(),
      diameterRatio: 1.2,
      controller: scrollController,
      childDelegate: ListWheelChildBuilderDelegate(
        childCount: itemsCount,
        builder: (context, index) {
          return AnimatedBuilder(
            animation: scrollController,
            builder: (context, child) {
              return Text(
                '$index'.padLeft(2, '0'),
                textAlign: TextAlign.center,
                style: theme.typography.heading1.copyWith(
                  color: theme.primaryColor.withOpacity(
                    scrollController.selectedItem == index ? 1 : 0.5,
                  ),
                ),
              );
            },
          );
        },
      ),
      itemExtent: 45,
      onSelectedItemChanged: onValueChanged,
    );
  }
}
