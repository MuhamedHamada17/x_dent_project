import 'package:json_annotation/json_annotation.dart';

part 'make_appointment_request_model.g.dart';

@JsonSerializable()
class MakeAppointmentRequest {
  final String day;
  final String time;

  MakeAppointmentRequest({
    required this.day,
    required this.time,
  });

  factory MakeAppointmentRequest.fromJson(Map<String, dynamic> json) =>
      _$MakeAppointmentRequestFromJson(json);

  Map<String, dynamic> toJson() => _$MakeAppointmentRequestToJson(this);
}