// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SignUpError _$SignUpErrorFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'emptyName':
      return EmptyName.fromJson(json);
    case 'invalidEmail':
      return InvalidEmail.fromJson(json);
    case 'passwordMismatch':
      return PasswordMismatch.fromJson(json);
    case 'firebase':
      return FirebaseError.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'SignUpError',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$SignUpError {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() emptyName,
    required TResult Function() invalidEmail,
    required TResult Function() passwordMismatch,
    required TResult Function(String message) firebase,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? emptyName,
    TResult? Function()? invalidEmail,
    TResult? Function()? passwordMismatch,
    TResult? Function(String message)? firebase,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? emptyName,
    TResult Function()? invalidEmail,
    TResult Function()? passwordMismatch,
    TResult Function(String message)? firebase,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmptyName value) emptyName,
    required TResult Function(InvalidEmail value) invalidEmail,
    required TResult Function(PasswordMismatch value) passwordMismatch,
    required TResult Function(FirebaseError value) firebase,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmptyName value)? emptyName,
    TResult? Function(InvalidEmail value)? invalidEmail,
    TResult? Function(PasswordMismatch value)? passwordMismatch,
    TResult? Function(FirebaseError value)? firebase,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmptyName value)? emptyName,
    TResult Function(InvalidEmail value)? invalidEmail,
    TResult Function(PasswordMismatch value)? passwordMismatch,
    TResult Function(FirebaseError value)? firebase,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpErrorCopyWith<$Res> {
  factory $SignUpErrorCopyWith(
          SignUpError value, $Res Function(SignUpError) then) =
      _$SignUpErrorCopyWithImpl<$Res, SignUpError>;
}

