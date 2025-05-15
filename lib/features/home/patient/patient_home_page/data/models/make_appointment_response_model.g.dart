// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'make_appointment_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MakeAppointmentResponse _$MakeAppointmentResponseFromJson(
        Map<String, dynamic> json) =>
    MakeAppointmentResponse(
      status: json['status'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$MakeAppointmentResponseToJson(
        MakeAppointmentResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
