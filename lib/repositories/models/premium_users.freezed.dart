// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'premium_users.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PremiumUsers _$PremiumUsersFromJson(Map<String, dynamic> json) {
  return _PremiumUsers.fromJson(json);
}

/// @nodoc
mixin _$PremiumUsers {
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  bool get enabled => throw _privateConstructorUsedError;
  @JsonKey(name: 'expire', fromJson: _parseDateTime)
  DateTime? get expire => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PremiumUsersCopyWith<PremiumUsers> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PremiumUsersCopyWith<$Res> {
  factory $PremiumUsersCopyWith(
          PremiumUsers value, $Res Function(PremiumUsers) then) =
      _$PremiumUsersCopyWithImpl<$Res, PremiumUsers>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') String userId,
      bool enabled,
      @JsonKey(name: 'expire', fromJson: _parseDateTime) DateTime? expire});
}

/// @nodoc
class _$PremiumUsersCopyWithImpl<$Res, $Val extends PremiumUsers>
    implements $PremiumUsersCopyWith<$Res> {
  _$PremiumUsersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? enabled = null,
    Object? expire = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      expire: freezed == expire
          ? _value.expire
          : expire // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PremiumUsersImplCopyWith<$Res>
    implements $PremiumUsersCopyWith<$Res> {
  factory _$$PremiumUsersImplCopyWith(
          _$PremiumUsersImpl value, $Res Function(_$PremiumUsersImpl) then) =
      __$$PremiumUsersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') String userId,
      bool enabled,
      @JsonKey(name: 'expire', fromJson: _parseDateTime) DateTime? expire});
}

/// @nodoc
class __$$PremiumUsersImplCopyWithImpl<$Res>
    extends _$PremiumUsersCopyWithImpl<$Res, _$PremiumUsersImpl>
    implements _$$PremiumUsersImplCopyWith<$Res> {
  __$$PremiumUsersImplCopyWithImpl(
      _$PremiumUsersImpl _value, $Res Function(_$PremiumUsersImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? enabled = null,
    Object? expire = freezed,
  }) {
    return _then(_$PremiumUsersImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      expire: freezed == expire
          ? _value.expire
          : expire // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PremiumUsersImpl implements _PremiumUsers {
  const _$PremiumUsersImpl(
      {@JsonKey(name: 'user_id') required this.userId,
      this.enabled = false,
      @JsonKey(name: 'expire', fromJson: _parseDateTime) this.expire});

  factory _$PremiumUsersImpl.fromJson(Map<String, dynamic> json) =>
      _$$PremiumUsersImplFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @JsonKey()
  final bool enabled;
  @override
  @JsonKey(name: 'expire', fromJson: _parseDateTime)
  final DateTime? expire;

  @override
  String toString() {
    return 'PremiumUsers(userId: $userId, enabled: $enabled, expire: $expire)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PremiumUsersImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.expire, expire) || other.expire == expire));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, enabled, expire);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PremiumUsersImplCopyWith<_$PremiumUsersImpl> get copyWith =>
      __$$PremiumUsersImplCopyWithImpl<_$PremiumUsersImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PremiumUsersImplToJson(
      this,
    );
  }
}

abstract class _PremiumUsers implements PremiumUsers {
  const factory _PremiumUsers(
      {@JsonKey(name: 'user_id') required final String userId,
      final bool enabled,
      @JsonKey(name: 'expire', fromJson: _parseDateTime)
      final DateTime? expire}) = _$PremiumUsersImpl;

  factory _PremiumUsers.fromJson(Map<String, dynamic> json) =
      _$PremiumUsersImpl.fromJson;

  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  bool get enabled;
  @override
  @JsonKey(name: 'expire', fromJson: _parseDateTime)
  DateTime? get expire;
  @override
  @JsonKey(ignore: true)
  _$$PremiumUsersImplCopyWith<_$PremiumUsersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
