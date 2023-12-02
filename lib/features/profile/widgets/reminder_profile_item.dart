import 'package:breathe_with_me/di/di.dart';
import 'package:breathe_with_me/features/profile/widgets/profile_menu_button.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReminderProfileItem extends ConsumerWidget {
  const ReminderProfileItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _ = EasyLocalization.of(context)!;
    final profileBloc = ref.read(Di.shared.bloc.profile);
    final reminderBloc = ref.read(Di.shared.bloc.reminder);
    return StreamBuilder<String>(
      initialData: LocaleKeys.reminderDisabled.tr(),
      stream: reminderBloc.cachedBlocStateStream.map(
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
      builder: (context, snapshot) {
        return ProfileMenuButton(
          title: LocaleKeys.reminderTitle.tr(),
          subtitle: snapshot.requireData,
          showArrow: true,
          onTap: profileBloc.openReminder,
        );
      },
    );
  }
}
