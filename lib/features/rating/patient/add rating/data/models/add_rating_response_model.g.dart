// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_rating_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddRatingResponse _$AddRatingResponseFromJson(Map<String, dynamic> json) =>
    AddRatingResponse(
      message: json['message'] as String,
      data: ReviewData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddRatingResponseToJson(AddRatingResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

ReviewData _$ReviewDataFromJson(Map<String, dynamic> json) => ReviewData(
      id: (json['id'] as num).toInt(),
      doctor_id: (json['doctor_id'] as num).toInt(),
      patient_id: (json['patient_id'] as num).toInt(),
      review: json['review'] as String,
      rating: json['rating'] as String,
      created_at: json['created_at'] as String,
      updated_at: json['updated_at'] as String,
    );

Map<String, dynamic> _$ReviewDataToJson(ReviewData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'doctor_id': instance.doctor_id,
      'patient_id': instance.patient_id,
      'review': instance.review,
      'rating': instance.rating,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };
