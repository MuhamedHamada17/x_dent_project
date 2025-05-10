import 'package:json_annotation/json_annotation.dart';

part 'logout_patient_response_model.g.dart';

@JsonSerializable()
class LogoutPatientResponse {
  final bool success;
  final String message;
  @JsonKey(name: 'status_code')
  final int statusCode;
  final List<dynamic> data;

  LogoutPatientResponse({
    required this.success,
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory LogoutPatientResponse.fromJson(Map<String, dynamic> json) =>
      _$LogoutPatientResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LogoutPatientResponseToJson(this);
}