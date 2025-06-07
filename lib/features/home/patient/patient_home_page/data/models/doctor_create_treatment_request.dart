import 'package:json_annotation/json_annotation.dart';

part 'doctor_create_treatment_request.g.dart';

@JsonSerializable()
class DoctorCreateTreatmentRequest {
  final String name;
  final String date;
  final String? appointmentTime;

  DoctorCreateTreatmentRequest({
    required this.name,
    required this.date,
    this.appointmentTime,
  });

  factory DoctorCreateTreatmentRequest.fromJson(Map<String, dynamic> json) =>
      _$DoctorCreateTreatmentRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorCreateTreatmentRequestToJson(this);
}
