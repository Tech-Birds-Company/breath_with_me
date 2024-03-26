// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_settings_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProfileSettingsState _$ProfileSettingsStateFromJson(Map<String, dynamic> json) {
  return _ProfileSettingsState.fromJson(json);
}

/// @nodoc
mixin _$ProfileSettingsState {
  String get initialName => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileSettingsStateCopyWith<ProfileSettingsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileSettingsStateCopyWith<$Res> {
  factory $ProfileSettingsStateCopyWith(ProfileSettingsState value,
          $Res Function(ProfileSettingsState) then) =
      _$ProfileSettingsStateCopyWithImpl<$Res, ProfileSettingsState>;
  @useResult
  $Res call({String initialName, String name, String email});
}

/// @nodoc
class _$ProfileSettingsStateCopyWithImpl<$Res,
        $Val extends ProfileSettingsState>
    implements $ProfileSettingsStateCopyWith<$Res> {
  _$ProfileSettingsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? initialName = null,
    Object? name = null,
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      initialName: null == initialName
          ? _value.initialName
          : initialName // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfileSettingsStateImplCopyWith<$Res>
    implements $ProfileSettingsStateCopyWith<$Res> {
  factory _$$ProfileSettingsStateImplCopyWith(_$ProfileSettingsStateImpl value,
          $Res Function(_$ProfileSettingsStateImpl) then) =
      __$$ProfileSettingsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String initialName, String name, String email});
}

/// @nodoc
class __$$ProfileSettingsStateImplCopyWithImpl<$Res>
    extends _$ProfileSettingsStateCopyWithImpl<$Res, _$ProfileSettingsStateImpl>
    implements _$$ProfileSettingsStateImplCopyWith<$Res> {
  __$$ProfileSettingsStateImplCopyWithImpl(_$ProfileSettingsStateImpl _value,
      $Res Function(_$ProfileSettingsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? initialName = null,
    Object? name = null,
    Object? email = null,
  }) {
    return _then(_$ProfileSettingsStateImpl(
      initialName: null == initialName
          ? _value.initialName
          : initialName // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileSettingsStateImpl implements _ProfileSettingsState {
  const _$ProfileSettingsStateImpl(
      {required this.initialName, required this.name, required this.email});

  factory _$ProfileSettingsStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileSettingsStateImplFromJson(json);

  @override
  final String initialName;
  @override
  final String name;
  @override
  final String email;

  @override
  String toString() {
    return 'ProfileSettingsState(initialName: $initialName, name: $name, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileSettingsStateImpl &&
            (identical(other.initialName, initialName) ||
                other.initialName == initialName) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, initialName, name, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileSettingsStateImplCopyWith<_$ProfileSettingsStateImpl>
      get copyWith =>
          __$$ProfileSettingsStateImplCopyWithImpl<_$ProfileSettingsStateImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileSettingsStateImplToJson(
      this,
    );
  }
}

abstract class _ProfileSettingsState implements ProfileSettingsState {
  const factory _ProfileSettingsState(
      {required final String initialName,
      required final String name,
      required final String email}) = _$ProfileSettingsStateImpl;

  factory _ProfileSettingsState.fromJson(Map<String, dynamic> json) =
      _$ProfileSettingsStateImpl.fromJson;

  @override
  String get initialName;
  @override
  String get name;
  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$ProfileSettingsStateImplCopyWith<_$ProfileSettingsStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
