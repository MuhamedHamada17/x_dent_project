// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'make_appointment_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MakeAppointmentRequest _$MakeAppointmentRequestFromJson(
        Map<String, dynamic> json) =>
    MakeAppointmentRequest(
      day: json['day'] as String,
      time: json['time'] as String,
    );

Map<String, dynamic> _$MakeAppointmentRequestToJson(
        MakeAppointmentRequest instance) =>
    <String, dynamic>{
      'day': instance.day,
      'time': instance.time,
    };
