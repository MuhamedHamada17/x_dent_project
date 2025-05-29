// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upload_xrays_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UploadXraysState _$UploadXraysStateFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'initial':
      return UploadXraysInitial.fromJson(json);
    case 'loading':
      return UploadXraysLoading.fromJson(json);
    case 'success':
      return UploadXraysSuccess.fromJson(json);
    case 'error':
      return UploadXraysError.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'UploadXraysState',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$UploadXraysState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UploadXraysResponse response) success,
    required TResult Function(ApiErrorModel error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UploadXraysResponse response)? success,
    TResult? Function(ApiErrorModel error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UploadXraysResponse response)? success,
    TResult Function(ApiErrorModel error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UploadXraysInitial value) initial,
    required TResult Function(UploadXraysLoading value) loading,
    required TResult Function(UploadXraysSuccess value) success,
    required TResult Function(UploadXraysError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UploadXraysInitial value)? initial,
    TResult? Function(UploadXraysLoading value)? loading,
    TResult? Function(UploadXraysSuccess value)? success,
    TResult? Function(UploadXraysError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UploadXraysInitial value)? initial,
    TResult Function(UploadXraysLoading value)? loading,
    TResult Function(UploadXraysSuccess value)? success,
    TResult Function(UploadXraysError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this UploadXraysState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadXraysStateCopyWith<$Res> {
  factory $UploadXraysStateCopyWith(
          UploadXraysState value, $Res Function(UploadXraysState) then) =
      _$UploadXraysStateCopyWithImpl<$Res, UploadXraysState>;
}

/// @nodoc
class _$UploadXraysStateCopyWithImpl<$Res, $Val extends UploadXraysState>
    implements $UploadXraysStateCopyWith<$Res> {
  _$UploadXraysStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UploadXraysState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$UploadXraysInitialImplCopyWith<$Res> {
  factory _$$UploadXraysInitialImplCopyWith(_$UploadXraysInitialImpl value,
          $Res Function(_$UploadXraysInitialImpl) then) =
      __$$UploadXraysInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UploadXraysInitialImplCopyWithImpl<$Res>
    extends _$UploadXraysStateCopyWithImpl<$Res, _$UploadXraysInitialImpl>
    implements _$$UploadXraysInitialImplCopyWith<$Res> {
  __$$UploadXraysInitialImplCopyWithImpl(_$UploadXraysInitialImpl _value,
      $Res Function(_$UploadXraysInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of UploadXraysState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$UploadXraysInitialImpl implements UploadXraysInitial {
  const _$UploadXraysInitialImpl({final String? $type})
      : $type = $type ?? 'initial';

  factory _$UploadXraysInitialImpl.fromJson(Map<String, dynamic> json) =>
      _$$UploadXraysInitialImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'UploadXraysState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UploadXraysInitialImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UploadXraysResponse response) success,
    required TResult Function(ApiErrorModel error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UploadXraysResponse response)? success,
    TResult? Function(ApiErrorModel error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UploadXraysResponse response)? success,
    TResult Function(ApiErrorModel error)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UploadXraysInitial value) initial,
    required TResult Function(UploadXraysLoading value) loading,
    required TResult Function(UploadXraysSuccess value) success,
    required TResult Function(UploadXraysError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UploadXraysInitial value)? initial,
    TResult? Function(UploadXraysLoading value)? loading,
    TResult? Function(UploadXraysSuccess value)? success,
    TResult? Function(UploadXraysError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UploadXraysInitial value)? initial,
    TResult Function(UploadXraysLoading value)? loading,
    TResult Function(UploadXraysSuccess value)? success,
    TResult Function(UploadXraysError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UploadXraysInitialImplToJson(
      this,
    );
  }
}

abstract class UploadXraysInitial implements UploadXraysState {
  const factory UploadXraysInitial() = _$UploadXraysInitialImpl;

  factory UploadXraysInitial.fromJson(Map<String, dynamic> json) =
      _$UploadXraysInitialImpl.fromJson;
}

/// @nodoc
abstract class _$$UploadXraysLoadingImplCopyWith<$Res> {
  factory _$$UploadXraysLoadingImplCopyWith(_$UploadXraysLoadingImpl value,
          $Res Function(_$UploadXraysLoadingImpl) then) =
      __$$UploadXraysLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UploadXraysLoadingImplCopyWithImpl<$Res>
    extends _$UploadXraysStateCopyWithImpl<$Res, _$UploadXraysLoadingImpl>
    implements _$$UploadXraysLoadingImplCopyWith<$Res> {
  __$$UploadXraysLoadingImplCopyWithImpl(_$UploadXraysLoadingImpl _value,
      $Res Function(_$UploadXraysLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of UploadXraysState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$UploadXraysLoadingImpl implements UploadXraysLoading {
  const _$UploadXraysLoadingImpl({final String? $type})
      : $type = $type ?? 'loading';

  factory _$UploadXraysLoadingImpl.fromJson(Map<String, dynamic> json) =>
      _$$UploadXraysLoadingImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'UploadXraysState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UploadXraysLoadingImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UploadXraysResponse response) success,
    required TResult Function(ApiErrorModel error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UploadXraysResponse response)? success,
    TResult? Function(ApiErrorModel error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UploadXraysResponse response)? success,
    TResult Function(ApiErrorModel error)? error,
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
    required TResult Function(UploadXraysInitial value) initial,
    required TResult Function(UploadXraysLoading value) loading,
    required TResult Function(UploadXraysSuccess value) success,
    required TResult Function(UploadXraysError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UploadXraysInitial value)? initial,
    TResult? Function(UploadXraysLoading value)? loading,
    TResult? Function(UploadXraysSuccess value)? success,
    TResult? Function(UploadXraysError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UploadXraysInitial value)? initial,
    TResult Function(UploadXraysLoading value)? loading,
    TResult Function(UploadXraysSuccess value)? success,
    TResult Function(UploadXraysError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UploadXraysLoadingImplToJson(
      this,
    );
  }
}

abstract class UploadXraysLoading implements UploadXraysState {
  const factory UploadXraysLoading() = _$UploadXraysLoadingImpl;

  factory UploadXraysLoading.fromJson(Map<String, dynamic> json) =
      _$UploadXraysLoadingImpl.fromJson;
}

/// @nodoc
abstract class _$$UploadXraysSuccessImplCopyWith<$Res> {
  factory _$$UploadXraysSuccessImplCopyWith(_$UploadXraysSuccessImpl value,
          $Res Function(_$UploadXraysSuccessImpl) then) =
      __$$UploadXraysSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UploadXraysResponse response});
}

/// @nodoc
class __$$UploadXraysSuccessImplCopyWithImpl<$Res>
    extends _$UploadXraysStateCopyWithImpl<$Res, _$UploadXraysSuccessImpl>
    implements _$$UploadXraysSuccessImplCopyWith<$Res> {
  __$$UploadXraysSuccessImplCopyWithImpl(_$UploadXraysSuccessImpl _value,
      $Res Function(_$UploadXraysSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of UploadXraysState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
  }) {
    return _then(_$UploadXraysSuccessImpl(
      null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as UploadXraysResponse,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UploadXraysSuccessImpl implements UploadXraysSuccess {
  const _$UploadXraysSuccessImpl(this.response, {final String? $type})
      : $type = $type ?? 'success';

  factory _$UploadXraysSuccessImpl.fromJson(Map<String, dynamic> json) =>
      _$$UploadXraysSuccessImplFromJson(json);

  @override
  final UploadXraysResponse response;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'UploadXraysState.success(response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadXraysSuccessImpl &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, response);

  /// Create a copy of UploadXraysState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadXraysSuccessImplCopyWith<_$UploadXraysSuccessImpl> get copyWith =>
      __$$UploadXraysSuccessImplCopyWithImpl<_$UploadXraysSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UploadXraysResponse response) success,
    required TResult Function(ApiErrorModel error) error,
  }) {
    return success(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UploadXraysResponse response)? success,
    TResult? Function(ApiErrorModel error)? error,
  }) {
    return success?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UploadXraysResponse response)? success,
    TResult Function(ApiErrorModel error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(response);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UploadXraysInitial value) initial,
    required TResult Function(UploadXraysLoading value) loading,
    required TResult Function(UploadXraysSuccess value) success,
    required TResult Function(UploadXraysError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UploadXraysInitial value)? initial,
    TResult? Function(UploadXraysLoading value)? loading,
    TResult? Function(UploadXraysSuccess value)? success,
    TResult? Function(UploadXraysError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UploadXraysInitial value)? initial,
    TResult Function(UploadXraysLoading value)? loading,
    TResult Function(UploadXraysSuccess value)? success,
    TResult Function(UploadXraysError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UploadXraysSuccessImplToJson(
      this,
    );
  }
}

abstract class UploadXraysSuccess implements UploadXraysState {
  const factory UploadXraysSuccess(final UploadXraysResponse response) =
      _$UploadXraysSuccessImpl;

  factory UploadXraysSuccess.fromJson(Map<String, dynamic> json) =
      _$UploadXraysSuccessImpl.fromJson;

  UploadXraysResponse get response;

  /// Create a copy of UploadXraysState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UploadXraysSuccessImplCopyWith<_$UploadXraysSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UploadXraysErrorImplCopyWith<$Res> {
  factory _$$UploadXraysErrorImplCopyWith(_$UploadXraysErrorImpl value,
          $Res Function(_$UploadXraysErrorImpl) then) =
      __$$UploadXraysErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ApiErrorModel error});
}

/// @nodoc
class __$$UploadXraysErrorImplCopyWithImpl<$Res>
    extends _$UploadXraysStateCopyWithImpl<$Res, _$UploadXraysErrorImpl>
    implements _$$UploadXraysErrorImplCopyWith<$Res> {
  __$$UploadXraysErrorImplCopyWithImpl(_$UploadXraysErrorImpl _value,
      $Res Function(_$UploadXraysErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of UploadXraysState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$UploadXraysErrorImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ApiErrorModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UploadXraysErrorImpl implements UploadXraysError {
  const _$UploadXraysErrorImpl(this.error, {final String? $type})
      : $type = $type ?? 'error';

  factory _$UploadXraysErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$UploadXraysErrorImplFromJson(json);

  @override
  final ApiErrorModel error;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'UploadXraysState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadXraysErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of UploadXraysState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadXraysErrorImplCopyWith<_$UploadXraysErrorImpl> get copyWith =>
      __$$UploadXraysErrorImplCopyWithImpl<_$UploadXraysErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UploadXraysResponse response) success,
    required TResult Function(ApiErrorModel error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UploadXraysResponse response)? success,
    TResult? Function(ApiErrorModel error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UploadXraysResponse response)? success,
    TResult Function(ApiErrorModel error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UploadXraysInitial value) initial,
    required TResult Function(UploadXraysLoading value) loading,
    required TResult Function(UploadXraysSuccess value) success,
    required TResult Function(UploadXraysError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UploadXraysInitial value)? initial,
    TResult? Function(UploadXraysLoading value)? loading,
    TResult? Function(UploadXraysSuccess value)? success,
    TResult? Function(UploadXraysError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UploadXraysInitial value)? initial,
    TResult Function(UploadXraysLoading value)? loading,
    TResult Function(UploadXraysSuccess value)? success,
    TResult Function(UploadXraysError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UploadXraysErrorImplToJson(
      this,
    );
  }
}

abstract class UploadXraysError implements UploadXraysState {
  const factory UploadXraysError(final ApiErrorModel error) =
      _$UploadXraysErrorImpl;

  factory UploadXraysError.fromJson(Map<String, dynamic> json) =
      _$UploadXraysErrorImpl.fromJson;

  ApiErrorModel get error;

  /// Create a copy of UploadXraysState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UploadXraysErrorImplCopyWith<_$UploadXraysErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
