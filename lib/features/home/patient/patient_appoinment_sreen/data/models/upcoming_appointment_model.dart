import 'package:json_annotation/json_annotation.dart';

part 'upcoming_appointment_model.g.dart';

@JsonSerializable()
class AppointmentResponse {
  final String status;

  @JsonKey(name: 'pending_appointments')
  final List<PendingAppointment> pendingAppointments;

  AppointmentResponse({
    required this.status,
    required this.pendingAppointments,
  });

  factory AppointmentResponse.fromJson(Map<String, dynamic> json) =>
      _$AppointmentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentResponseToJson(this);
}

@JsonSerializable()
class PendingAppointment {
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

  PendingAppointment({
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

  factory PendingAppointment.fromJson(Map<String, dynamic> json) =>
      _$PendingAppointmentFromJson(json);

  Map<String, dynamic> toJson() => _$PendingAppointmentToJson(this);
}