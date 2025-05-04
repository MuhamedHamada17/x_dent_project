import 'package:json_annotation/json_annotation.dart';

part 'sign_patient_request_body.g.dart';

@JsonSerializable()
class SignPatientRequestBody {
  @JsonKey(name: 'first_name')
  final String firstName;

  @JsonKey(name: 'last_name')
  final String lastName;

  final String email;
  final String password;

  @JsonKey(name: 'password_confirmation') // التعديل هنا
  final String confirmPassword;

  final String? phone;
  final String? address;

  @JsonKey(name: 'role')
  final String role;

  SignPatientRequestBody({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.confirmPassword,
    this.phone,
    this.address,
    required this.role,
  });

  factory SignPatientRequestBody.fromJson(Map<String, dynamic> json) =>
      _$SignPatientRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$SignPatientRequestBodyToJson(this);
}