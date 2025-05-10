// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetPasswordResponseBody _$ResetPasswordResponseBodyFromJson(
        Map<String, dynamic> json) =>
    ResetPasswordResponseBody(
      success: json['success'] as bool,
      message: json['message'] as String,
      statusCode: (json['status_code'] as num).toInt(),
    );

Map<String, dynamic> _$ResetPasswordResponseBodyToJson(
        ResetPasswordResponseBody instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'status_code': instance.statusCode,
    };
