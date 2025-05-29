// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'display_xrays_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DisplayXraysResponse _$DisplayXraysResponseFromJson(
        Map<String, dynamic> json) =>
    DisplayXraysResponse(
      status: json['status'] as String? ?? 'unknown',
      xrays: (json['xrays'] as List<dynamic>)
          .map((e) => Xray.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DisplayXraysResponseToJson(
        DisplayXraysResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'xrays': instance.xrays,
    };

Xray _$XrayFromJson(Map<String, dynamic> json) => Xray(
      id: (json['id'] as num).toInt(),
      imageUrl: json['image_url'] as String?,
      uploadedAt: json['uploaded_at'] as String?,
    );

Map<String, dynamic> _$XrayToJson(Xray instance) => <String, dynamic>{
      'id': instance.id,
      'image_url': instance.imageUrl,
      'uploaded_at': instance.uploadedAt,
    };
