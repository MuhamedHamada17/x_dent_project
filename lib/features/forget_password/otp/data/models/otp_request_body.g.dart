// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtpRequestBody _$OtpRequestBodyFromJson(Map<String, dynamic> json) =>
    OtpRequestBody(
      email: json['email'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$OtpRequestBodyToJson(OtpRequestBody instance) =>
    <String, dynamic>{
      'email': instance.email,
      'code': instance.code,
    };
