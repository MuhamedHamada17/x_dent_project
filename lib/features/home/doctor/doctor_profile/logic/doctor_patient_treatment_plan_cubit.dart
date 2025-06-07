import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_dent_project/core/networking/api_error_model.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/data/repos/doctor_patient_treatment_plan_repository.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/logic/doctor_patient_treatment_plan_state.dart';

class DoctorPatientTreatmentPlanCubit
    extends Cubit<DoctorPatientTreatmentPlanState> {
  final DoctorPatientTreatmentPlanRepository _repository;
  int? _patientId;

  DoctorPatientTreatmentPlanCubit(this._repository)
      : super(const DoctorPatientTreatmentPlanState.initial());

  Future<void> fetchTreatmentPlans(int patientId) async {
    _patientId = patientId;
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

  Future<void> deleteTreatmentPlan(int planId) async {
    emit(const DoctorPatientTreatmentPlanState.loading());
    try {
      await _repository.deleteTreatmentPlan(planId: planId);
      if (_patientId != null) {
        final treatmentPlans =
            await _repository.getTreatmentPlans(patientId: _patientId!);
        emit(DoctorPatientTreatmentPlanState.success(treatmentPlans));
      } else {
        emit(DoctorPatientTreatmentPlanState.error(
          ApiErrorModel(
            success: false,
            message: 'Patient ID is not set',
            statusCode: 400,
          ),
        ));
      }
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

  Future<void> updateTreatmentPlan({
    required int planId,
    required String name,
    required String date,
  }) async {
    emit(const DoctorPatientTreatmentPlanState.loading());
    try {
      if (_patientId == null) {
        throw ApiErrorModel(
          success: false,
          message: 'Patient ID is not set',
          statusCode: 400,
        );
      }
      final treatmentPlans = await _repository.updateTreatmentPlan(
        planId: planId,
        name: name,
        date: date,
        patientId: _patientId!,
      );
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

  Future<void> createTreatmentPlan({
    required String name,
    required String date,
    String? appointmentTime,
    required int patientId,
  }) async {
    emit(const DoctorPatientTreatmentPlanState.loading());
    try {
      _patientId = patientId;
      final treatmentPlans = await _repository.createTreatmentPlan(
        name: name,
        date: date,
        appointmentTime: appointmentTime,
        patientId: patientId,
      );
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
