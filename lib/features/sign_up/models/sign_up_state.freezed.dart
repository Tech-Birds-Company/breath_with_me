// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SignUpState _$SignUpStateFromJson(Map<String, dynamic> json) {
  return _SignUpState.fromJson(json);
}

/// @nodoc
mixin _$SignUpState {
  SignUpError get error => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get passwordConfirm => throw _privateConstructorUsedError;
  String? get firebaseError => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignUpStateCopyWith<SignUpState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpStateCopyWith<$Res> {
  factory $SignUpStateCopyWith(
          SignUpState value, $Res Function(SignUpState) then) =
      _$SignUpStateCopyWithImpl<$Res, SignUpState>;
  @useResult
  $Res call(
      {SignUpError error,
      String name,
      String email,
      String password,
      String passwordConfirm,
      String? firebaseError});
}

/// @nodoc
class _$SignUpStateCopyWithImpl<$Res, $Val extends SignUpState>
    implements $SignUpStateCopyWith<$Res> {
  _$SignUpStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? name = null,
    Object? email = null,
    Object? password = null,
    Object? passwordConfirm = null,
    Object? firebaseError = freezed,
  }) {
    return _then(_value.copyWith(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as SignUpError,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      passwordConfirm: null == passwordConfirm
          ? _value.passwordConfirm
          : passwordConfirm // ignore: cast_nullable_to_non_nullable
              as String,
      firebaseError: freezed == firebaseError
          ? _value.firebaseError
          : firebaseError // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignUpStateImplCopyWith<$Res>
    implements $SignUpStateCopyWith<$Res> {
  factory _$$SignUpStateImplCopyWith(
          _$SignUpStateImpl value, $Res Function(_$SignUpStateImpl) then) =
      __$$SignUpStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SignUpError error,
      String name,
      String email,
      String password,
      String passwordConfirm,
      String? firebaseError});
}

/// @nodoc
class __$$SignUpStateImplCopyWithImpl<$Res>
    extends _$SignUpStateCopyWithImpl<$Res, _$SignUpStateImpl>
    implements _$$SignUpStateImplCopyWith<$Res> {
  __$$SignUpStateImplCopyWithImpl(
      _$SignUpStateImpl _value, $Res Function(_$SignUpStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? name = null,
    Object? email = null,
    Object? password = null,
    Object? passwordConfirm = null,
    Object? firebaseError = freezed,
  }) {
    return _then(_$SignUpStateImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as SignUpError,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      passwordConfirm: null == passwordConfirm
          ? _value.passwordConfirm
          : passwordConfirm // ignore: cast_nullable_to_non_nullable
              as String,
      firebaseError: freezed == firebaseError
          ? _value.firebaseError
          : firebaseError // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SignUpStateImpl extends _SignUpState {
  const _$SignUpStateImpl(
      {this.error = SignUpError.none,
      this.name = '',
      this.email = '',
      this.password = '',
      this.passwordConfirm = '',
      this.firebaseError})
      : super._();

  factory _$SignUpStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignUpStateImplFromJson(json);

  @override
  @JsonKey()
  final SignUpError error;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String password;
  @override
  @JsonKey()
  final String passwordConfirm;
  @override
  final String? firebaseError;

  @override
  String toString() {
    return 'SignUpState(error: $error, name: $name, email: $email, password: $password, passwordConfirm: $passwordConfirm, firebaseError: $firebaseError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpStateImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.passwordConfirm, passwordConfirm) ||
                other.passwordConfirm == passwordConfirm) &&
            (identical(other.firebaseError, firebaseError) ||
                other.firebaseError == firebaseError));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, error, name, email, password,
      passwordConfirm, firebaseError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpStateImplCopyWith<_$SignUpStateImpl> get copyWith =>
      __$$SignUpStateImplCopyWithImpl<_$SignUpStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignUpStateImplToJson(
      this,
    );
  }
}

abstract class _SignUpState extends SignUpState {
  const factory _SignUpState(
      {final SignUpError error,
      final String name,
      final String email,
      final String password,
      final String passwordConfirm,
      final String? firebaseError}) = _$SignUpStateImpl;
  const _SignUpState._() : super._();

  factory _SignUpState.fromJson(Map<String, dynamic> json) =
      _$SignUpStateImpl.fromJson;

  @override
  SignUpError get error;
  @override
  String get name;
  @override
  String get email;
  @override
  String get password;
  @override
  String get passwordConfirm;
  @override
  String? get firebaseError;
  @override
  @JsonKey(ignore: true)
  _$$SignUpStateImplCopyWith<_$SignUpStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
