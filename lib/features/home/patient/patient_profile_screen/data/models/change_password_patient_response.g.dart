// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_patient_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangePasswordPatientResponse _$ChangePasswordPatientResponseFromJson(
        Map<String, dynamic> json) =>
    ChangePasswordPatientResponse(
      status: json['status'] as String,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ChangePasswordPatientResponseToJson(
        ChangePasswordPatientResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
