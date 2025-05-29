// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_xrays_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadXraysResponse _$UploadXraysResponseFromJson(Map<String, dynamic> json) =>
    UploadXraysResponse(
      message: json['message'] as String,
      xray: XrayData.fromJson(json['xray'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UploadXraysResponseToJson(
        UploadXraysResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'xray': instance.xray,
    };

XrayData _$XrayDataFromJson(Map<String, dynamic> json) => XrayData(
      patientId: (json['patient_id'] as num?)?.toInt(),
      imagePath: json['image_path'] as String,
      updatedAt: json['updated_at'] as String,
      createdAt: json['created_at'] as String,
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$XrayDataToJson(XrayData instance) => <String, dynamic>{
      'patient_id': instance.patientId,
      'image_path': instance.imagePath,
      'updated_at': instance.updatedAt,
      'created_at': instance.createdAt,
      'id': instance.id,
    };
