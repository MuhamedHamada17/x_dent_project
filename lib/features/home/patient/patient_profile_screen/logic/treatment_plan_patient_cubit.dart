import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:x_dent_project/core/networking/api_error_model.dart';
import '../data/repos/treatment_plan_patient_repo.dart';
import 'treatment_plan_patient_state.dart';

class TreatmentPlanPatientCubit extends Cubit<TreatmentPlanPatientState> {
  final TreatmentPlanPatientRepo _repo;

  TreatmentPlanPatientCubit(this._repo) : super(const TreatmentPlanPatientState.initial());

  Future<void> fetchTreatmentPlans() async {
    debugPrint('TreatmentPlanPatientCubit: Starting fetchTreatmentPlans');
    emit(const TreatmentPlanPatientState.loading());

    final response = await _repo.getTreatmentPlans();

    response.when(
      success: (treatmentPlanResponse) {
        debugPrint('TreatmentPlanPatientCubit Success: ${treatmentPlanResponse.treatmentPlans}');
        emit(TreatmentPlanPatientState.success(treatmentPlanResponse));
      },
      failure: (error) {
        debugPrint('TreatmentPlanPatientCubit Error: ${error.apiErrorModel.message}');
        emit(TreatmentPlanPatientState.error(error: error.apiErrorModel));
      },
    );
  }
}