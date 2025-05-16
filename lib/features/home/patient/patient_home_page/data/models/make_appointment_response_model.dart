import 'package:json_annotation/json_annotation.dart';

part 'make_appointment_response_model.g.dart';

@JsonSerializable()
class MakeAppointmentResponse {
  final String status;
  final String message;

  MakeAppointmentResponse({
    required this.status,
    required this.message,
  });

  factory MakeAppointmentResponse.fromJson(Map<String, dynamic> json) =>
      _$MakeAppointmentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MakeAppointmentResponseToJson(this);
}