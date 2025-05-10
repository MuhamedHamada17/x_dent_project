// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'treatment_plan_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TreatmentPlanResponse _$TreatmentPlanResponseFromJson(
    Map<String, dynamic> json) {
  return _TreatmentPlanResponse.fromJson(json);
}

/// @nodoc
mixin _$TreatmentPlanResponse {
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'treatment_plans')
  List<TreatmentPlan> get treatmentPlans => throw _privateConstructorUsedError;

  /// Serializes this TreatmentPlanResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TreatmentPlanResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TreatmentPlanResponseCopyWith<TreatmentPlanResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TreatmentPlanResponseCopyWith<$Res> {
  factory $TreatmentPlanResponseCopyWith(TreatmentPlanResponse value,
          $Res Function(TreatmentPlanResponse) then) =
      _$TreatmentPlanResponseCopyWithImpl<$Res, TreatmentPlanResponse>;
  @useResult
  $Res call(
      {String status,
      @JsonKey(name: 'treatment_plans') List<TreatmentPlan> treatmentPlans});
}

/// @nodoc
class _$TreatmentPlanResponseCopyWithImpl<$Res,
        $Val extends TreatmentPlanResponse>
    implements $TreatmentPlanResponseCopyWith<$Res> {
  _$TreatmentPlanResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TreatmentPlanResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? treatmentPlans = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      treatmentPlans: null == treatmentPlans
          ? _value.treatmentPlans
          : treatmentPlans // ignore: cast_nullable_to_non_nullable
              as List<TreatmentPlan>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TreatmentPlanResponseImplCopyWith<$Res>
    implements $TreatmentPlanResponseCopyWith<$Res> {
  factory _$$TreatmentPlanResponseImplCopyWith(
          _$TreatmentPlanResponseImpl value,
          $Res Function(_$TreatmentPlanResponseImpl) then) =
      __$$TreatmentPlanResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String status,
      @JsonKey(name: 'treatment_plans') List<TreatmentPlan> treatmentPlans});
}

