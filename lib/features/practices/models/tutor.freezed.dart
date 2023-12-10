// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tutor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Tutor _$TutorFromJson(Map<String, dynamic> json) {
  return _Tutor.fromJson(json);
}

/// @nodoc
mixin _$Tutor {
  String get id => throw _privateConstructorUsedError;

  String get tutorNameKey => throw _privateConstructorUsedError;

  String get avatarUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TutorCopyWith<Tutor> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TutorCopyWith<$Res> {
  factory $TutorCopyWith(Tutor value, $Res Function(Tutor) then) =
      _$TutorCopyWithImpl<$Res, Tutor>;

  @useResult
  $Res call({String id, String tutorNameKey, String avatarUrl});
}

/// @nodoc
class _$TutorCopyWithImpl<$Res, $Val extends Tutor>
    implements $TutorCopyWith<$Res> {
  _$TutorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tutorNameKey = null,
    Object? avatarUrl = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      tutorNameKey: null == tutorNameKey
          ? _value.tutorNameKey
          : tutorNameKey // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: null == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TutorImplCopyWith<$Res> implements $TutorCopyWith<$Res> {
  factory _$$TutorImplCopyWith(
          _$TutorImpl value, $Res Function(_$TutorImpl) then) =
      __$$TutorImplCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call({String id, String tutorNameKey, String avatarUrl});
}

/// @nodoc
class __$$TutorImplCopyWithImpl<$Res>
    extends _$TutorCopyWithImpl<$Res, _$TutorImpl>
    implements _$$TutorImplCopyWith<$Res> {
  __$$TutorImplCopyWithImpl(
      _$TutorImpl _value, $Res Function(_$TutorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tutorNameKey = null,
    Object? avatarUrl = null,
  }) {
    return _then(_$TutorImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      tutorNameKey: null == tutorNameKey
          ? _value.tutorNameKey
          : tutorNameKey // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: null == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TutorImpl implements _Tutor {
  const _$TutorImpl(
      {required this.id, required this.tutorNameKey, required this.avatarUrl});

  factory _$TutorImpl.fromJson(Map<String, dynamic> json) =>
      _$$TutorImplFromJson(json);

  @override
  final String id;
  @override
  final String tutorNameKey;
  @override
  final String avatarUrl;

  @override
  String toString() {
    return 'Tutor(id: $id, tutorNameKey: $tutorNameKey, avatarUrl: $avatarUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TutorImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.tutorNameKey, tutorNameKey) ||
                other.tutorNameKey == tutorNameKey) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, tutorNameKey, avatarUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TutorImplCopyWith<_$TutorImpl> get copyWith =>
      __$$TutorImplCopyWithImpl<_$TutorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TutorImplToJson(
      this,
    );
  }
}

abstract class _Tutor implements Tutor {
  const factory _Tutor(
      {required final String id,
      required final String tutorNameKey,
      required final String avatarUrl}) = _$TutorImpl;

  factory _Tutor.fromJson(Map<String, dynamic> json) = _$TutorImpl.fromJson;

  @override
  String get id;

  @override
  String get tutorNameKey;

  @override
  String get avatarUrl;

  @override
  @JsonKey(ignore: true)
  _$$TutorImplCopyWith<_$TutorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
