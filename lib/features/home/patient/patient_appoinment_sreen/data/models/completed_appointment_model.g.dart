// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'completed_appointment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompletedAppointmentResponse _$CompletedAppointmentResponseFromJson(
        Map<String, dynamic> json) =>
    CompletedAppointmentResponse(
      status: json['status'] as String,
      completedAppointments: (json['completed_appointments'] as List<dynamic>)
          .map((e) => CompletedAppointment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CompletedAppointmentResponseToJson(
        CompletedAppointmentResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'completed_appointments': instance.completedAppointments,
    };

CompletedAppointment _$CompletedAppointmentFromJson(
        Map<String, dynamic> json) =>
    CompletedAppointment(
      id: (json['id'] as num).toInt(),
      doctorName: json['doctor_name'] as String,
      day: json['day'] as String,
      status: json['status'] as String,
      location: json['location'] as String?,
      phone: json['phone'] as String?,
      appointmentDate: json['appointment_date'] as String,
      appointmentTime: json['appointment_time'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$CompletedAppointmentToJson(
        CompletedAppointment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'doctor_name': instance.doctorName,
      'day': instance.day,
      'status': instance.status,
      'location': instance.location,
      'phone': instance.phone,
      'appointment_date': instance.appointmentDate,
      'appointment_time': instance.appointmentTime,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
