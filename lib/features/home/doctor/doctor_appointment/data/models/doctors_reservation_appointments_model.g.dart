// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctors_reservation_appointments_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorsReservationAppointmentsModel
    _$DoctorsReservationAppointmentsModelFromJson(Map<String, dynamic> json) =>
        DoctorsReservationAppointmentsModel(
          status: json['status'] as String,
          appointment:
              Appointment.fromJson(json['appointment'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$DoctorsReservationAppointmentsModelToJson(
        DoctorsReservationAppointmentsModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'appointment': instance.appointment,
    };

Appointment _$AppointmentFromJson(Map<String, dynamic> json) => Appointment(
      id: (json['id'] as num).toInt(),
      patient: Patient.fromJson(json['patient'] as Map<String, dynamic>),
      appointmentDate: json['appointment_date'] as String,
      appointmentTime: json['appointment_time'] as String,
      day: json['day'] as String,
      estimateDuration: json['estimate_duration'] as String,
      status: json['status'] as String,
      treatmentPlan: TreatmentPlan.fromJson(
          json['treatment_plan'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AppointmentToJson(Appointment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'patient': instance.patient,
      'appointment_date': instance.appointmentDate,
      'appointment_time': instance.appointmentTime,
      'day': instance.day,
      'estimate_duration': instance.estimateDuration,
      'status': instance.status,
      'treatment_plan': instance.treatmentPlan,
    };

Patient _$PatientFromJson(Map<String, dynamic> json) => Patient(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      age: (json['age'] as num).toInt(),
      phone: json['phone'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$PatientToJson(Patient instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'age': instance.age,
      'phone': instance.phone,
      'email': instance.email,
    };

TreatmentPlan _$TreatmentPlanFromJson(Map<String, dynamic> json) =>
    TreatmentPlan(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      status: json['status'] as String,
      date: json['date'] as String,
    );

Map<String, dynamic> _$TreatmentPlanToJson(TreatmentPlan instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'date': instance.date,
    };
