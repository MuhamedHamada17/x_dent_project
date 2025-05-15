// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_slots_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeSlotsResponse _$TimeSlotsResponseFromJson(Map<String, dynamic> json) =>
    TimeSlotsResponse(
      status: json['status'] as String,
      slots: (json['available_slots'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$TimeSlotsResponseToJson(TimeSlotsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'available_slots': instance.slots,
    };
