import 'package:json_annotation/json_annotation.dart';

part 'doctor_create_treatment_response.g.dart';

@JsonSerializable()
class DoctorCreateTreatmentResponse {
  final String status;
  final String message;
  @JsonKey(name: 'treatment_plan')
  final TreatmentPlan treatmentPlan;
  final Appointment appointment;

  DoctorCreateTreatmentResponse({
    required this.status,
    required this.message,
    required this.treatmentPlan,
    required this.appointment,
  });

  factory DoctorCreateTreatmentResponse.fromJson(Map<String, dynamic> json) =>
      _$DoctorCreateTreatmentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorCreateTreatmentResponseToJson(this);
}

@JsonSerializable()
class TreatmentPlan {
  final int doctorId;
  final String patientId;
  final String name;
  final String date;
  final bool status;
  final String updatedAt;
  final String createdAt;
  final int id;

  TreatmentPlan({
    required this.doctorId,
    required this.patientId,
    required this.name,
    required this.date,
    required this.status,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory TreatmentPlan.fromJson(Map<String, dynamic> json) =>
      _$TreatmentPlanFromJson(json);

  Map<String, dynamic> toJson() => _$TreatmentPlanToJson(this);
}

@JsonSerializable()
class Appointment {
  final int doctorId;
  final String patientId;
  final String appointmentDate;
  final String appointmentTime;
  final String status;
  final int treatmentPlanId;
  final String updatedAt;
  final String createdAt;
  final int id;
  final String day;

  Appointment({
    required this.doctorId,
    required this.patientId,
    required this.appointmentDate,
    required this.appointmentTime,
    required this.status,
    required this.treatmentPlanId,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
    required this.day,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) =>
      _$AppointmentFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentToJson(this);
}
