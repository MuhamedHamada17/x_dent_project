import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_dent_project/core/networking/api_error_model.dart';

import '../data/models/treatment_plan_model.dart';
part 'treatment_plan_patient_state.freezed.dart';

@freezed
class TreatmentPlanPatientState with _$TreatmentPlanPatientState {
  const factory TreatmentPlanPatientState.initial() = _Initial;
  const factory TreatmentPlanPatientState.loading() = _Loading;
  const factory TreatmentPlanPatientState.success(TreatmentPlanResponse data) = _Success;
  const factory TreatmentPlanPatientState.error({
    required ApiErrorModel error,
  }) = _Error;
}