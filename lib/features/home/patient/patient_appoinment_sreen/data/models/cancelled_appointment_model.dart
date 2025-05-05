import 'package:json_annotation/json_annotation.dart';

part 'cancelled_appointment_model.g.dart';

@JsonSerializable()
class CancelledAppointmentResponse {
  final String status;

  @JsonKey(name: 'cancelled_appointments')
  final List<CancelledAppointment> cancelledAppointments;

  CancelledAppointmentResponse({
    required this.status,
    required this.cancelledAppointments,
  });

  factory CancelledAppointmentResponse.fromJson(Map<String, dynamic> json) =>
      _$CancelledAppointmentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CancelledAppointmentResponseToJson(this);
}

@JsonSerializable()
class CancelledAppointment {
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

  CancelledAppointment({
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

  factory CancelledAppointment.fromJson(Map<String, dynamic> json) =>
      _$CancelledAppointmentFromJson(json);

  Map<String, dynamic> toJson() => _$CancelledAppointmentToJson(this);
}