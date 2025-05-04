// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_patient_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignPatientResponseBody _$SignPatientResponseBodyFromJson(
        Map<String, dynamic> json) =>
    SignPatientResponseBody(
      success: json['success'] as bool,
      message: json['message'] as String,
      statusCode: (json['status_code'] as num).toInt(),
      patientData: PatientData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SignPatientResponseBodyToJson(
        SignPatientResponseBody instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'status_code': instance.statusCode,
      'data': instance.patientData,
    };

PatientData _$PatientDataFromJson(Map<String, dynamic> json) => PatientData(
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      role: json['role'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      name: json['name'] as String,
      patientId: (json['patient_id'] as num).toInt(),
    );

Map<String, dynamic> _$PatientDataToJson(PatientData instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'phone': instance.phone,
      'address': instance.address,
      'role': instance.role,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'name': instance.name,
      'patient_id': instance.patientId,
    };
