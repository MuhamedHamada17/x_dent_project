// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'treatment_plan_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TreatmentPlanResponseImpl _$$TreatmentPlanResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$TreatmentPlanResponseImpl(
      status: json['status'] as String,
      treatmentPlans: (json['treatment_plans'] as List<dynamic>)
          .map((e) => TreatmentPlan.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TreatmentPlanResponseImplToJson(
        _$TreatmentPlanResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'treatment_plans': instance.treatmentPlans,
    };

_$TreatmentPlanImpl _$$TreatmentPlanImplFromJson(Map<String, dynamic> json) =>
    _$TreatmentPlanImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      status: json['status'] as String,
      date: json['date'] as String,
      doctor: Doctor.fromJson(json['doctor'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TreatmentPlanImplToJson(_$TreatmentPlanImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'date': instance.date,
      'doctor': instance.doctor,
    };

_$DoctorImpl _$$DoctorImplFromJson(Map<String, dynamic> json) => _$DoctorImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$$DoctorImplToJson(_$DoctorImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
