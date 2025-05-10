// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logout_patient_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogoutPatientResponse _$LogoutPatientResponseFromJson(
        Map<String, dynamic> json) =>
    LogoutPatientResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
      statusCode: (json['status_code'] as num).toInt(),
      data: json['data'] as List<dynamic>,
    );

Map<String, dynamic> _$LogoutPatientResponseToJson(
        LogoutPatientResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'status_code': instance.statusCode,
      'data': instance.data,
    };
