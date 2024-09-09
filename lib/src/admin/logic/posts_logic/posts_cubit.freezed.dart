// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'posts_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PostsCRUDState {
  DataStatus<dynamic> get datastatus => throw _privateConstructorUsedError;
  DailyPostsModel? get dailyPostsModel => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            DataStatus<dynamic> datastatus, DailyPostsModel? dailyPostsModel)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            DataStatus<dynamic> datastatus, DailyPostsModel? dailyPostsModel)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            DataStatus<dynamic> datastatus, DailyPostsModel? dailyPostsModel)?
        initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of PostsCRUDState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PostsCRUDStateCopyWith<PostsCRUDState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostsCRUDStateCopyWith<$Res> {
  factory $PostsCRUDStateCopyWith(
          PostsCRUDState value, $Res Function(PostsCRUDState) then) =
      _$PostsCRUDStateCopyWithImpl<$Res, PostsCRUDState>;
  @useResult
  $Res call({DataStatus<dynamic> datastatus, DailyPostsModel? dailyPostsModel});
}

/// @nodoc
class _$PostsCRUDStateCopyWithImpl<$Res, $Val extends PostsCRUDState>
    implements $PostsCRUDStateCopyWith<$Res> {
  _$PostsCRUDStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PostsCRUDState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? datastatus = null,
    Object? dailyPostsModel = freezed,
  }) {
    return _then(_value.copyWith(
      datastatus: null == datastatus
          ? _value.datastatus
          : datastatus // ignore: cast_nullable_to_non_nullable
              as DataStatus<dynamic>,
      dailyPostsModel: freezed == dailyPostsModel
          ? _value.dailyPostsModel
          : dailyPostsModel // ignore: cast_nullable_to_non_nullable
              as DailyPostsModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $PostsCRUDStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DataStatus<dynamic> datastatus, DailyPostsModel? dailyPostsModel});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$PostsCRUDStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of PostsCRUDState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? datastatus = null,
    Object? dailyPostsModel = freezed,
  }) {
    return _then(_$InitialImpl(
      datastatus: null == datastatus
          ? _value.datastatus
          : datastatus // ignore: cast_nullable_to_non_nullable
              as DataStatus<dynamic>,
      dailyPostsModel: freezed == dailyPostsModel
          ? _value.dailyPostsModel
          : dailyPostsModel // ignore: cast_nullable_to_non_nullable
              as DailyPostsModel?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl({required this.datastatus, this.dailyPostsModel});

  @override
  final DataStatus<dynamic> datastatus;
  @override
  final DailyPostsModel? dailyPostsModel;

  @override
  String toString() {
    return 'PostsCRUDState.initial(datastatus: $datastatus, dailyPostsModel: $dailyPostsModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.datastatus, datastatus) ||
                other.datastatus == datastatus) &&
            (identical(other.dailyPostsModel, dailyPostsModel) ||
                other.dailyPostsModel == dailyPostsModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, datastatus, dailyPostsModel);

  /// Create a copy of PostsCRUDState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            DataStatus<dynamic> datastatus, DailyPostsModel? dailyPostsModel)
        initial,
  }) {
    return initial(datastatus, dailyPostsModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            DataStatus<dynamic> datastatus, DailyPostsModel? dailyPostsModel)?
        initial,
  }) {
    return initial?.call(datastatus, dailyPostsModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            DataStatus<dynamic> datastatus, DailyPostsModel? dailyPostsModel)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(datastatus, dailyPostsModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements PostsCRUDState {
  const factory _Initial(
      {required final DataStatus<dynamic> datastatus,
      final DailyPostsModel? dailyPostsModel}) = _$InitialImpl;

  @override
  DataStatus<dynamic> get datastatus;
  @override
  DailyPostsModel? get dailyPostsModel;

  /// Create a copy of PostsCRUDState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
