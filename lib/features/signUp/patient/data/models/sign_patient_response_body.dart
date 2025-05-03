import 'package:json_annotation/json_annotation.dart';
part 'sign_patient_response_body.g.dart';

@JsonSerializable()
class SignPatientResponseBody {
  final bool success;
  final String message;

  @JsonKey(name: 'status_code')
  final int statusCode;

  @JsonKey(name: 'data')
  final PatientData patientData;

  SignPatientResponseBody({
    required this.success,
    required this.message,
    required this.statusCode,
    required this.patientData,
  });

  factory SignPatientResponseBody.fromJson(Map<String, dynamic> json) =>
      _$SignPatientResponseBodyFromJson(json);

  Map<String, dynamic> toJson() => _$SignPatientResponseBodyToJson(this);
}

@JsonSerializable()
class PatientData {
  @JsonKey(name: 'first_name')
  final String firstName;

  @JsonKey(name: 'last_name')
  final String lastName;

  final String email;
  final String? phone;
  final String? address;
  final String role;

  @JsonKey(name: 'created_at')
  final String createdAt;

  @JsonKey(name: 'updated_at')
  final String updatedAt;

  final String name;

  @JsonKey(name: 'patient_id')
  final int patientId;

  PatientData({
    required this.firstName,
    required this.lastName,
    required this.email,
    this.phone,
    this.address,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.patientId,
  });

  factory PatientData.fromJson(Map<String, dynamic> json) =>
      _$PatientDataFromJson(json);

  Map<String, dynamic> toJson() => _$PatientDataToJson(this);
}