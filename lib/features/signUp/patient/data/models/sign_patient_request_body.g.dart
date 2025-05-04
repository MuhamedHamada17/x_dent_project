// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_patient_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignPatientRequestBody _$SignPatientRequestBodyFromJson(
        Map<String, dynamic> json) =>
    SignPatientRequestBody(
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      confirmPassword: json['password_confirmation'] as String,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      role: json['role'] as String,
    );

Map<String, dynamic> _$SignPatientRequestBodyToJson(
        SignPatientRequestBody instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'password': instance.password,
      'password_confirmation': instance.confirmPassword,
      'phone': instance.phone,
      'address': instance.address,
      'role': instance.role,
    };
