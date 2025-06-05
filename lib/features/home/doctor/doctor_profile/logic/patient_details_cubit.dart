// patient_details_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:x_dent_project/core/networking/api_error_model.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/data/repos/patient_details_repo.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/logic/patient_details_state.dart';

class PatientDetailsCubit extends Cubit<PatientDetailsState> {
  final PatientDetailsRepository repository;

  PatientDetailsCubit(this.repository)
      : super(const PatientDetailsState.initial());

  Future<void> fetchPatientDetails({
    required String token,
    required int patientId,
  }) async {
    try {
      emit(const PatientDetailsState.loading());
      debugPrint(
          'PatientDetailsCubit: Fetching patient details for patientId: $patientId');

      final response = await repository.getPatientDetails(
        token: token,
        patientId: patientId,
      );

      emit(PatientDetailsState.success(response));
      debugPrint('PatientDetailsCubit: Patient details fetched successfully');
    } on ApiErrorModel catch (error) {
      emit(PatientDetailsState.error(error: error));
      debugPrint(
          'PatientDetailsCubit: Error fetching patient details: ${error.message}');
    } catch (error) {
      final apiError = ApiErrorModel(
        success: false,
        message: 'Unexpected error: $error',
        statusCode: 400,
      );
      emit(PatientDetailsState.error(error: apiError));
      debugPrint('PatientDetailsCubit: Unexpected error: $error');
    }
  }
}
