// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_create_treatment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorCreateTreatmentRequest _$DoctorCreateTreatmentRequestFromJson(
        Map<String, dynamic> json) =>
    DoctorCreateTreatmentRequest(
      name: json['name'] as String,
      date: json['date'] as String,
      appointmentTime: json['appointmentTime'] as String?,
    );

Map<String, dynamic> _$DoctorCreateTreatmentRequestToJson(
        DoctorCreateTreatmentRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'date': instance.date,
      'appointmentTime': instance.appointmentTime,
    };
