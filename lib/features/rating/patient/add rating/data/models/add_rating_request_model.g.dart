// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_rating_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddRatingRequest _$AddRatingRequestFromJson(Map<String, dynamic> json) =>
    AddRatingRequest(
      review: json['review'] as String,
      rating: json['rating'] as String,
    );

Map<String, dynamic> _$AddRatingRequestToJson(AddRatingRequest instance) =>
    <String, dynamic>{
      'review': instance.review,
      'rating': instance.rating,
    };
