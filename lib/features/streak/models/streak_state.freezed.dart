// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'streak_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StreakState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(StreakProgressV2 streakProgressV2) data,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(StreakProgressV2 streakProgressV2)? data,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(StreakProgressV2 streakProgressV2)? data,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StreakLoading value) loading,
    required TResult Function(_StreakData value) data,
    required TResult Function(_StreakError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StreakLoading value)? loading,
    TResult? Function(_StreakData value)? data,
    TResult? Function(_StreakError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StreakLoading value)? loading,
    TResult Function(_StreakData value)? data,
    TResult Function(_StreakError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StreakStateCopyWith<$Res> {
  factory $StreakStateCopyWith(
          StreakState value, $Res Function(StreakState) then) =
      _$StreakStateCopyWithImpl<$Res, StreakState>;
}

/// @nodoc
class _$StreakStateCopyWithImpl<$Res, $Val extends StreakState>
    implements $StreakStateCopyWith<$Res> {
  _$StreakStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StreakLoadingImplCopyWith<$Res> {
  factory _$$StreakLoadingImplCopyWith(
          _$StreakLoadingImpl value, $Res Function(_$StreakLoadingImpl) then) =
      __$$StreakLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StreakLoadingImplCopyWithImpl<$Res>
    extends _$StreakStateCopyWithImpl<$Res, _$StreakLoadingImpl>
    implements _$$StreakLoadingImplCopyWith<$Res> {
  __$$StreakLoadingImplCopyWithImpl(
      _$StreakLoadingImpl _value, $Res Function(_$StreakLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StreakLoadingImpl implements _StreakLoading {
  const _$StreakLoadingImpl();

  @override
  String toString() {
    return 'StreakState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StreakLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(StreakProgressV2 streakProgressV2) data,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(StreakProgressV2 streakProgressV2)? data,
    TResult? Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(StreakProgressV2 streakProgressV2)? data,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StreakLoading value) loading,
    required TResult Function(_StreakData value) data,
    required TResult Function(_StreakError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StreakLoading value)? loading,
    TResult? Function(_StreakData value)? data,
    TResult? Function(_StreakError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StreakLoading value)? loading,
    TResult Function(_StreakData value)? data,
    TResult Function(_StreakError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _StreakLoading implements StreakState {
  const factory _StreakLoading() = _$StreakLoadingImpl;
}

/// @nodoc
abstract class _$$StreakDataImplCopyWith<$Res> {
  factory _$$StreakDataImplCopyWith(
          _$StreakDataImpl value, $Res Function(_$StreakDataImpl) then) =
      __$$StreakDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({StreakProgressV2 streakProgressV2});

  $StreakProgressV2CopyWith<$Res> get streakProgressV2;
}

/// @nodoc
class __$$StreakDataImplCopyWithImpl<$Res>
    extends _$StreakStateCopyWithImpl<$Res, _$StreakDataImpl>
    implements _$$StreakDataImplCopyWith<$Res> {
  __$$StreakDataImplCopyWithImpl(
      _$StreakDataImpl _value, $Res Function(_$StreakDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? streakProgressV2 = null,
  }) {
    return _then(_$StreakDataImpl(
      null == streakProgressV2
          ? _value.streakProgressV2
          : streakProgressV2 // ignore: cast_nullable_to_non_nullable
              as StreakProgressV2,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $StreakProgressV2CopyWith<$Res> get streakProgressV2 {
    return $StreakProgressV2CopyWith<$Res>(_value.streakProgressV2, (value) {
      return _then(_value.copyWith(streakProgressV2: value));
    });
  }
}

/// @nodoc

class _$StreakDataImpl implements _StreakData {
  const _$StreakDataImpl(this.streakProgressV2);

  @override
  final StreakProgressV2 streakProgressV2;

  @override
  String toString() {
    return 'StreakState.data(streakProgressV2: $streakProgressV2)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StreakDataImpl &&
            (identical(other.streakProgressV2, streakProgressV2) ||
                other.streakProgressV2 == streakProgressV2));
  }

  @override
  int get hashCode => Object.hash(runtimeType, streakProgressV2);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StreakDataImplCopyWith<_$StreakDataImpl> get copyWith =>
      __$$StreakDataImplCopyWithImpl<_$StreakDataImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(StreakProgressV2 streakProgressV2) data,
    required TResult Function() error,
  }) {
    return data(streakProgressV2);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(StreakProgressV2 streakProgressV2)? data,
    TResult? Function()? error,
  }) {
    return data?.call(streakProgressV2);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(StreakProgressV2 streakProgressV2)? data,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(streakProgressV2);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StreakLoading value) loading,
    required TResult Function(_StreakData value) data,
    required TResult Function(_StreakError value) error,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StreakLoading value)? loading,
    TResult? Function(_StreakData value)? data,
    TResult? Function(_StreakError value)? error,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StreakLoading value)? loading,
    TResult Function(_StreakData value)? data,
    TResult Function(_StreakError value)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class _StreakData implements StreakState {
  const factory _StreakData(final StreakProgressV2 streakProgressV2) =
      _$StreakDataImpl;

  StreakProgressV2 get streakProgressV2;
  @JsonKey(ignore: true)
  _$$StreakDataImplCopyWith<_$StreakDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StreakErrorImplCopyWith<$Res> {
  factory _$$StreakErrorImplCopyWith(
          _$StreakErrorImpl value, $Res Function(_$StreakErrorImpl) then) =
      __$$StreakErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StreakErrorImplCopyWithImpl<$Res>
    extends _$StreakStateCopyWithImpl<$Res, _$StreakErrorImpl>
    implements _$$StreakErrorImplCopyWith<$Res> {
  __$$StreakErrorImplCopyWithImpl(
      _$StreakErrorImpl _value, $Res Function(_$StreakErrorImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StreakErrorImpl implements _StreakError {
  const _$StreakErrorImpl();

  @override
  String toString() {
    return 'StreakState.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StreakErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(StreakProgressV2 streakProgressV2) data,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(StreakProgressV2 streakProgressV2)? data,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(StreakProgressV2 streakProgressV2)? data,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StreakLoading value) loading,
    required TResult Function(_StreakData value) data,
    required TResult Function(_StreakError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StreakLoading value)? loading,
    TResult? Function(_StreakData value)? data,
    TResult? Function(_StreakError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StreakLoading value)? loading,
    TResult Function(_StreakData value)? data,
    TResult Function(_StreakError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _StreakError implements StreakState {
  const factory _StreakError() = _$StreakErrorImpl;
}
