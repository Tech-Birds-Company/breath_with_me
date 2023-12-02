// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reminder_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReminderState _$ReminderStateFromJson(Map<String, dynamic> json) {
  return _ReminderState.fromJson(json);
}

/// @nodoc
mixin _$ReminderState {
  int get selectedHours => throw _privateConstructorUsedError;
  int get selectedMinutes => throw _privateConstructorUsedError;
  Set<int> get selectedWeekDays => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReminderStateCopyWith<ReminderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReminderStateCopyWith<$Res> {
  factory $ReminderStateCopyWith(
          ReminderState value, $Res Function(ReminderState) then) =
      _$ReminderStateCopyWithImpl<$Res, ReminderState>;
  @useResult
  $Res call(
      {int selectedHours, int selectedMinutes, Set<int> selectedWeekDays});
}

/// @nodoc
class _$ReminderStateCopyWithImpl<$Res, $Val extends ReminderState>
    implements $ReminderStateCopyWith<$Res> {
  _$ReminderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedHours = null,
    Object? selectedMinutes = null,
    Object? selectedWeekDays = null,
  }) {
    return _then(_value.copyWith(
      selectedHours: null == selectedHours
          ? _value.selectedHours
          : selectedHours // ignore: cast_nullable_to_non_nullable
              as int,
      selectedMinutes: null == selectedMinutes
          ? _value.selectedMinutes
          : selectedMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      selectedWeekDays: null == selectedWeekDays
          ? _value.selectedWeekDays
          : selectedWeekDays // ignore: cast_nullable_to_non_nullable
              as Set<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReminderStateImplCopyWith<$Res>
    implements $ReminderStateCopyWith<$Res> {
  factory _$$ReminderStateImplCopyWith(
          _$ReminderStateImpl value, $Res Function(_$ReminderStateImpl) then) =
      __$$ReminderStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int selectedHours, int selectedMinutes, Set<int> selectedWeekDays});
}

/// @nodoc
class __$$ReminderStateImplCopyWithImpl<$Res>
    extends _$ReminderStateCopyWithImpl<$Res, _$ReminderStateImpl>
    implements _$$ReminderStateImplCopyWith<$Res> {
  __$$ReminderStateImplCopyWithImpl(
      _$ReminderStateImpl _value, $Res Function(_$ReminderStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedHours = null,
    Object? selectedMinutes = null,
    Object? selectedWeekDays = null,
  }) {
    return _then(_$ReminderStateImpl(
      selectedHours: null == selectedHours
          ? _value.selectedHours
          : selectedHours // ignore: cast_nullable_to_non_nullable
              as int,
      selectedMinutes: null == selectedMinutes
          ? _value.selectedMinutes
          : selectedMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      selectedWeekDays: null == selectedWeekDays
          ? _value._selectedWeekDays
          : selectedWeekDays // ignore: cast_nullable_to_non_nullable
              as Set<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReminderStateImpl extends _ReminderState with DiagnosticableTreeMixin {
  const _$ReminderStateImpl(
      {required this.selectedHours,
      required this.selectedMinutes,
      final Set<int> selectedWeekDays = const {}})
      : _selectedWeekDays = selectedWeekDays,
        super._();

  factory _$ReminderStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReminderStateImplFromJson(json);

  @override
  final int selectedHours;
  @override
  final int selectedMinutes;
  final Set<int> _selectedWeekDays;
  @override
  @JsonKey()
  Set<int> get selectedWeekDays {
    if (_selectedWeekDays is EqualUnmodifiableSetView) return _selectedWeekDays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_selectedWeekDays);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReminderState(selectedHours: $selectedHours, selectedMinutes: $selectedMinutes, selectedWeekDays: $selectedWeekDays)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ReminderState'))
      ..add(DiagnosticsProperty('selectedHours', selectedHours))
      ..add(DiagnosticsProperty('selectedMinutes', selectedMinutes))
      ..add(DiagnosticsProperty('selectedWeekDays', selectedWeekDays));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReminderStateImpl &&
            (identical(other.selectedHours, selectedHours) ||
                other.selectedHours == selectedHours) &&
            (identical(other.selectedMinutes, selectedMinutes) ||
                other.selectedMinutes == selectedMinutes) &&
            const DeepCollectionEquality()
                .equals(other._selectedWeekDays, _selectedWeekDays));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, selectedHours, selectedMinutes,
      const DeepCollectionEquality().hash(_selectedWeekDays));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReminderStateImplCopyWith<_$ReminderStateImpl> get copyWith =>
      __$$ReminderStateImplCopyWithImpl<_$ReminderStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReminderStateImplToJson(
      this,
    );
  }
}

abstract class _ReminderState extends ReminderState {
  const factory _ReminderState(
      {required final int selectedHours,
      required final int selectedMinutes,
      final Set<int> selectedWeekDays}) = _$ReminderStateImpl;
  const _ReminderState._() : super._();

  factory _ReminderState.fromJson(Map<String, dynamic> json) =
      _$ReminderStateImpl.fromJson;

  @override
  int get selectedHours;
  @override
  int get selectedMinutes;
  @override
  Set<int> get selectedWeekDays;
  @override
  @JsonKey(ignore: true)
  _$$ReminderStateImplCopyWith<_$ReminderStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
