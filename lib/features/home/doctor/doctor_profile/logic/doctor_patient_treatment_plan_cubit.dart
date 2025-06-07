import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_dent_project/core/networking/api_error_model.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/data/repos/doctor_patient_treatment_plan_repository.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/logic/doctor_patient_treatment_plan_state.dart';

class DoctorPatientTreatmentPlanCubit
    extends Cubit<DoctorPatientTreatmentPlanState> {
  final DoctorPatientTreatmentPlanRepository _repository;

  DoctorPatientTreatmentPlanCubit(this._repository)
      : super(const DoctorPatientTreatmentPlanState.initial());

  Future<void> fetchTreatmentPlans(int patientId) async {
    emit(const DoctorPatientTreatmentPlanState.loading());
    try {
      final treatmentPlans =
          await _repository.getTreatmentPlans(patientId: patientId);
      emit(DoctorPatientTreatmentPlanState.success(treatmentPlans));
    } catch (e) {
      if (e is ApiErrorModel) {
        emit(DoctorPatientTreatmentPlanState.error(e));
      } else {
        emit(DoctorPatientTreatmentPlanState.error(
          ApiErrorModel(
            success: false,
            message: 'Unexpected error: $e',
            statusCode: 400,
          ),
        ));
      }
    }
  }
}
