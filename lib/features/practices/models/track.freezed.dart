// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'track.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Track _$TrackFromJson(Map<String, dynamic> json) {
  return _Track.fromJson(json);
}

/// @nodoc
mixin _$Track {
  String get id => throw _privateConstructorUsedError;
  String get trackFile => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  int get duration => throw _privateConstructorUsedError;
  Tutor get tutor => throw _privateConstructorUsedError;
  @JsonKey(unknownEnumValue: TrackLanguage.unknown)
  TrackLanguage get language => throw _privateConstructorUsedError;
  bool get isPremium => throw _privateConstructorUsedError;
  bool get isNew => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TrackCopyWith<Track> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrackCopyWith<$Res> {
  factory $TrackCopyWith(Track value, $Res Function(Track) then) =
      _$TrackCopyWithImpl<$Res, Track>;
  @useResult
  $Res call(
      {String id,
      String trackFile,
      String title,
      int duration,
      Tutor tutor,
      @JsonKey(unknownEnumValue: TrackLanguage.unknown) TrackLanguage language,
      bool isPremium,
      bool isNew});

  $TutorCopyWith<$Res> get tutor;
}

/// @nodoc
class _$TrackCopyWithImpl<$Res, $Val extends Track>
    implements $TrackCopyWith<$Res> {
  _$TrackCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? trackFile = null,
    Object? title = null,
    Object? duration = null,
    Object? tutor = null,
    Object? language = null,
    Object? isPremium = null,
    Object? isNew = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      trackFile: null == trackFile
          ? _value.trackFile
          : trackFile // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      tutor: null == tutor
          ? _value.tutor
          : tutor // ignore: cast_nullable_to_non_nullable
              as Tutor,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as TrackLanguage,
      isPremium: null == isPremium
          ? _value.isPremium
          : isPremium // ignore: cast_nullable_to_non_nullable
              as bool,
      isNew: null == isNew
          ? _value.isNew
          : isNew // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TutorCopyWith<$Res> get tutor {
    return $TutorCopyWith<$Res>(_value.tutor, (value) {
      return _then(_value.copyWith(tutor: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TrackImplCopyWith<$Res> implements $TrackCopyWith<$Res> {
  factory _$$TrackImplCopyWith(
          _$TrackImpl value, $Res Function(_$TrackImpl) then) =
      __$$TrackImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String trackFile,
      String title,
      int duration,
      Tutor tutor,
      @JsonKey(unknownEnumValue: TrackLanguage.unknown) TrackLanguage language,
      bool isPremium,
      bool isNew});

  @override
  $TutorCopyWith<$Res> get tutor;
}

/// @nodoc
class __$$TrackImplCopyWithImpl<$Res>
    extends _$TrackCopyWithImpl<$Res, _$TrackImpl>
    implements _$$TrackImplCopyWith<$Res> {
  __$$TrackImplCopyWithImpl(
      _$TrackImpl _value, $Res Function(_$TrackImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? trackFile = null,
    Object? title = null,
    Object? duration = null,
    Object? tutor = null,
    Object? language = null,
    Object? isPremium = null,
    Object? isNew = null,
  }) {
    return _then(_$TrackImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      trackFile: null == trackFile
          ? _value.trackFile
          : trackFile // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      tutor: null == tutor
          ? _value.tutor
          : tutor // ignore: cast_nullable_to_non_nullable
              as Tutor,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as TrackLanguage,
      isPremium: null == isPremium
          ? _value.isPremium
          : isPremium // ignore: cast_nullable_to_non_nullable
              as bool,
      isNew: null == isNew
          ? _value.isNew
          : isNew // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TrackImpl implements _Track {
  const _$TrackImpl(
      {required this.id,
      required this.trackFile,
      required this.title,
      required this.duration,
      required this.tutor,
      @JsonKey(unknownEnumValue: TrackLanguage.unknown) required this.language,
      this.isPremium = false,
      this.isNew = false});

  factory _$TrackImpl.fromJson(Map<String, dynamic> json) =>
      _$$TrackImplFromJson(json);

  @override
  final String id;
  @override
  final String trackFile;
  @override
  final String title;
  @override
  final int duration;
  @override
  final Tutor tutor;
  @override
  @JsonKey(unknownEnumValue: TrackLanguage.unknown)
  final TrackLanguage language;
  @override
  @JsonKey()
  final bool isPremium;
  @override
  @JsonKey()
  final bool isNew;

  @override
  String toString() {
    return 'Track(id: $id, trackFile: $trackFile, title: $title, duration: $duration, tutor: $tutor, language: $language, isPremium: $isPremium, isNew: $isNew)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrackImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.trackFile, trackFile) ||
                other.trackFile == trackFile) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.tutor, tutor) || other.tutor == tutor) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.isPremium, isPremium) ||
                other.isPremium == isPremium) &&
            (identical(other.isNew, isNew) || other.isNew == isNew));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, trackFile, title, duration,
      tutor, language, isPremium, isNew);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TrackImplCopyWith<_$TrackImpl> get copyWith =>
      __$$TrackImplCopyWithImpl<_$TrackImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TrackImplToJson(
      this,
    );
  }
}

abstract class _Track implements Track {
  const factory _Track(
      {required final String id,
      required final String trackFile,
      required final String title,
      required final int duration,
      required final Tutor tutor,
      @JsonKey(unknownEnumValue: TrackLanguage.unknown)
      required final TrackLanguage language,
      final bool isPremium,
      final bool isNew}) = _$TrackImpl;

  factory _Track.fromJson(Map<String, dynamic> json) = _$TrackImpl.fromJson;

  @override
  String get id;
  @override
  String get trackFile;
  @override
  String get title;
  @override
  int get duration;
  @override
  Tutor get tutor;
  @override
  @JsonKey(unknownEnumValue: TrackLanguage.unknown)
  TrackLanguage get language;
  @override
  bool get isPremium;
  @override
  bool get isNew;
  @override
  @JsonKey(ignore: true)
  _$$TrackImplCopyWith<_$TrackImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
