// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctors_all_appointments_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorsAllAppointmentsModel _$DoctorsAllAppointmentsModelFromJson(
        Map<String, dynamic> json) =>
    DoctorsAllAppointmentsModel(
      status: json['status'] as String,
      appointments: (json['appointments'] as List<dynamic>)
          .map((e) => Appointment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DoctorsAllAppointmentsModelToJson(
        DoctorsAllAppointmentsModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'appointments': instance.appointments,
    };

Appointment _$AppointmentFromJson(Map<String, dynamic> json) => Appointment(
      id: (json['id'] as num).toInt(),
      day: json['day'] as String,
      status: json['status'] as String,
      appointmentDate: json['appointment_date'] as String,
      appointmentTime: json['appointment_time'] as String,
      patient: Patient.fromJson(json['patient'] as Map<String, dynamic>),
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$AppointmentToJson(Appointment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'day': instance.day,
      'status': instance.status,
      'appointment_date': instance.appointmentDate,
      'appointment_time': instance.appointmentTime,
      'patient': instance.patient,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

Patient _$PatientFromJson(Map<String, dynamic> json) => Patient(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      age: (json['age'] as num).toInt(),
      phone: json['phone'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$PatientToJson(Patient instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'age': instance.age,
      'phone': instance.phone,
      'message': instance.message,
    };
