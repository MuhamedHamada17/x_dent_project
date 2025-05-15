import 'package:json_annotation/json_annotation.dart';

part 'add_rating_response_model.g.dart';
@JsonSerializable()
class AddRatingResponse {
  final String message;
  final ReviewData data;

  AddRatingResponse({
    required this.message,
    required this.data,
  });

  factory AddRatingResponse.fromJson(Map<String, dynamic> json) =>
      _$AddRatingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AddRatingResponseToJson(this);
}

@JsonSerializable()
class ReviewData {
  final int id;
  final int doctor_id;
  final int patient_id;
  final String review;
  final String rating;
  final String created_at;
  final String updated_at;

  ReviewData({
    required this.id,
    required this.doctor_id,
    required this.patient_id,
    required this.review,
    required this.rating,
    required this.created_at,
    required this.updated_at,
  });

  factory ReviewData.fromJson(Map<String, dynamic> json) =>
      _$ReviewDataFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewDataToJson(this);
}