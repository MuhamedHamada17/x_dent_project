import 'package:json_annotation/json_annotation.dart';

part 'doctor_patient_treatment_plan_model.g.dart';

@JsonSerializable()
class DoctorPatientTreatmentPlanModel {
  final String status;
  @JsonKey(name: 'treatment_plans')
  final List<TreatmentPlan> treatmentPlans;

  DoctorPatientTreatmentPlanModel({
    required this.status,
    required this.treatmentPlans,
  });

  factory DoctorPatientTreatmentPlanModel.fromJson(Map<String, dynamic> json) =>
      _$DoctorPatientTreatmentPlanModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$DoctorPatientTreatmentPlanModelToJson(this);
}

@JsonSerializable()
class TreatmentPlan {
  final int id;
  final String name;
  final int status;
  final String date;

  TreatmentPlan({
    required this.id,
    required this.name,
    required this.status,
    required this.date,
  });

  factory TreatmentPlan.fromJson(Map<String, dynamic> json) =>
      _$TreatmentPlanFromJson(json);

  Map<String, dynamic> toJson() => _$TreatmentPlanToJson(this);
}
