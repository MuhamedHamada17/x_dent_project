// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_create_treatment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorCreateTreatmentResponse _$DoctorCreateTreatmentResponseFromJson(
        Map<String, dynamic> json) =>
    DoctorCreateTreatmentResponse(
      status: json['status'] as String,
      message: json['message'] as String,
      treatmentPlan: TreatmentPlan.fromJson(
          json['treatment_plan'] as Map<String, dynamic>),
      appointment:
          Appointment.fromJson(json['appointment'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DoctorCreateTreatmentResponseToJson(
        DoctorCreateTreatmentResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'treatment_plan': instance.treatmentPlan,
      'appointment': instance.appointment,
    };

TreatmentPlan _$TreatmentPlanFromJson(Map<String, dynamic> json) =>
    TreatmentPlan(
      doctorId: (json['doctorId'] as num).toInt(),
      patientId: json['patientId'] as String,
      name: json['name'] as String,
      date: json['date'] as String,
      status: json['status'] as bool,
      updatedAt: json['updatedAt'] as String,
      createdAt: json['createdAt'] as String,
      id: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$TreatmentPlanToJson(TreatmentPlan instance) =>
    <String, dynamic>{
      'doctorId': instance.doctorId,
      'patientId': instance.patientId,
      'name': instance.name,
      'date': instance.date,
      'status': instance.status,
      'updatedAt': instance.updatedAt,
      'createdAt': instance.createdAt,
      'id': instance.id,
    };

Appointment _$AppointmentFromJson(Map<String, dynamic> json) => Appointment(
      doctorId: (json['doctorId'] as num).toInt(),
      patientId: json['patientId'] as String,
      appointmentDate: json['appointmentDate'] as String,
      appointmentTime: json['appointmentTime'] as String,
      status: json['status'] as String,
      treatmentPlanId: (json['treatmentPlanId'] as num).toInt(),
      updatedAt: json['updatedAt'] as String,
      createdAt: json['createdAt'] as String,
      id: (json['id'] as num).toInt(),
      day: json['day'] as String,
    );

Map<String, dynamic> _$AppointmentToJson(Appointment instance) =>
    <String, dynamic>{
      'doctorId': instance.doctorId,
      'patientId': instance.patientId,
      'appointmentDate': instance.appointmentDate,
      'appointmentTime': instance.appointmentTime,
      'status': instance.status,
      'treatmentPlanId': instance.treatmentPlanId,
      'updatedAt': instance.updatedAt,
      'createdAt': instance.createdAt,
      'id': instance.id,
      'day': instance.day,
    };