/// @nodoc
class _$SignUpErrorCopyWithImpl<$Res, $Val extends SignUpError>
    implements $SignUpErrorCopyWith<$Res> {
  _$SignUpErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$EmptyNameImplCopyWith<$Res> {
  factory _$$EmptyNameImplCopyWith(
          _$EmptyNameImpl value, $Res Function(_$EmptyNameImpl) then) =
      __$$EmptyNameImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EmptyNameImplCopyWithImpl<$Res>
    extends _$SignUpErrorCopyWithImpl<$Res, _$EmptyNameImpl>
    implements _$$EmptyNameImplCopyWith<$Res> {
  __$$EmptyNameImplCopyWithImpl(
      _$EmptyNameImpl _value, $Res Function(_$EmptyNameImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$EmptyNameImpl implements EmptyName {
  const _$EmptyNameImpl({final String? $type}) : $type = $type ?? 'emptyName';

  factory _$EmptyNameImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmptyNameImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'SignUpError.emptyName()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EmptyNameImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() emptyName,
    required TResult Function() invalidEmail,
    required TResult Function() passwordMismatch,
    required TResult Function(String message) firebase,
  }) {
    return emptyName();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? emptyName,
    TResult? Function()? invalidEmail,
    TResult? Function()? passwordMismatch,
    TResult? Function(String message)? firebase,
  }) {
    return emptyName?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? emptyName,
    TResult Function()? invalidEmail,
    TResult Function()? passwordMismatch,
    TResult Function(String message)? firebase,
    required TResult orElse(),
  }) {
    if (emptyName != null) {
      return emptyName();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmptyName value) emptyName,
    required TResult Function(InvalidEmail value) invalidEmail,
    required TResult Function(PasswordMismatch value) passwordMismatch,
    required TResult Function(FirebaseError value) firebase,
  }) {
    return emptyName(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmptyName value)? emptyName,
    TResult? Function(InvalidEmail value)? invalidEmail,
    TResult? Function(PasswordMismatch value)? passwordMismatch,
    TResult? Function(FirebaseError value)? firebase,
  }) {
    return emptyName?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmptyName value)? emptyName,
    TResult Function(InvalidEmail value)? invalidEmail,
    TResult Function(PasswordMismatch value)? passwordMismatch,
    TResult Function(FirebaseError value)? firebase,
    required TResult orElse(),
  }) {
    if (emptyName != null) {
      return emptyName(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$EmptyNameImplToJson(
      this,
    );
  }
}

abstract class EmptyName implements SignUpError {
  const factory EmptyName() = _$EmptyNameImpl;

  factory EmptyName.fromJson(Map<String, dynamic> json) =
      _$EmptyNameImpl.fromJson;
}

/// @nodoc
abstract class _$$InvalidEmailImplCopyWith<$Res> {
  factory _$$InvalidEmailImplCopyWith(
          _$InvalidEmailImpl value, $Res Function(_$InvalidEmailImpl) then) =
      __$$InvalidEmailImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InvalidEmailImplCopyWithImpl<$Res>
    extends _$SignUpErrorCopyWithImpl<$Res, _$InvalidEmailImpl>
    implements _$$InvalidEmailImplCopyWith<$Res> {
  __$$InvalidEmailImplCopyWithImpl(
      _$InvalidEmailImpl _value, $Res Function(_$InvalidEmailImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$InvalidEmailImpl implements InvalidEmail {
  const _$InvalidEmailImpl({final String? $type})
      : $type = $type ?? 'invalidEmail';

  factory _$InvalidEmailImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvalidEmailImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'SignUpError.invalidEmail()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InvalidEmailImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() emptyName,
    required TResult Function() invalidEmail,
    required TResult Function() passwordMismatch,
    required TResult Function(String message) firebase,
  }) {
    return invalidEmail();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? emptyName,
    TResult? Function()? invalidEmail,
    TResult? Function()? passwordMismatch,
    TResult? Function(String message)? firebase,
  }) {
    return invalidEmail?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? emptyName,
    TResult Function()? invalidEmail,
    TResult Function()? passwordMismatch,
    TResult Function(String message)? firebase,
    required TResult orElse(),
  }) {
    if (invalidEmail != null) {
      return invalidEmail();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmptyName value) emptyName,
    required TResult Function(InvalidEmail value) invalidEmail,
    required TResult Function(PasswordMismatch value) passwordMismatch,
    required TResult Function(FirebaseError value) firebase,
  }) {
    return invalidEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmptyName value)? emptyName,
    TResult? Function(InvalidEmail value)? invalidEmail,
    TResult? Function(PasswordMismatch value)? passwordMismatch,
    TResult? Function(FirebaseError value)? firebase,
  }) {
    return invalidEmail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmptyName value)? emptyName,
    TResult Function(InvalidEmail value)? invalidEmail,
    TResult Function(PasswordMismatch value)? passwordMismatch,
    TResult Function(FirebaseError value)? firebase,
    required TResult orElse(),
  }) {
    if (invalidEmail != null) {
      return invalidEmail(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$InvalidEmailImplToJson(
      this,
    );
  }
}

abstract class InvalidEmail implements SignUpError {
  const factory InvalidEmail() = _$InvalidEmailImpl;

  factory InvalidEmail.fromJson(Map<String, dynamic> json) =
      _$InvalidEmailImpl.fromJson;
}

/// @nodoc
abstract class _$$PasswordMismatchImplCopyWith<$Res> {
  factory _$$PasswordMismatchImplCopyWith(_$PasswordMismatchImpl value,
          $Res Function(_$PasswordMismatchImpl) then) =
      __$$PasswordMismatchImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PasswordMismatchImplCopyWithImpl<$Res>
    extends _$SignUpErrorCopyWithImpl<$Res, _$PasswordMismatchImpl>
    implements _$$PasswordMismatchImplCopyWith<$Res> {
  __$$PasswordMismatchImplCopyWithImpl(_$PasswordMismatchImpl _value,
      $Res Function(_$PasswordMismatchImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$PasswordMismatchImpl implements PasswordMismatch {
  const _$PasswordMismatchImpl({final String? $type})
      : $type = $type ?? 'passwordMismatch';

  factory _$PasswordMismatchImpl.fromJson(Map<String, dynamic> json) =>
      _$$PasswordMismatchImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'SignUpError.passwordMismatch()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PasswordMismatchImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() emptyName,
    required TResult Function() invalidEmail,
    required TResult Function() passwordMismatch,
    required TResult Function(String message) firebase,
  }) {
    return passwordMismatch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? emptyName,
    TResult? Function()? invalidEmail,
    TResult? Function()? passwordMismatch,
    TResult? Function(String message)? firebase,
  }) {
    return passwordMismatch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? emptyName,
    TResult Function()? invalidEmail,
    TResult Function()? passwordMismatch,
    TResult Function(String message)? firebase,
    required TResult orElse(),
  }) {
    if (passwordMismatch != null) {
      return passwordMismatch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmptyName value) emptyName,
    required TResult Function(InvalidEmail value) invalidEmail,
    required TResult Function(PasswordMismatch value) passwordMismatch,
    required TResult Function(FirebaseError value) firebase,
  }) {
    return passwordMismatch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmptyName value)? emptyName,
    TResult? Function(InvalidEmail value)? invalidEmail,
    TResult? Function(PasswordMismatch value)? passwordMismatch,
    TResult? Function(FirebaseError value)? firebase,
  }) {
    return passwordMismatch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmptyName value)? emptyName,
    TResult Function(InvalidEmail value)? invalidEmail,
    TResult Function(PasswordMismatch value)? passwordMismatch,
    TResult Function(FirebaseError value)? firebase,
    required TResult orElse(),
  }) {
    if (passwordMismatch != null) {
      return passwordMismatch(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PasswordMismatchImplToJson(
      this,
    );
  }
}

abstract class PasswordMismatch implements SignUpError {
  const factory PasswordMismatch() = _$PasswordMismatchImpl;

  factory PasswordMismatch.fromJson(Map<String, dynamic> json) =
      _$PasswordMismatchImpl.fromJson;
}

/// @nodoc
abstract class _$$FirebaseErrorImplCopyWith<$Res> {
  factory _$$FirebaseErrorImplCopyWith(
          _$FirebaseErrorImpl value, $Res Function(_$FirebaseErrorImpl) then) =
      __$$FirebaseErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$FirebaseErrorImplCopyWithImpl<$Res>
    extends _$SignUpErrorCopyWithImpl<$Res, _$FirebaseErrorImpl>
    implements _$$FirebaseErrorImplCopyWith<$Res> {
  __$$FirebaseErrorImplCopyWithImpl(
      _$FirebaseErrorImpl _value, $Res Function(_$FirebaseErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$FirebaseErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FirebaseErrorImpl implements FirebaseError {
  const _$FirebaseErrorImpl(this.message, {final String? $type})
      : $type = $type ?? 'firebase';

  factory _$FirebaseErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$FirebaseErrorImplFromJson(json);

  @override
  final String message;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'SignUpError.firebase(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FirebaseErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FirebaseErrorImplCopyWith<_$FirebaseErrorImpl> get copyWith =>
      __$$FirebaseErrorImplCopyWithImpl<_$FirebaseErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() emptyName,
    required TResult Function() invalidEmail,
    required TResult Function() passwordMismatch,
    required TResult Function(String message) firebase,
  }) {
    return firebase(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? emptyName,
    TResult? Function()? invalidEmail,
    TResult? Function()? passwordMismatch,
    TResult? Function(String message)? firebase,
  }) {
    return firebase?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? emptyName,
    TResult Function()? invalidEmail,
    TResult Function()? passwordMismatch,
    TResult Function(String message)? firebase,
    required TResult orElse(),
  }) {
    if (firebase != null) {
      return firebase(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmptyName value) emptyName,
    required TResult Function(InvalidEmail value) invalidEmail,
    required TResult Function(PasswordMismatch value) passwordMismatch,
    required TResult Function(FirebaseError value) firebase,
  }) {
    return firebase(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmptyName value)? emptyName,
    TResult? Function(InvalidEmail value)? invalidEmail,
    TResult? Function(PasswordMismatch value)? passwordMismatch,
    TResult? Function(FirebaseError value)? firebase,
  }) {
    return firebase?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmptyName value)? emptyName,
    TResult Function(InvalidEmail value)? invalidEmail,
    TResult Function(PasswordMismatch value)? passwordMismatch,
    TResult Function(FirebaseError value)? firebase,
    required TResult orElse(),
  }) {
    if (firebase != null) {
      return firebase(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$FirebaseErrorImplToJson(
      this,
    );
  }
}

abstract class FirebaseError implements SignUpError {
  const factory FirebaseError(final String message) = _$FirebaseErrorImpl;

  factory FirebaseError.fromJson(Map<String, dynamic> json) =
      _$FirebaseErrorImpl.fromJson;

  String get message;
  @JsonKey(ignore: true)
  _$$FirebaseErrorImplCopyWith<_$FirebaseErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
