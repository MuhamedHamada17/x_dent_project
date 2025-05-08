import 'package:freezed_annotation/freezed_annotation.dart';

part 'treatment_plan_model.freezed.dart';
part 'treatment_plan_model.g.dart';

@freezed
class TreatmentPlanResponse with _$TreatmentPlanResponse {
  const factory TreatmentPlanResponse({
    required String status,
    @JsonKey(name: 'treatment_plans') required List<TreatmentPlan> treatmentPlans,
  }) = _TreatmentPlanResponse;

  factory TreatmentPlanResponse.fromJson(Map<String, dynamic> json) =>
      _$TreatmentPlanResponseFromJson(json);
}

@freezed
class TreatmentPlan with _$TreatmentPlan {
  const factory TreatmentPlan({
    required int id,
    required String name,
    required String status,
    required String date,
    required Doctor doctor,
  }) = _TreatmentPlan;

  factory TreatmentPlan.fromJson(Map<String, dynamic> json) =>
      _$TreatmentPlanFromJson(json);
}

@freezed
class Doctor with _$Doctor {
  const factory Doctor({
    required int id,
    required String name,
  }) = _Doctor;

  factory Doctor.fromJson(Map<String, dynamic> json) => _$DoctorFromJson(json);
}