import 'package:json_annotation/json_annotation.dart';

part 'doctors_reservation_appointments_model.g.dart';

@JsonSerializable()
class DoctorsReservationAppointmentsModel {
  final String status;
  final Appointment appointment;

  DoctorsReservationAppointmentsModel({
    required this.status,
    required this.appointment,
  });

  factory DoctorsReservationAppointmentsModel.fromJson(
          Map<String, dynamic> json) =>
      _$DoctorsReservationAppointmentsModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$DoctorsReservationAppointmentsModelToJson(this);
}

@JsonSerializable()
class Appointment {
  final int id;
  final Patient patient;
  @JsonKey(name: 'appointment_date')
  final String appointmentDate;
  @JsonKey(name: 'appointment_time')
  final String appointmentTime;
  final String day;
  @JsonKey(name: 'estimate_duration')
  final String estimateDuration;
  final String status;
  @JsonKey(name: 'treatment_plan')
  final TreatmentPlan treatmentPlan;

  Appointment({
    required this.id,
    required this.patient,
    required this.appointmentDate,
    required this.appointmentTime,
    required this.day,
    required this.estimateDuration,
    required this.status,
    required this.treatmentPlan,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) =>
      _$AppointmentFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentToJson(this);
}

@JsonSerializable()
class Patient {
  final int id;
  final String name;
  final int age;
  final String phone;
  final String email;

  Patient({
    required this.id,
    required this.name,
    required this.age,
    required this.phone,
    required this.email,
  });

  factory Patient.fromJson(Map<String, dynamic> json) =>
      _$PatientFromJson(json);

  Map<String, dynamic> toJson() => _$PatientToJson(this);
}

@JsonSerializable()
class TreatmentPlan {
  final int id;
  final String name;
  final String status;
  final String date;

  TreatmentPlan({
    required this.id,
    required this.name,
    required this.status,
    required this.date,
  });

  factory TreatmentPlan.fromJson(Map<String, dynamic> json) =>
      _$TreatmentPlanFromJson(json);

  Map<String, dynamic> toJson() => _$TreatmentPlanToJson(this);
}
