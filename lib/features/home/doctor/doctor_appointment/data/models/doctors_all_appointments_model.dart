import 'package:json_annotation/json_annotation.dart';

part 'doctors_all_appointments_model.g.dart';

@JsonSerializable()
class DoctorsAllAppointmentsModel {
  final String status;
  final List<Appointment> appointments;

  DoctorsAllAppointmentsModel({
    required this.status,
    required this.appointments,
  });

  factory DoctorsAllAppointmentsModel.fromJson(Map<String, dynamic> json) =>
      _$DoctorsAllAppointmentsModelFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorsAllAppointmentsModelToJson(this);
}

@JsonSerializable()
class Appointment {
  final int id;
  final String day;
  final String status;
  @JsonKey(name: 'appointment_date')
  final String appointmentDate;
  @JsonKey(name: 'appointment_time')
  final String appointmentTime;
  final Patient patient;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'updated_at')
  final String updatedAt;

  Appointment({
    required this.id,
    required this.day,
    required this.status,
    required this.appointmentDate,
    required this.appointmentTime,
    required this.patient,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) =>
      _$AppointmentFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentToJson(this);
}

@JsonSerializable()
class Patient {
  final int id;
  final String name;
  final dynamic age;
  final String? phone;
  final String? message;

  Patient({
    required this.id,
    required this.name,
    required this.age,
    this.phone,
    this.message,
  });

  factory Patient.fromJson(Map<String, dynamic> json) =>
      _$PatientFromJson(json);

  Map<String, dynamic> toJson() => _$PatientToJson(this);
}
