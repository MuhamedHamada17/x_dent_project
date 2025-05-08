// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_paasword_patient_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangePasswordPatientRequest _$ChangePasswordPatientRequestFromJson(
        Map<String, dynamic> json) =>
    ChangePasswordPatientRequest(
      currentPassword: json['current_password'] as String,
      newPassword: json['new_password'] as String,
      newPasswordConfirmation: json['new_password_confirmation'] as String,
    );

Map<String, dynamic> _$ChangePasswordPatientRequestToJson(
        ChangePasswordPatientRequest instance) =>
    <String, dynamic>{
      'current_password': instance.currentPassword,
      'new_password': instance.newPassword,
      'new_password_confirmation': instance.newPasswordConfirmation,
    };
