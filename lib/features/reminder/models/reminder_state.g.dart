// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReminderStateImpl _$$ReminderStateImplFromJson(Map json) =>
    _$ReminderStateImpl(
      selectedHours: (json['selectedHours'] as num).toInt(),
      selectedMinutes: (json['selectedMinutes'] as num).toInt(),
      selectedWeekDays: (json['selectedWeekDays'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toSet() ??
          const {},
    );

Map<String, dynamic> _$$ReminderStateImplToJson(_$ReminderStateImpl instance) =>
    <String, dynamic>{
      'selectedHours': instance.selectedHours,
      'selectedMinutes': instance.selectedMinutes,
      'selectedWeekDays': instance.selectedWeekDays.toList(),
    };
