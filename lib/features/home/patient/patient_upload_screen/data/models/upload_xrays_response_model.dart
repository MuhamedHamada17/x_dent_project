import 'package:json_annotation/json_annotation.dart';

part 'upload_xrays_response_model.g.dart';

@JsonSerializable()
class UploadXraysResponse {
  final String message;
  final XrayData xray;

  UploadXraysResponse({
    required this.message,
    required this.xray,
  });

  factory UploadXraysResponse.fromJson(Map<String, dynamic> json) =>
      _$UploadXraysResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UploadXraysResponseToJson(this);
}

@JsonSerializable()
class XrayData {
  @JsonKey(name: 'patient_id') // نستخدم JsonKey عشان نطابق اسم الحقل في JSON
  final int? patientId; // غيرناها لـ int? عشان تقبل null
  @JsonKey(name: 'image_path')
  final String imagePath;
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  @JsonKey(name: 'created_at')
  final String createdAt;
  final int? id; // غيرناها لـ int? عشان تقبل null

  XrayData({
    this.patientId,
    required this.imagePath,
    required this.updatedAt,
    required this.createdAt,
    this.id,
  });

  factory XrayData.fromJson(Map<String, dynamic> json) =>
      _$XrayDataFromJson(json);

  Map<String, dynamic> toJson() => _$XrayDataToJson(this);
}