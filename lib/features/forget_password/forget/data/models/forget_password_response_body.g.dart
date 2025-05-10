// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forget_password_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgetPasswordResponseBody _$ForgetPasswordResponseBodyFromJson(
        Map<String, dynamic> json) =>
    ForgetPasswordResponseBody(
      success: json['success'] as bool,
      message: json['message'] as String,
      statusCode: (json['status_code'] as num).toInt(),
      data: json['data'] as String,
    );

Map<String, dynamic> _$ForgetPasswordResponseBodyToJson(
        ForgetPasswordResponseBody instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'status_code': instance.statusCode,
      'data': instance.data,
    };