/// @nodoc
class __$$TreatmentPlanResponseImplCopyWithImpl<$Res>
    extends _$TreatmentPlanResponseCopyWithImpl<$Res,
        _$TreatmentPlanResponseImpl>
    implements _$$TreatmentPlanResponseImplCopyWith<$Res> {
  __$$TreatmentPlanResponseImplCopyWithImpl(_$TreatmentPlanResponseImpl _value,
      $Res Function(_$TreatmentPlanResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of TreatmentPlanResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? treatmentPlans = null,
  }) {
    return _then(_$TreatmentPlanResponseImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      treatmentPlans: null == treatmentPlans
          ? _value._treatmentPlans
          : treatmentPlans // ignore: cast_nullable_to_non_nullable
              as List<TreatmentPlan>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TreatmentPlanResponseImpl implements _TreatmentPlanResponse {
  const _$TreatmentPlanResponseImpl(
      {required this.status,
      @JsonKey(name: 'treatment_plans')
      required final List<TreatmentPlan> treatmentPlans})
      : _treatmentPlans = treatmentPlans;

  factory _$TreatmentPlanResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TreatmentPlanResponseImplFromJson(json);

  @override
  final String status;
  final List<TreatmentPlan> _treatmentPlans;
  @override
  @JsonKey(name: 'treatment_plans')
  List<TreatmentPlan> get treatmentPlans {
    if (_treatmentPlans is EqualUnmodifiableListView) return _treatmentPlans;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_treatmentPlans);
  }

  @override
  String toString() {
    return 'TreatmentPlanResponse(status: $status, treatmentPlans: $treatmentPlans)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TreatmentPlanResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._treatmentPlans, _treatmentPlans));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status,
      const DeepCollectionEquality().hash(_treatmentPlans));

  /// Create a copy of TreatmentPlanResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TreatmentPlanResponseImplCopyWith<_$TreatmentPlanResponseImpl>
      get copyWith => __$$TreatmentPlanResponseImplCopyWithImpl<
          _$TreatmentPlanResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TreatmentPlanResponseImplToJson(
      this,
    );
  }
}

abstract class _TreatmentPlanResponse implements TreatmentPlanResponse {
  const factory _TreatmentPlanResponse(
          {required final String status,
          @JsonKey(name: 'treatment_plans')
          required final List<TreatmentPlan> treatmentPlans}) =
      _$TreatmentPlanResponseImpl;

  factory _TreatmentPlanResponse.fromJson(Map<String, dynamic> json) =
      _$TreatmentPlanResponseImpl.fromJson;

  @override
  String get status;
  @override
  @JsonKey(name: 'treatment_plans')
  List<TreatmentPlan> get treatmentPlans;

  /// Create a copy of TreatmentPlanResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TreatmentPlanResponseImplCopyWith<_$TreatmentPlanResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

TreatmentPlan _$TreatmentPlanFromJson(Map<String, dynamic> json) {
  return _TreatmentPlan.fromJson(json);
}

/// @nodoc
mixin _$TreatmentPlan {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  Doctor get doctor => throw _privateConstructorUsedError;

  /// Serializes this TreatmentPlan to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TreatmentPlan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TreatmentPlanCopyWith<TreatmentPlan> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TreatmentPlanCopyWith<$Res> {
  factory $TreatmentPlanCopyWith(
          TreatmentPlan value, $Res Function(TreatmentPlan) then) =
      _$TreatmentPlanCopyWithImpl<$Res, TreatmentPlan>;
  @useResult
  $Res call({int id, String name, String status, String date, Doctor doctor});

  $DoctorCopyWith<$Res> get doctor;
}

/// @nodoc
class _$TreatmentPlanCopyWithImpl<$Res, $Val extends TreatmentPlan>
    implements $TreatmentPlanCopyWith<$Res> {
  _$TreatmentPlanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TreatmentPlan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? status = null,
    Object? date = null,
    Object? doctor = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      doctor: null == doctor
          ? _value.doctor
          : doctor // ignore: cast_nullable_to_non_nullable
              as Doctor,
    ) as $Val);
  }

  /// Create a copy of TreatmentPlan
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DoctorCopyWith<$Res> get doctor {
    return $DoctorCopyWith<$Res>(_value.doctor, (value) {
      return _then(_value.copyWith(doctor: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TreatmentPlanImplCopyWith<$Res>
    implements $TreatmentPlanCopyWith<$Res> {
  factory _$$TreatmentPlanImplCopyWith(
          _$TreatmentPlanImpl value, $Res Function(_$TreatmentPlanImpl) then) =
      __$$TreatmentPlanImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String status, String date, Doctor doctor});

  @override
  $DoctorCopyWith<$Res> get doctor;
}

/// @nodoc
class __$$TreatmentPlanImplCopyWithImpl<$Res>
    extends _$TreatmentPlanCopyWithImpl<$Res, _$TreatmentPlanImpl>
    implements _$$TreatmentPlanImplCopyWith<$Res> {
  __$$TreatmentPlanImplCopyWithImpl(
      _$TreatmentPlanImpl _value, $Res Function(_$TreatmentPlanImpl) _then)
      : super(_value, _then);

  /// Create a copy of TreatmentPlan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? status = null,
    Object? date = null,
    Object? doctor = null,
  }) {
    return _then(_$TreatmentPlanImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      doctor: null == doctor
          ? _value.doctor
          : doctor // ignore: cast_nullable_to_non_nullable
              as Doctor,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TreatmentPlanImpl implements _TreatmentPlan {
  const _$TreatmentPlanImpl(
      {required this.id,
      required this.name,
      required this.status,
      required this.date,
      required this.doctor});

  factory _$TreatmentPlanImpl.fromJson(Map<String, dynamic> json) =>
      _$$TreatmentPlanImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String status;
  @override
  final String date;
  @override
  final Doctor doctor;

  @override
  String toString() {
    return 'TreatmentPlan(id: $id, name: $name, status: $status, date: $date, doctor: $doctor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TreatmentPlanImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.doctor, doctor) || other.doctor == doctor));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, status, date, doctor);

  /// Create a copy of TreatmentPlan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TreatmentPlanImplCopyWith<_$TreatmentPlanImpl> get copyWith =>
      __$$TreatmentPlanImplCopyWithImpl<_$TreatmentPlanImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TreatmentPlanImplToJson(
      this,
    );
  }
}

abstract class _TreatmentPlan implements TreatmentPlan {
  const factory _TreatmentPlan(
      {required final int id,
      required final String name,
      required final String status,
      required final String date,
      required final Doctor doctor}) = _$TreatmentPlanImpl;

  factory _TreatmentPlan.fromJson(Map<String, dynamic> json) =
      _$TreatmentPlanImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get status;
  @override
  String get date;
  @override
  Doctor get doctor;

  /// Create a copy of TreatmentPlan
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TreatmentPlanImplCopyWith<_$TreatmentPlanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Doctor _$DoctorFromJson(Map<String, dynamic> json) {
  return _Doctor.fromJson(json);
}

/// @nodoc
mixin _$Doctor {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// Serializes this Doctor to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Doctor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DoctorCopyWith<Doctor> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoctorCopyWith<$Res> {
  factory $DoctorCopyWith(Doctor value, $Res Function(Doctor) then) =
      _$DoctorCopyWithImpl<$Res, Doctor>;
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$DoctorCopyWithImpl<$Res, $Val extends Doctor>
    implements $DoctorCopyWith<$Res> {
  _$DoctorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Doctor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DoctorImplCopyWith<$Res> implements $DoctorCopyWith<$Res> {
  factory _$$DoctorImplCopyWith(
          _$DoctorImpl value, $Res Function(_$DoctorImpl) then) =
      __$$DoctorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class __$$DoctorImplCopyWithImpl<$Res>
    extends _$DoctorCopyWithImpl<$Res, _$DoctorImpl>
    implements _$$DoctorImplCopyWith<$Res> {
  __$$DoctorImplCopyWithImpl(
      _$DoctorImpl _value, $Res Function(_$DoctorImpl) _then)
      : super(_value, _then);

  /// Create a copy of Doctor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$DoctorImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DoctorImpl implements _Doctor {
  const _$DoctorImpl({required this.id, required this.name});

  factory _$DoctorImpl.fromJson(Map<String, dynamic> json) =>
      _$$DoctorImplFromJson(json);

  @override
  final int id;
  @override
  final String name;

  @override
  String toString() {
    return 'Doctor(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoctorImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of Doctor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DoctorImplCopyWith<_$DoctorImpl> get copyWith =>
      __$$DoctorImplCopyWithImpl<_$DoctorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DoctorImplToJson(
      this,
    );
  }
}

abstract class _Doctor implements Doctor {
  const factory _Doctor({required final int id, required final String name}) =
      _$DoctorImpl;

  factory _Doctor.fromJson(Map<String, dynamic> json) = _$DoctorImpl.fromJson;

  @override
  int get id;
  @override
  String get name;

  /// Create a copy of Doctor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DoctorImplCopyWith<_$DoctorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
