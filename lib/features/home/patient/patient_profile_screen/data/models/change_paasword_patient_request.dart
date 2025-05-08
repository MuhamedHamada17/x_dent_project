import 'package:json_annotation/json_annotation.dart';

part 'change_paasword_patient_request.g.dart';

@JsonSerializable()
class ChangePasswordPatientRequest {
  @JsonKey(name: 'current_password')
  final String currentPassword;

  @JsonKey(name: 'new_password')
  final String newPassword;

  @JsonKey(name: 'new_password_confirmation')
  final String newPasswordConfirmation;

  ChangePasswordPatientRequest({
    required this.currentPassword,
    required this.newPassword,
    required this.newPasswordConfirmation,
  });

  factory ChangePasswordPatientRequest.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordPatientRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ChangePasswordPatientRequestToJson(this);
}