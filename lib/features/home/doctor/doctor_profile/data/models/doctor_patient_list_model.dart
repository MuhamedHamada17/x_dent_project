// doctor_patient_list_model.dart
import 'package:json_annotation/json_annotation.dart';

part 'doctor_patient_list_model.g.dart';

@JsonSerializable()
class DoctorPatientListModel {
  final String status;
  final List<Patient> patients;

  DoctorPatientListModel({
    required this.status,
    required this.patients,
  });

  factory DoctorPatientListModel.fromJson(Map<String, dynamic> json) =>
      _$DoctorPatientListModelFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorPatientListModelToJson(this);
}

@JsonSerializable()
class Patient {
  final int id;
  final String name;
  @JsonKey(name: 'apppointment_date')
  final String appointmentDate;

  Patient({
    required this.id,
    required this.name,
    required this.appointmentDate,
  });

  factory Patient.fromJson(Map<String, dynamic> json) =>
      _$PatientFromJson(json);

  Map<String, dynamic> toJson() => _$PatientToJson(this);
}
