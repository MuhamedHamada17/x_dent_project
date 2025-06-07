import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:x_dent_project/core/helpers/shared_pref_helper.dart';
import 'package:x_dent_project/core/networking/api_error_model.dart';
import 'package:x_dent_project/core/networking/api_service.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/data/models/doctor_patient_treatment_plan_model.dart';

abstract class DoctorPatientTreatmentPlanRepository {
  Future<DoctorPatientTreatmentPlanModel> getTreatmentPlans({
    required int patientId,
  });
}

class DoctorPatientTreatmentPlanRepositoryImpl
    implements DoctorPatientTreatmentPlanRepository {
  final ApiService apiService;

  DoctorPatientTreatmentPlanRepositoryImpl(this.apiService);

  @override
  Future<DoctorPatientTreatmentPlanModel> getTreatmentPlans({
    required int patientId,
  }) async {
    try {
      final token = await SharedPrefHelper.getToken();
      if (token.isEmpty) {
        debugPrint('Error: Token is empty');
        throw ApiErrorModel(
          success: false,
          message: 'Token is empty',
          statusCode: 400,
        );
      }
      debugPrint(
          'Fetching treatment plans for patientId: $patientId with token: $token');
      final bearerToken = 'Bearer $token';
      final response = await apiService.getDoctorPatientTreatmentPlans(
          bearerToken, patientId);
      debugPrint('Treatment plans fetched successfully');
      return response;
    } on DioException catch (e) {
      debugPrint(
          'DioException: ${e.message}, StatusCode: ${e.response?.statusCode}, Response: ${e.response?.data}');
      throw ApiErrorModel(
        success: false,
        message:
            e.response?.data['message'] ?? 'An unexpected error occurred: $e',
        statusCode: e.response?.statusCode ?? 400,
      );
    } catch (e) {
      debugPrint('Unexpected error: $e');
      throw ApiErrorModel(
        success: false,
        message: 'Unexpected error occurred: $e',
        statusCode: 400,
      );
    }
  }
}
