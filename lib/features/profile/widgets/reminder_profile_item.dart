import 'package:breathe_with_me/features/profile/widgets/profile_menu_button.dart';
import 'package:breathe_with_me/features/reminder/models/reminder_state.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ReminderProfileItem extends StatelessWidget {
  final Stream<ReminderState?> cachedBlocStateStream;
  final VoidCallback onOpenReminder;

  const ReminderProfileItem({
    required this.cachedBlocStateStream,
    required this.onOpenReminder,
    super.key,
  });

  @override
  Widget build(BuildContext context) => StreamBuilder(
        stream: cachedBlocStateStream.map(
          (state) {
            if (state == null || !state.isReminderEnabled) {
              return LocaleKeys.reminderDisabled.tr();
            }

            final hours = state.selectedHours;
            final minutes = state.selectedMinutes;

            final selectedWeekDays = state.selectedWeekDays.toList()
              ..sort((a, b) => a.compareTo(b));

            final timeOfDay = TimeOfDay(hour: hours, minute: minutes);
            final timeFormat = DateFormat.jmz();
            final formattedTime = timeFormat
                .format(
                  DateTime(0, 0, 0, timeOfDay.hour, timeOfDay.minute),
                )
                .trim();

            final weekDays = selectedWeekDays
                .map((weekDay) => 'reminderWd${weekDay}Short'.tr())
                .join(', ');
            return '$formattedTime; $weekDays';
          },
        ),
        initialData: LocaleKeys.reminderDisabled.tr(),
        builder: (context, snapshot) => ProfileMenuItem(
          title: LocaleKeys.reminderTitle.tr(),
          subtitle: snapshot.requireData,
          showIndicator: true,
          onTap: onOpenReminder,
        ),
      );
}
