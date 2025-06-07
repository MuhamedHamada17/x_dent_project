import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_dent_project/core/networking/api_error_model.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/data/models/doctor_patient_treatment_plan_model.dart';

part 'doctor_patient_treatment_plan_state.freezed.dart';

@freezed
class DoctorPatientTreatmentPlanState with _$DoctorPatientTreatmentPlanState {
  const factory DoctorPatientTreatmentPlanState.initial() = _Initial;
  const factory DoctorPatientTreatmentPlanState.loading() = _Loading;
  const factory DoctorPatientTreatmentPlanState.success(
      DoctorPatientTreatmentPlanModel treatmentPlans) = _Success;
  const factory DoctorPatientTreatmentPlanState.error(ApiErrorModel error) =
      _Error;
}
