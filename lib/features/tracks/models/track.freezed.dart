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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Track _$TrackFromJson(Map<String, dynamic> json) {
  return _Track.fromJson(json);
}

/// @nodoc
mixin _$Track {
  String get id => throw _privateConstructorUsedError;
  String get trackFile => throw _privateConstructorUsedError;
  String get categoryKey => throw _privateConstructorUsedError;
  int get duration => throw _privateConstructorUsedError;
  Tutor get tutor => throw _privateConstructorUsedError;
  String get coverIcon => throw _privateConstructorUsedError;
  @JsonKey(unknownEnumValue: TrackLanguage.unknown)
  TrackLanguage get language => throw _privateConstructorUsedError;
  String? get animationColor => throw _privateConstructorUsedError;
  bool get isPremium => throw _privateConstructorUsedError;
  String? get artist => throw _privateConstructorUsedError;
  String? get trackName => throw _privateConstructorUsedError;
  Map<String, String>? get trackTitleTranslations =>
      throw _privateConstructorUsedError;

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
      String categoryKey,
      int duration,
      Tutor tutor,
      String coverIcon,
      @JsonKey(unknownEnumValue: TrackLanguage.unknown) TrackLanguage language,
      String? animationColor,
      bool isPremium,
      String? artist,
      String? trackName,
      Map<String, String>? trackTitleTranslations});
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
    Object? categoryKey = null,
    Object? duration = null,
    Object? tutor = null,
    Object? coverIcon = null,
    Object? language = null,
    Object? animationColor = freezed,
    Object? isPremium = null,
    Object? artist = freezed,
    Object? trackName = freezed,
    Object? trackTitleTranslations = freezed,
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
      categoryKey: null == categoryKey
          ? _value.categoryKey
          : categoryKey // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      tutor: null == tutor
          ? _value.tutor
          : tutor // ignore: cast_nullable_to_non_nullable
              as Tutor,
      coverIcon: null == coverIcon
          ? _value.coverIcon
          : coverIcon // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as TrackLanguage,
      animationColor: freezed == animationColor
          ? _value.animationColor
          : animationColor // ignore: cast_nullable_to_non_nullable
              as String?,
      isPremium: null == isPremium
          ? _value.isPremium
          : isPremium // ignore: cast_nullable_to_non_nullable
              as bool,
      artist: freezed == artist
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as String?,
      trackName: freezed == trackName
          ? _value.trackName
          : trackName // ignore: cast_nullable_to_non_nullable
              as String?,
      trackTitleTranslations: freezed == trackTitleTranslations
          ? _value.trackTitleTranslations
          : trackTitleTranslations // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
    ) as $Val);
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
      String categoryKey,
      int duration,
      Tutor tutor,
      String coverIcon,
      @JsonKey(unknownEnumValue: TrackLanguage.unknown) TrackLanguage language,
      String? animationColor,
      bool isPremium,
      String? artist,
      String? trackName,
      Map<String, String>? trackTitleTranslations});
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
    Object? categoryKey = null,
    Object? duration = null,
    Object? tutor = null,
    Object? coverIcon = null,
    Object? language = null,
    Object? animationColor = freezed,
    Object? isPremium = null,
    Object? artist = freezed,
    Object? trackName = freezed,
    Object? trackTitleTranslations = freezed,
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
      categoryKey: null == categoryKey
          ? _value.categoryKey
          : categoryKey // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      tutor: null == tutor
          ? _value.tutor
          : tutor // ignore: cast_nullable_to_non_nullable
              as Tutor,
      coverIcon: null == coverIcon
          ? _value.coverIcon
          : coverIcon // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as TrackLanguage,
      animationColor: freezed == animationColor
          ? _value.animationColor
          : animationColor // ignore: cast_nullable_to_non_nullable
              as String?,
      isPremium: null == isPremium
          ? _value.isPremium
          : isPremium // ignore: cast_nullable_to_non_nullable
              as bool,
      artist: freezed == artist
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as String?,
      trackName: freezed == trackName
          ? _value.trackName
          : trackName // ignore: cast_nullable_to_non_nullable
              as String?,
      trackTitleTranslations: freezed == trackTitleTranslations
          ? _value._trackTitleTranslations
          : trackTitleTranslations // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TrackImpl extends _Track {
  const _$TrackImpl(
      {required this.id,
      required this.trackFile,
      required this.categoryKey,
      required this.duration,
      required this.tutor,
      required this.coverIcon,
      @JsonKey(unknownEnumValue: TrackLanguage.unknown) required this.language,
      this.animationColor,
      this.isPremium = false,
      this.artist,
      this.trackName,
      final Map<String, String>? trackTitleTranslations})
      : _trackTitleTranslations = trackTitleTranslations,
        super._();

  factory _$TrackImpl.fromJson(Map<String, dynamic> json) =>
      _$$TrackImplFromJson(json);

  @override
  final String id;
  @override
  final String trackFile;
  @override
  final String categoryKey;
  @override
  final int duration;
  @override
  final Tutor tutor;
  @override
  final String coverIcon;
  @override
  @JsonKey(unknownEnumValue: TrackLanguage.unknown)
  final TrackLanguage language;
  @override
  final String? animationColor;
  @override
  @JsonKey()
  final bool isPremium;
  @override
  final String? artist;
  @override
  final String? trackName;
  final Map<String, String>? _trackTitleTranslations;
  @override
  Map<String, String>? get trackTitleTranslations {
    final value = _trackTitleTranslations;
    if (value == null) return null;
    if (_trackTitleTranslations is EqualUnmodifiableMapView)
      return _trackTitleTranslations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'Track(id: $id, trackFile: $trackFile, categoryKey: $categoryKey, duration: $duration, tutor: $tutor, coverIcon: $coverIcon, language: $language, animationColor: $animationColor, isPremium: $isPremium, artist: $artist, trackName: $trackName, trackTitleTranslations: $trackTitleTranslations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrackImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.trackFile, trackFile) ||
                other.trackFile == trackFile) &&
            (identical(other.categoryKey, categoryKey) ||
                other.categoryKey == categoryKey) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.tutor, tutor) || other.tutor == tutor) &&
            (identical(other.coverIcon, coverIcon) ||
                other.coverIcon == coverIcon) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.animationColor, animationColor) ||
                other.animationColor == animationColor) &&
            (identical(other.isPremium, isPremium) ||
                other.isPremium == isPremium) &&
            (identical(other.artist, artist) || other.artist == artist) &&
            (identical(other.trackName, trackName) ||
                other.trackName == trackName) &&
            const DeepCollectionEquality().equals(
                other._trackTitleTranslations, _trackTitleTranslations));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      trackFile,
      categoryKey,
      duration,
      tutor,
      coverIcon,
      language,
      animationColor,
      isPremium,
      artist,
      trackName,
      const DeepCollectionEquality().hash(_trackTitleTranslations));

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

abstract class _Track extends Track {
  const factory _Track(
      {required final String id,
      required final String trackFile,
      required final String categoryKey,
      required final int duration,
      required final Tutor tutor,
      required final String coverIcon,
      @JsonKey(unknownEnumValue: TrackLanguage.unknown)
      required final TrackLanguage language,
      final String? animationColor,
      final bool isPremium,
      final String? artist,
      final String? trackName,
      final Map<String, String>? trackTitleTranslations}) = _$TrackImpl;
  const _Track._() : super._();

  factory _Track.fromJson(Map<String, dynamic> json) = _$TrackImpl.fromJson;

  @override
  String get id;
  @override
  String get trackFile;
  @override
  String get categoryKey;
  @override
  int get duration;
  @override
  Tutor get tutor;
  @override
  String get coverIcon;
  @override
  @JsonKey(unknownEnumValue: TrackLanguage.unknown)
  TrackLanguage get language;
  @override
  String? get animationColor;
  @override
  bool get isPremium;
  @override
  String? get artist;
  @override
  String? get trackName;
  @override
  Map<String, String>? get trackTitleTranslations;
  @override
  @JsonKey(ignore: true)
  _$$TrackImplCopyWith<_$TrackImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
