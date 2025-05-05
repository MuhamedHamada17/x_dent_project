// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upcoming_appointment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentResponse _$AppointmentResponseFromJson(Map<String, dynamic> json) =>
    AppointmentResponse(
      status: json['status'] as String,
      pendingAppointments: (json['pending_appointments'] as List<dynamic>)
          .map((e) => PendingAppointment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AppointmentResponseToJson(
        AppointmentResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'pending_appointments': instance.pendingAppointments,
    };

PendingAppointment _$PendingAppointmentFromJson(Map<String, dynamic> json) =>
    PendingAppointment(
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

Map<String, dynamic> _$PendingAppointmentToJson(PendingAppointment instance) =>
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
