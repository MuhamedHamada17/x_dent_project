// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_analyzed_image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorAnalyzedImageResponse _$DoctorAnalyzedImageResponseFromJson(
        Map<String, dynamic> json) =>
    DoctorAnalyzedImageResponse(
      status: json['status'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => AnalyzedImageData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DoctorAnalyzedImageResponseToJson(
        DoctorAnalyzedImageResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

AnalyzedImageData _$AnalyzedImageDataFromJson(Map<String, dynamic> json) =>
    AnalyzedImageData(
      id: (json['id'] as num).toInt(),
      image_url: json['image_url'] as String,
    );

Map<String, dynamic> _$AnalyzedImageDataToJson(AnalyzedImageData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image_url': instance.image_url,
    };
