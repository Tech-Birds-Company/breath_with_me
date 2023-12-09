import 'package:breathe_with_me/common/widgets/bwm_action_button.dart';
import 'package:breathe_with_me/common/widgets/bwm_app_bar.dart';
import 'package:breathe_with_me/di/di.dart';
import 'package:breathe_with_me/features/reminder/blocs/reminder_bloc.dart';
import 'package:breathe_with_me/features/reminder/models/reminder_state.dart';
import 'package:breathe_with_me/features/reminder/widgets/time_picker.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rxdart/rxdart.dart';

class ReminderPage extends HookConsumerWidget {
  const ReminderPage({super.key});

  static const _weekDays = [
    DateTime.monday,
    DateTime.tuesday,
    DateTime.wednesday,
    DateTime.thursday,
    DateTime.friday,
    DateTime.saturday,
    DateTime.sunday,
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    final bloc = ref.read(Di.shared.bloc.reminder);

    return Scaffold(
      appBar: BWMAppBar(title: LocaleKeys.reminderTitle.tr()),
      backgroundColor: theme.primaryBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BWMTimePicker(
                  initialHours: bloc.state.selectedWeekDays.isEmpty
                      ? DateTime.now().toLocal().hour
                      : bloc.state.selectedHours,
                  initialMinutes: bloc.state.selectedWeekDays.isEmpty
                      ? DateTime.now().toLocal().minute
                      : bloc.state.selectedMinutes,
                  onHoursChanged: bloc.onHoursChanged,
                  onMinutesChanged: bloc.onMinutesChanged,
                ),
                const SizedBox(height: 20),
                ...ListTile.divideTiles(
                  context: context,
                  color: const Color(0x995D5D6D),
                  tiles: _weekDays.mapIndexed(
                    (index, _) {
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Text(
                          'reminderEveryWd${index + 1}'.tr(),
                          style: theme.typography.bodyM.copyWith(
                            color: theme.primaryColor,
                          ),
                        ),
                        trailing:
                            BlocSelector<ReminderBloc, ReminderState, bool>(
                          bloc: bloc,
                          selector: (state) =>
                              state.selectedWeekDays.contains(index + 1),
                          builder: (context, selected) => Switch.adaptive(
                            activeColor: theme.secondaryColor,
                            value: selected,
                            onChanged: (_) => bloc.onWeekDaySelected(index + 1),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                StreamBuilder<bool>(
                  stream: Rx.combineLatest2(
                    bloc.stream,
                    bloc.cachedBlocStateStream,
                    (state, cache) {
                      final stateChanged = state != cache;
                      final weekDaysSelected =
                          state.selectedWeekDays.isNotEmpty;
                      final weekDaysBeenSelected =
                          cache?.selectedWeekDays.isNotEmpty ?? false;
                      return stateChanged &&
                          (weekDaysSelected || weekDaysBeenSelected);
                    },
                  ),
                  initialData: false,
                  builder: (context, snapshot) {
                    final saveAvailable = snapshot.requireData;
                    return saveAvailable
                        ? BWMActionButton(
                            title: LocaleKeys.reminderSaveButtonTitle.tr(),
                            width: double.infinity,
                            height: 40,
                            onPressed: bloc.saveReminder,
                          )
                        : const SizedBox.shrink();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
