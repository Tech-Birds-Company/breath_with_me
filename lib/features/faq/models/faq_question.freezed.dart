// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'faq_question.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FaqQuestion _$FaqQuestionFromJson(Map<String, dynamic> json) {
  return _FaqQuestion.fromJson(json);
}

/// @nodoc
mixin _$FaqQuestion {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(unknownEnumValue: FaqLanguage.unknown)
  FaqLanguage get language => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FaqQuestionCopyWith<FaqQuestion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FaqQuestionCopyWith<$Res> {
  factory $FaqQuestionCopyWith(
          FaqQuestion value, $Res Function(FaqQuestion) then) =
      _$FaqQuestionCopyWithImpl<$Res, FaqQuestion>;
  @useResult
  $Res call(
      {int id,
      String title,
      String description,
      @JsonKey(unknownEnumValue: FaqLanguage.unknown) FaqLanguage language});
}

/// @nodoc
class _$FaqQuestionCopyWithImpl<$Res, $Val extends FaqQuestion>
    implements $FaqQuestionCopyWith<$Res> {
  _$FaqQuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? language = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as FaqLanguage,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FaqQuestionImplCopyWith<$Res>
    implements $FaqQuestionCopyWith<$Res> {
  factory _$$FaqQuestionImplCopyWith(
          _$FaqQuestionImpl value, $Res Function(_$FaqQuestionImpl) then) =
      __$$FaqQuestionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String description,
      @JsonKey(unknownEnumValue: FaqLanguage.unknown) FaqLanguage language});
}

/// @nodoc
class __$$FaqQuestionImplCopyWithImpl<$Res>
    extends _$FaqQuestionCopyWithImpl<$Res, _$FaqQuestionImpl>
    implements _$$FaqQuestionImplCopyWith<$Res> {
  __$$FaqQuestionImplCopyWithImpl(
      _$FaqQuestionImpl _value, $Res Function(_$FaqQuestionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? language = null,
  }) {
    return _then(_$FaqQuestionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as FaqLanguage,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FaqQuestionImpl implements _FaqQuestion {
  const _$FaqQuestionImpl(
      {required this.id,
      required this.title,
      required this.description,
      @JsonKey(unknownEnumValue: FaqLanguage.unknown) required this.language});

  factory _$FaqQuestionImpl.fromJson(Map<String, dynamic> json) =>
      _$$FaqQuestionImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String description;
  @override
  @JsonKey(unknownEnumValue: FaqLanguage.unknown)
  final FaqLanguage language;

  @override
  String toString() {
    return 'FaqQuestion(id: $id, title: $title, description: $description, language: $language)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaqQuestionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, description, language);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FaqQuestionImplCopyWith<_$FaqQuestionImpl> get copyWith =>
      __$$FaqQuestionImplCopyWithImpl<_$FaqQuestionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FaqQuestionImplToJson(
      this,
    );
  }
}

abstract class _FaqQuestion implements FaqQuestion {
  const factory _FaqQuestion(
      {required final int id,
      required final String title,
      required final String description,
      @JsonKey(unknownEnumValue: FaqLanguage.unknown)
      required final FaqLanguage language}) = _$FaqQuestionImpl;

  factory _FaqQuestion.fromJson(Map<String, dynamic> json) =
      _$FaqQuestionImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get description;
  @override
  @JsonKey(unknownEnumValue: FaqLanguage.unknown)
  FaqLanguage get language;
  @override
  @JsonKey(ignore: true)
  _$$FaqQuestionImplCopyWith<_$FaqQuestionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
