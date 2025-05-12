import 'package:json_annotation/json_annotation.dart';

part 'get_all_doctors_model.g.dart';

@JsonSerializable()
class GetAllDoctorsResponse {
  final bool success;
  final String message;
  @JsonKey(name: 'status_code')
  final int statusCode;
  final List<DoctorData> data;

  GetAllDoctorsResponse({
    required this.success,
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory GetAllDoctorsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllDoctorsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllDoctorsResponseToJson(this);
}

@JsonSerializable()
class DoctorData {
  final int id;
  final String name;
  final String? email;
  final String? phone;

  DoctorData({
    required this.id,
    required this.name,
    this.email,
    this.phone,
  });

  factory DoctorData.fromJson(Map<String, dynamic> json) =>
      _$DoctorDataFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorDataToJson(this);
}