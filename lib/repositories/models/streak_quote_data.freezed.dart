// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'streak_quote_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StreakQuoteData _$StreakQuoteDataFromJson(Map<String, dynamic> json) {
  return _StreakQuoteData.fromJson(json);
}

/// @nodoc
mixin _$StreakQuoteData {
  String get language => throw _privateConstructorUsedError;
  String get quote => throw _privateConstructorUsedError;
  String get author => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StreakQuoteDataCopyWith<StreakQuoteData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StreakQuoteDataCopyWith<$Res> {
  factory $StreakQuoteDataCopyWith(
          StreakQuoteData value, $Res Function(StreakQuoteData) then) =
      _$StreakQuoteDataCopyWithImpl<$Res, StreakQuoteData>;
  @useResult
  $Res call({String language, String quote, String author});
}

/// @nodoc
class _$StreakQuoteDataCopyWithImpl<$Res, $Val extends StreakQuoteData>
    implements $StreakQuoteDataCopyWith<$Res> {
  _$StreakQuoteDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? language = null,
    Object? quote = null,
    Object? author = null,
  }) {
    return _then(_value.copyWith(
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      quote: null == quote
          ? _value.quote
          : quote // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StreakQuoteDataImplCopyWith<$Res>
    implements $StreakQuoteDataCopyWith<$Res> {
  factory _$$StreakQuoteDataImplCopyWith(_$StreakQuoteDataImpl value,
          $Res Function(_$StreakQuoteDataImpl) then) =
      __$$StreakQuoteDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String language, String quote, String author});
}

/// @nodoc
class __$$StreakQuoteDataImplCopyWithImpl<$Res>
    extends _$StreakQuoteDataCopyWithImpl<$Res, _$StreakQuoteDataImpl>
    implements _$$StreakQuoteDataImplCopyWith<$Res> {
  __$$StreakQuoteDataImplCopyWithImpl(
      _$StreakQuoteDataImpl _value, $Res Function(_$StreakQuoteDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? language = null,
    Object? quote = null,
    Object? author = null,
  }) {
    return _then(_$StreakQuoteDataImpl(
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      quote: null == quote
          ? _value.quote
          : quote // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StreakQuoteDataImpl implements _StreakQuoteData {
  const _$StreakQuoteDataImpl(
      {required this.language, required this.quote, required this.author});

  factory _$StreakQuoteDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$StreakQuoteDataImplFromJson(json);

  @override
  final String language;
  @override
  final String quote;
  @override
  final String author;

  @override
  String toString() {
    return 'StreakQuoteData(language: $language, quote: $quote, author: $author)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StreakQuoteDataImpl &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.quote, quote) || other.quote == quote) &&
            (identical(other.author, author) || other.author == author));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, language, quote, author);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StreakQuoteDataImplCopyWith<_$StreakQuoteDataImpl> get copyWith =>
      __$$StreakQuoteDataImplCopyWithImpl<_$StreakQuoteDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StreakQuoteDataImplToJson(
      this,
    );
  }
}

abstract class _StreakQuoteData implements StreakQuoteData {
  const factory _StreakQuoteData(
      {required final String language,
      required final String quote,
      required final String author}) = _$StreakQuoteDataImpl;

  factory _StreakQuoteData.fromJson(Map<String, dynamic> json) =
      _$StreakQuoteDataImpl.fromJson;

  @override
  String get language;
  @override
  String get quote;
  @override
  String get author;
  @override
  @JsonKey(ignore: true)
  _$$StreakQuoteDataImplCopyWith<_$StreakQuoteDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
