// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cancel_appointment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CancelAppointmentModel _$CancelAppointmentModelFromJson(
        Map<String, dynamic> json) =>
    CancelAppointmentModel(
      status: json['status'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$CancelAppointmentModelToJson(
        CancelAppointmentModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
