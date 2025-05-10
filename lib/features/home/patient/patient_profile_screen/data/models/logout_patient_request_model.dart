import 'package:json_annotation/json_annotation.dart';

part 'logout_patient_request_model.g.dart';

@JsonSerializable()
class LogoutPatientRequest {
  LogoutPatientRequest();

  factory LogoutPatientRequest.fromJson(Map<String, dynamic> json) =>
      _$LogoutPatientRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LogoutPatientRequestToJson(this);
}