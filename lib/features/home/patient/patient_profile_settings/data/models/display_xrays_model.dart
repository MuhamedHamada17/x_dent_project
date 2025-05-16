import 'package:json_annotation/json_annotation.dart';

part 'display_xrays_model.g.dart';

@JsonSerializable()
class DisplayXraysResponse {
  @JsonKey(defaultValue: 'unknown')
  final String? status;
  final List<Xray> xrays;

  DisplayXraysResponse({
    this.status,
    required this.xrays,
  });

  factory DisplayXraysResponse.fromJson(Map<String, dynamic> json) =>
      _$DisplayXraysResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DisplayXraysResponseToJson(this);
}

@JsonSerializable()
class Xray {
  final int id;
  @JsonKey(name: 'image_url', defaultValue: null)
  final String? imageUrl;
  @JsonKey(name: 'uploaded_at', defaultValue: null)
  final String? uploadedAt;

  Xray({
    required this.id,
    this.imageUrl,
    this.uploadedAt,
  });

  factory Xray.fromJson(Map<String, dynamic> json) => _$XrayFromJson(json);

  Map<String, dynamic> toJson() => _$XrayToJson(this);
}