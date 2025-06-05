import 'package:json_annotation/json_annotation.dart';

part 'show_patient_xray_model.g.dart';

@JsonSerializable()
class ShowPatientXrayResponse {
  final String status;
  final List<XrayData> data;

  ShowPatientXrayResponse({
    required this.status,
    required this.data,
  });

  factory ShowPatientXrayResponse.fromJson(Map<String, dynamic> json) =>
      _$ShowPatientXrayResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ShowPatientXrayResponseToJson(this);
}

@JsonSerializable()
class XrayData {
  final int id;
  final String image_url;
  final String uploaded_at;

  XrayData({
    required this.id,
    required this.image_url,
    required this.uploaded_at,
  });

  factory XrayData.fromJson(Map<String, dynamic> json) =>
      _$XrayDataFromJson(json);

  Map<String, dynamic> toJson() => _$XrayDataToJson(this);
}
