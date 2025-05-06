import 'package:json_annotation/json_annotation.dart';

part 'completed_appointment_model.g.dart';

@JsonSerializable()
class CompletedAppointmentResponse {
  final String status;

  @JsonKey(name: 'completed_appointments')
  final List<CompletedAppointment> completedAppointments;

  CompletedAppointmentResponse({
    required this.status,
    required this.completedAppointments,
  });

  factory CompletedAppointmentResponse.fromJson(Map<String, dynamic> json) =>
      _$CompletedAppointmentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CompletedAppointmentResponseToJson(this);
}

@JsonSerializable()
class CompletedAppointment {
  final int id;

  @JsonKey(name: 'doctor_name')
  final String doctorName;

  final String day;
  final String status;
  final String? location;
  final String? phone;

  @JsonKey(name: 'appointment_date')
  final String appointmentDate;

  @JsonKey(name: 'appointment_time')
  final String appointmentTime;

  @JsonKey(name: 'created_at')
  final String createdAt;

  @JsonKey(name: 'updated_at')
  final String updatedAt;

  CompletedAppointment({
    required this.id,
    required this.doctorName,
    required this.day,
    required this.status,
    this.location,
    this.phone,
    required this.appointmentDate,
    required this.appointmentTime,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CompletedAppointment.fromJson(Map<String, dynamic> json) =>
      _$CompletedAppointmentFromJson(json);

  Map<String, dynamic> toJson() => _$CompletedAppointmentToJson(this);
}