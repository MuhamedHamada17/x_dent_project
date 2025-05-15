import 'package:json_annotation/json_annotation.dart';

part 'add_rating_request_model.g.dart';

@JsonSerializable()
class AddRatingRequest {
  final String review;
  final String rating;

  AddRatingRequest({
    required this.review,
    required this.rating,
  });

  factory AddRatingRequest.fromJson(Map<String, dynamic> json) =>
      _$AddRatingRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddRatingRequestToJson(this);
}