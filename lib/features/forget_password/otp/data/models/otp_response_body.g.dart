// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtpResponseBody _$OtpResponseBodyFromJson(Map<String, dynamic> json) =>
    OtpResponseBody(
      success: json['success'] as bool,
      message: json['message'] as String,
      statusCode: (json['status_code'] as num).toInt(),
      data: json['data'] as String,
    );

Map<String, dynamic> _$OtpResponseBodyToJson(OtpResponseBody instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'status_code': instance.statusCode,
      'data': instance.data,
    };
