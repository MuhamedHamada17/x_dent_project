import 'package:json_annotation/json_annotation.dart';

part 'change_password_patient_response.g.dart';

@JsonSerializable()
class ChangePasswordPatientResponse {
  final String status;
  final String? message;

  ChangePasswordPatientResponse({
    required this.status,
    this.message,
  });

  factory ChangePasswordPatientResponse.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordPatientResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChangePasswordPatientResponseToJson(this);
}