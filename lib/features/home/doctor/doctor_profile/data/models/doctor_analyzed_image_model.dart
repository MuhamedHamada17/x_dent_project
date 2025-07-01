import 'package:json_annotation/json_annotation.dart';

part 'doctor_analyzed_image_model.g.dart';

@JsonSerializable()
class DoctorAnalyzedImageResponse {
  final String status;
  final List<AnalyzedImageData> data;

  DoctorAnalyzedImageResponse({
    required this.status,
    required this.data,
  });

  factory DoctorAnalyzedImageResponse.fromJson(Map<String, dynamic> json) =>
      _$DoctorAnalyzedImageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorAnalyzedImageResponseToJson(this);
}

@JsonSerializable()
class AnalyzedImageData {
  final int id;
  final String image_url;

  AnalyzedImageData({
    required this.id,
    required this.image_url,
  });

  factory AnalyzedImageData.fromJson(Map<String, dynamic> json) =>
      _$AnalyzedImageDataFromJson(json);

  Map<String, dynamic> toJson() => _$AnalyzedImageDataToJson(this);
}
