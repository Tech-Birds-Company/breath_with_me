// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'streak_lives_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StreakLivesData _$StreakLivesDataFromJson(Map<String, dynamic> json) {
  return _StreakLivesData.fromJson(json);
}

/// @nodoc
mixin _$StreakLivesData {
  int get availableLivesCount => throw _privateConstructorUsedError;
  int get totalLivesCount => throw _privateConstructorUsedError;
  bool get showTitle => throw _privateConstructorUsedError;
  bool get showFooter => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StreakLivesDataCopyWith<StreakLivesData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StreakLivesDataCopyWith<$Res> {
  factory $StreakLivesDataCopyWith(
          StreakLivesData value, $Res Function(StreakLivesData) then) =
      _$StreakLivesDataCopyWithImpl<$Res, StreakLivesData>;
  @useResult
  $Res call(
      {int availableLivesCount,
      int totalLivesCount,
      bool showTitle,
      bool showFooter});
}

/// @nodoc
class _$StreakLivesDataCopyWithImpl<$Res, $Val extends StreakLivesData>
    implements $StreakLivesDataCopyWith<$Res> {
  _$StreakLivesDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? availableLivesCount = null,
    Object? totalLivesCount = null,
    Object? showTitle = null,
    Object? showFooter = null,
  }) {
    return _then(_value.copyWith(
      availableLivesCount: null == availableLivesCount
          ? _value.availableLivesCount
          : availableLivesCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalLivesCount: null == totalLivesCount
          ? _value.totalLivesCount
          : totalLivesCount // ignore: cast_nullable_to_non_nullable
              as int,
      showTitle: null == showTitle
          ? _value.showTitle
          : showTitle // ignore: cast_nullable_to_non_nullable
              as bool,
      showFooter: null == showFooter
          ? _value.showFooter
          : showFooter // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StreakLivesDataImplCopyWith<$Res>
    implements $StreakLivesDataCopyWith<$Res> {
  factory _$$StreakLivesDataImplCopyWith(_$StreakLivesDataImpl value,
          $Res Function(_$StreakLivesDataImpl) then) =
      __$$StreakLivesDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int availableLivesCount,
      int totalLivesCount,
      bool showTitle,
      bool showFooter});
}

/// @nodoc
class __$$StreakLivesDataImplCopyWithImpl<$Res>
    extends _$StreakLivesDataCopyWithImpl<$Res, _$StreakLivesDataImpl>
    implements _$$StreakLivesDataImplCopyWith<$Res> {
  __$$StreakLivesDataImplCopyWithImpl(
      _$StreakLivesDataImpl _value, $Res Function(_$StreakLivesDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? availableLivesCount = null,
    Object? totalLivesCount = null,
    Object? showTitle = null,
    Object? showFooter = null,
  }) {
    return _then(_$StreakLivesDataImpl(
      availableLivesCount: null == availableLivesCount
          ? _value.availableLivesCount
          : availableLivesCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalLivesCount: null == totalLivesCount
          ? _value.totalLivesCount
          : totalLivesCount // ignore: cast_nullable_to_non_nullable
              as int,
      showTitle: null == showTitle
          ? _value.showTitle
          : showTitle // ignore: cast_nullable_to_non_nullable
              as bool,
      showFooter: null == showFooter
          ? _value.showFooter
          : showFooter // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StreakLivesDataImpl implements _StreakLivesData {
  const _$StreakLivesDataImpl(
      {required this.availableLivesCount,
      required this.totalLivesCount,
      this.showTitle = false,
      this.showFooter = false});

  factory _$StreakLivesDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$StreakLivesDataImplFromJson(json);

  @override
  final int availableLivesCount;
  @override
  final int totalLivesCount;
  @override
  @JsonKey()
  final bool showTitle;
  @override
  @JsonKey()
  final bool showFooter;

  @override
  String toString() {
    return 'StreakLivesData(availableLivesCount: $availableLivesCount, totalLivesCount: $totalLivesCount, showTitle: $showTitle, showFooter: $showFooter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StreakLivesDataImpl &&
            (identical(other.availableLivesCount, availableLivesCount) ||
                other.availableLivesCount == availableLivesCount) &&
            (identical(other.totalLivesCount, totalLivesCount) ||
                other.totalLivesCount == totalLivesCount) &&
            (identical(other.showTitle, showTitle) ||
                other.showTitle == showTitle) &&
            (identical(other.showFooter, showFooter) ||
                other.showFooter == showFooter));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, availableLivesCount, totalLivesCount, showTitle, showFooter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StreakLivesDataImplCopyWith<_$StreakLivesDataImpl> get copyWith =>
      __$$StreakLivesDataImplCopyWithImpl<_$StreakLivesDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StreakLivesDataImplToJson(
      this,
    );
  }
}

abstract class _StreakLivesData implements StreakLivesData {
  const factory _StreakLivesData(
      {required final int availableLivesCount,
      required final int totalLivesCount,
      final bool showTitle,
      final bool showFooter}) = _$StreakLivesDataImpl;

  factory _StreakLivesData.fromJson(Map<String, dynamic> json) =
      _$StreakLivesDataImpl.fromJson;

  @override
  int get availableLivesCount;
  @override
  int get totalLivesCount;
  @override
  bool get showTitle;
  @override
  bool get showFooter;
  @override
  @JsonKey(ignore: true)
  _$$StreakLivesDataImplCopyWith<_$StreakLivesDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
