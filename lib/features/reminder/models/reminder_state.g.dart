// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReminderStateImpl _$$ReminderStateImplFromJson(Map json) =>
    _$ReminderStateImpl(
      selectedHours: json['selectedHours'] as int,
      selectedMinutes: json['selectedMinutes'] as int,
      selectedWeekDays: (json['selectedWeekDays'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toSet() ??
          const {},
    );

Map<String, dynamic> _$$ReminderStateImplToJson(_$ReminderStateImpl instance) =>
    <String, dynamic>{
      'selectedHours': instance.selectedHours,
      'selectedMinutes': instance.selectedMinutes,
      'selectedWeekDays': instance.selectedWeekDays.toList(),
    };
