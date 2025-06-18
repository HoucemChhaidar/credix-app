// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remember_me_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RememberMeState {
  bool get remember => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool remember) remember,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool remember)? remember,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool remember)? remember,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Remember value) remember,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Remember value)? remember,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Remember value)? remember,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of RememberMeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RememberMeStateCopyWith<RememberMeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RememberMeStateCopyWith<$Res> {
  factory $RememberMeStateCopyWith(
          RememberMeState value, $Res Function(RememberMeState) then) =
      _$RememberMeStateCopyWithImpl<$Res, RememberMeState>;
  @useResult
  $Res call({bool remember});
}

/// @nodoc
class _$RememberMeStateCopyWithImpl<$Res, $Val extends RememberMeState>
    implements $RememberMeStateCopyWith<$Res> {
  _$RememberMeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RememberMeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? remember = null,
  }) {
    return _then(_value.copyWith(
      remember: null == remember
          ? _value.remember
          : remember // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RememberImplCopyWith<$Res>
    implements $RememberMeStateCopyWith<$Res> {
  factory _$$RememberImplCopyWith(
          _$RememberImpl value, $Res Function(_$RememberImpl) then) =
      __$$RememberImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool remember});
}

/// @nodoc
class __$$RememberImplCopyWithImpl<$Res>
    extends _$RememberMeStateCopyWithImpl<$Res, _$RememberImpl>
    implements _$$RememberImplCopyWith<$Res> {
  __$$RememberImplCopyWithImpl(
      _$RememberImpl _value, $Res Function(_$RememberImpl) _then)
      : super(_value, _then);

  /// Create a copy of RememberMeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? remember = null,
  }) {
    return _then(_$RememberImpl(
      remember: null == remember
          ? _value.remember
          : remember // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$RememberImpl implements _Remember {
  const _$RememberImpl({required this.remember});

  @override
  final bool remember;

  @override
  String toString() {
    return 'RememberMeState.remember(remember: $remember)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RememberImpl &&
            (identical(other.remember, remember) ||
                other.remember == remember));
  }

  @override
  int get hashCode => Object.hash(runtimeType, remember);

  /// Create a copy of RememberMeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RememberImplCopyWith<_$RememberImpl> get copyWith =>
      __$$RememberImplCopyWithImpl<_$RememberImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool remember) remember,
  }) {
    return remember(this.remember);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool remember)? remember,
  }) {
    return remember?.call(this.remember);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool remember)? remember,
    required TResult orElse(),
  }) {
    if (remember != null) {
      return remember(this.remember);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Remember value) remember,
  }) {
    return remember(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Remember value)? remember,
  }) {
    return remember?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Remember value)? remember,
    required TResult orElse(),
  }) {
    if (remember != null) {
      return remember(this);
    }
    return orElse();
  }
}

abstract class _Remember implements RememberMeState {
  const factory _Remember({required final bool remember}) = _$RememberImpl;

  @override
  bool get remember;

  /// Create a copy of RememberMeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RememberImplCopyWith<_$RememberImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
