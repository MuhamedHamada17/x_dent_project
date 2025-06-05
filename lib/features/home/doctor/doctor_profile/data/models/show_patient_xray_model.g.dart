// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_patient_xray_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShowPatientXrayResponse _$ShowPatientXrayResponseFromJson(
        Map<String, dynamic> json) =>
    ShowPatientXrayResponse(
      status: json['status'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => XrayData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ShowPatientXrayResponseToJson(
        ShowPatientXrayResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

XrayData _$XrayDataFromJson(Map<String, dynamic> json) => XrayData(
      id: (json['id'] as num).toInt(),
      image_url: json['image_url'] as String,
      uploaded_at: json['uploaded_at'] as String,
    );

Map<String, dynamic> _$XrayDataToJson(XrayData instance) => <String, dynamic>{
      'id': instance.id,
      'image_url': instance.image_url,
      'uploaded_at': instance.uploaded_at,
    };
