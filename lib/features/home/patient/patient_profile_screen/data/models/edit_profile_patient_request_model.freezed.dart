// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_profile_patient_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EditProfilePatientRequest _$EditProfilePatientRequestFromJson(
    Map<String, dynamic> json) {
  return _EditProfilePatientRequest.fromJson(json);
}

/// @nodoc
mixin _$EditProfilePatientRequest {
  @JsonKey(name: 'first_name')
  String get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String get lastName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

  /// Serializes this EditProfilePatientRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EditProfilePatientRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EditProfilePatientRequestCopyWith<EditProfilePatientRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditProfilePatientRequestCopyWith<$Res> {
  factory $EditProfilePatientRequestCopyWith(EditProfilePatientRequest value,
          $Res Function(EditProfilePatientRequest) then) =
      _$EditProfilePatientRequestCopyWithImpl<$Res, EditProfilePatientRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'first_name') String firstName,
      @JsonKey(name: 'last_name') String lastName,
      String email});
}

/// @nodoc
class _$EditProfilePatientRequestCopyWithImpl<$Res,
        $Val extends EditProfilePatientRequest>
    implements $EditProfilePatientRequestCopyWith<$Res> {
  _$EditProfilePatientRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EditProfilePatientRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EditProfilePatientRequestImplCopyWith<$Res>
    implements $EditProfilePatientRequestCopyWith<$Res> {
  factory _$$EditProfilePatientRequestImplCopyWith(
          _$EditProfilePatientRequestImpl value,
          $Res Function(_$EditProfilePatientRequestImpl) then) =
      __$$EditProfilePatientRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'first_name') String firstName,
      @JsonKey(name: 'last_name') String lastName,
      String email});
}

/// @nodoc
class __$$EditProfilePatientRequestImplCopyWithImpl<$Res>
    extends _$EditProfilePatientRequestCopyWithImpl<$Res,
        _$EditProfilePatientRequestImpl>
    implements _$$EditProfilePatientRequestImplCopyWith<$Res> {
  __$$EditProfilePatientRequestImplCopyWithImpl(
      _$EditProfilePatientRequestImpl _value,
      $Res Function(_$EditProfilePatientRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of EditProfilePatientRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
  }) {
    return _then(_$EditProfilePatientRequestImpl(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EditProfilePatientRequestImpl implements _EditProfilePatientRequest {
  const _$EditProfilePatientRequestImpl(
      {@JsonKey(name: 'first_name') required this.firstName,
      @JsonKey(name: 'last_name') required this.lastName,
      required this.email});

  factory _$EditProfilePatientRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$EditProfilePatientRequestImplFromJson(json);

  @override
  @JsonKey(name: 'first_name')
  final String firstName;
  @override
  @JsonKey(name: 'last_name')
  final String lastName;
  @override
  final String email;

  @override
  String toString() {
    return 'EditProfilePatientRequest(firstName: $firstName, lastName: $lastName, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditProfilePatientRequestImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, firstName, lastName, email);

  /// Create a copy of EditProfilePatientRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EditProfilePatientRequestImplCopyWith<_$EditProfilePatientRequestImpl>
      get copyWith => __$$EditProfilePatientRequestImplCopyWithImpl<
          _$EditProfilePatientRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EditProfilePatientRequestImplToJson(
      this,
    );
  }
}

abstract class _EditProfilePatientRequest implements EditProfilePatientRequest {
  const factory _EditProfilePatientRequest(
      {@JsonKey(name: 'first_name') required final String firstName,
      @JsonKey(name: 'last_name') required final String lastName,
      required final String email}) = _$EditProfilePatientRequestImpl;

  factory _EditProfilePatientRequest.fromJson(Map<String, dynamic> json) =
      _$EditProfilePatientRequestImpl.fromJson;

  @override
  @JsonKey(name: 'first_name')
  String get firstName;
  @override
  @JsonKey(name: 'last_name')
  String get lastName;
  @override
  String get email;

  /// Create a copy of EditProfilePatientRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EditProfilePatientRequestImplCopyWith<_$EditProfilePatientRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
