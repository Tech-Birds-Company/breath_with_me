// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remote_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RemoteConfig _$RemoteConfigFromJson(Map<String, dynamic> json) {
  return _RemoteConfig.fromJson(json);
}

/// @nodoc
mixin _$RemoteConfig {
  String get communityDeeplink => throw _privateConstructorUsedError;
  String get supportEmailDeeplink => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RemoteConfigCopyWith<RemoteConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemoteConfigCopyWith<$Res> {
  factory $RemoteConfigCopyWith(
          RemoteConfig value, $Res Function(RemoteConfig) then) =
      _$RemoteConfigCopyWithImpl<$Res, RemoteConfig>;
  @useResult
  $Res call({String communityDeeplink, String supportEmailDeeplink});
}

/// @nodoc
class _$RemoteConfigCopyWithImpl<$Res, $Val extends RemoteConfig>
    implements $RemoteConfigCopyWith<$Res> {
  _$RemoteConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? communityDeeplink = null,
    Object? supportEmailDeeplink = null,
  }) {
    return _then(_value.copyWith(
      communityDeeplink: null == communityDeeplink
          ? _value.communityDeeplink
          : communityDeeplink // ignore: cast_nullable_to_non_nullable
              as String,
      supportEmailDeeplink: null == supportEmailDeeplink
          ? _value.supportEmailDeeplink
          : supportEmailDeeplink // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RemoteConfigImplCopyWith<$Res>
    implements $RemoteConfigCopyWith<$Res> {
  factory _$$RemoteConfigImplCopyWith(
          _$RemoteConfigImpl value, $Res Function(_$RemoteConfigImpl) then) =
      __$$RemoteConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String communityDeeplink, String supportEmailDeeplink});
}

/// @nodoc
class __$$RemoteConfigImplCopyWithImpl<$Res>
    extends _$RemoteConfigCopyWithImpl<$Res, _$RemoteConfigImpl>
    implements _$$RemoteConfigImplCopyWith<$Res> {
  __$$RemoteConfigImplCopyWithImpl(
      _$RemoteConfigImpl _value, $Res Function(_$RemoteConfigImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? communityDeeplink = null,
    Object? supportEmailDeeplink = null,
  }) {
    return _then(_$RemoteConfigImpl(
      communityDeeplink: null == communityDeeplink
          ? _value.communityDeeplink
          : communityDeeplink // ignore: cast_nullable_to_non_nullable
              as String,
      supportEmailDeeplink: null == supportEmailDeeplink
          ? _value.supportEmailDeeplink
          : supportEmailDeeplink // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RemoteConfigImpl implements _RemoteConfig {
  const _$RemoteConfigImpl(
      {required this.communityDeeplink, required this.supportEmailDeeplink});

  factory _$RemoteConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$RemoteConfigImplFromJson(json);

  @override
  final String communityDeeplink;
  @override
  final String supportEmailDeeplink;

  @override
  String toString() {
    return 'RemoteConfig(communityDeeplink: $communityDeeplink, supportEmailDeeplink: $supportEmailDeeplink)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoteConfigImpl &&
            (identical(other.communityDeeplink, communityDeeplink) ||
                other.communityDeeplink == communityDeeplink) &&
            (identical(other.supportEmailDeeplink, supportEmailDeeplink) ||
                other.supportEmailDeeplink == supportEmailDeeplink));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, communityDeeplink, supportEmailDeeplink);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoteConfigImplCopyWith<_$RemoteConfigImpl> get copyWith =>
      __$$RemoteConfigImplCopyWithImpl<_$RemoteConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RemoteConfigImplToJson(
      this,
    );
  }
}

abstract class _RemoteConfig implements RemoteConfig {
  const factory _RemoteConfig(
      {required final String communityDeeplink,
      required final String supportEmailDeeplink}) = _$RemoteConfigImpl;

  factory _RemoteConfig.fromJson(Map<String, dynamic> json) =
      _$RemoteConfigImpl.fromJson;

  @override
  String get communityDeeplink;
  @override
  String get supportEmailDeeplink;
  @override
  @JsonKey(ignore: true)
  _$$RemoteConfigImplCopyWith<_$RemoteConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
