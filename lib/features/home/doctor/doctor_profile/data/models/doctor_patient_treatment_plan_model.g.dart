// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_patient_treatment_plan_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorPatientTreatmentPlanModel _$DoctorPatientTreatmentPlanModelFromJson(
        Map<String, dynamic> json) =>
    DoctorPatientTreatmentPlanModel(
      status: json['status'] as String,
      treatmentPlans: (json['treatment_plans'] as List<dynamic>)
          .map((e) => TreatmentPlan.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DoctorPatientTreatmentPlanModelToJson(
        DoctorPatientTreatmentPlanModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'treatment_plans': instance.treatmentPlans,
    };

TreatmentPlan _$TreatmentPlanFromJson(Map<String, dynamic> json) =>
    TreatmentPlan(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      status: (json['status'] as num).toInt(),
      date: json['date'] as String,
    );

Map<String, dynamic> _$TreatmentPlanToJson(TreatmentPlan instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'date': instance.date,
    };
