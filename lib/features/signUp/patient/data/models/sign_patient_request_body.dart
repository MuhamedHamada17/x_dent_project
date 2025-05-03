import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_patient_request_body.g.dart';

@JsonSerializable()
class SignPatientRequestBody {
  @JsonKey(name: 'first_name')
  final String firstName;

  @JsonKey(name: 'last_name')
  final String lastName;

  final String email;
  final String password;
  final String? phone;
  final String? address;

  @JsonKey(name: 'role')
  final String role;

  SignPatientRequestBody({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    this.phone,
    this.address,
    required this.role,
  });

  Map<String, dynamic> toJson() => _$SignPatientRequestBodyToJson(this);
}