// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_details_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientDetailsResponse _$PatientDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    PatientDetailsResponse(
      status: json['status'] as String,
      patient:
          PatientDetailsModel.fromJson(json['patient'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PatientDetailsResponseToJson(
        PatientDetailsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'patient': instance.patient,
    };

PatientDetailsModel _$PatientDetailsModelFromJson(Map<String, dynamic> json) =>
    PatientDetailsModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      age: json['age'],
      phone: json['phone'] as String,
      email: json['email'] as String,
      firstAppointmentDate: json['first_appointment_date'] as String,
    );

Map<String, dynamic> _$PatientDetailsModelToJson(
        PatientDetailsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'age': instance.age,
      'phone': instance.phone,
      'email': instance.email,
      'first_appointment_date': instance.firstAppointmentDate,
    };
