import 'package:json_annotation/json_annotation.dart';

part 'patient_details_response_model.g.dart';

@JsonSerializable()
class PatientDetailsResponse {
  final String status;
  final PatientDetailsModel patient;

  PatientDetailsResponse({
    required this.status,
    required this.patient,
  });

  factory PatientDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$PatientDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PatientDetailsResponseToJson(this);
}

@JsonSerializable()
class PatientDetailsModel {
  final int id;
  final String name;
  final int age;
  final String phone;
  final String email;
  @JsonKey(name: 'first_appointment_date')
  final String firstAppointmentDate;

  PatientDetailsModel({
    required this.id,
    required this.name,
    required this.age,
    required this.phone,
    required this.email,
    required this.firstAppointmentDate,
  });

  factory PatientDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$PatientDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$PatientDetailsModelToJson(this);
}
