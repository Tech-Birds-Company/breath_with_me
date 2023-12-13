// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remote_config_socials.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RemoteConfigSocials _$RemoteConfigSocialsFromJson(Map<String, dynamic> json) {
  return _RemoteConfigSocials.fromJson(json);
}

/// @nodoc
mixin _$RemoteConfigSocials {
  String get communityDeeplink => throw _privateConstructorUsedError;
  String get communityUrl => throw _privateConstructorUsedError;
  String get supportEmailDeeplink => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RemoteConfigSocialsCopyWith<RemoteConfigSocials> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemoteConfigSocialsCopyWith<$Res> {
  factory $RemoteConfigSocialsCopyWith(
          RemoteConfigSocials value, $Res Function(RemoteConfigSocials) then) =
      _$RemoteConfigSocialsCopyWithImpl<$Res, RemoteConfigSocials>;
  @useResult
  $Res call(
      {String communityDeeplink,
      String communityUrl,
      String supportEmailDeeplink});
}

/// @nodoc
class _$RemoteConfigSocialsCopyWithImpl<$Res, $Val extends RemoteConfigSocials>
    implements $RemoteConfigSocialsCopyWith<$Res> {
  _$RemoteConfigSocialsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? communityDeeplink = null,
    Object? communityUrl = null,
    Object? supportEmailDeeplink = null,
  }) {
    return _then(_value.copyWith(
      communityDeeplink: null == communityDeeplink
          ? _value.communityDeeplink
          : communityDeeplink // ignore: cast_nullable_to_non_nullable
              as String,
      communityUrl: null == communityUrl
          ? _value.communityUrl
          : communityUrl // ignore: cast_nullable_to_non_nullable
              as String,
      supportEmailDeeplink: null == supportEmailDeeplink
          ? _value.supportEmailDeeplink
          : supportEmailDeeplink // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RemoteConfigSocialsImplCopyWith<$Res>
    implements $RemoteConfigSocialsCopyWith<$Res> {
  factory _$$RemoteConfigSocialsImplCopyWith(_$RemoteConfigSocialsImpl value,
          $Res Function(_$RemoteConfigSocialsImpl) then) =
      __$$RemoteConfigSocialsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String communityDeeplink,
      String communityUrl,
      String supportEmailDeeplink});
}

/// @nodoc
class __$$RemoteConfigSocialsImplCopyWithImpl<$Res>
    extends _$RemoteConfigSocialsCopyWithImpl<$Res, _$RemoteConfigSocialsImpl>
    implements _$$RemoteConfigSocialsImplCopyWith<$Res> {
  __$$RemoteConfigSocialsImplCopyWithImpl(_$RemoteConfigSocialsImpl _value,
      $Res Function(_$RemoteConfigSocialsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? communityDeeplink = null,
    Object? communityUrl = null,
    Object? supportEmailDeeplink = null,
  }) {
    return _then(_$RemoteConfigSocialsImpl(
      communityDeeplink: null == communityDeeplink
          ? _value.communityDeeplink
          : communityDeeplink // ignore: cast_nullable_to_non_nullable
              as String,
      communityUrl: null == communityUrl
          ? _value.communityUrl
          : communityUrl // ignore: cast_nullable_to_non_nullable
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
class _$RemoteConfigSocialsImpl implements _RemoteConfigSocials {
  const _$RemoteConfigSocialsImpl(
      {required this.communityDeeplink,
      required this.communityUrl,
      required this.supportEmailDeeplink});

  factory _$RemoteConfigSocialsImpl.fromJson(Map<String, dynamic> json) =>
      _$$RemoteConfigSocialsImplFromJson(json);

  @override
  final String communityDeeplink;
  @override
  final String communityUrl;
  @override
  final String supportEmailDeeplink;

  @override
  String toString() {
    return 'RemoteConfigSocials(communityDeeplink: $communityDeeplink, communityUrl: $communityUrl, supportEmailDeeplink: $supportEmailDeeplink)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoteConfigSocialsImpl &&
            (identical(other.communityDeeplink, communityDeeplink) ||
                other.communityDeeplink == communityDeeplink) &&
            (identical(other.communityUrl, communityUrl) ||
                other.communityUrl == communityUrl) &&
            (identical(other.supportEmailDeeplink, supportEmailDeeplink) ||
                other.supportEmailDeeplink == supportEmailDeeplink));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, communityDeeplink, communityUrl, supportEmailDeeplink);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoteConfigSocialsImplCopyWith<_$RemoteConfigSocialsImpl> get copyWith =>
      __$$RemoteConfigSocialsImplCopyWithImpl<_$RemoteConfigSocialsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RemoteConfigSocialsImplToJson(
      this,
    );
  }
}

abstract class _RemoteConfigSocials implements RemoteConfigSocials {
  const factory _RemoteConfigSocials(
      {required final String communityDeeplink,
      required final String communityUrl,
      required final String supportEmailDeeplink}) = _$RemoteConfigSocialsImpl;

  factory _RemoteConfigSocials.fromJson(Map<String, dynamic> json) =
      _$RemoteConfigSocialsImpl.fromJson;

  @override
  String get communityDeeplink;
  @override
  String get communityUrl;
  @override
  String get supportEmailDeeplink;
  @override
  @JsonKey(ignore: true)
  _$$RemoteConfigSocialsImplCopyWith<_$RemoteConfigSocialsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
