import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:x_dent_project/core/helpers/shared_pref_helper.dart';
import 'package:x_dent_project/core/networking/api_error_model.dart';
import 'package:x_dent_project/core/networking/api_service.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/data/models/doctor_patient_treatment_plan_model.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/data/models/edit_treatment_request.dart';

abstract class DoctorPatientTreatmentPlanRepository {
  Future<DoctorPatientTreatmentPlanModel> getTreatmentPlans({
    required int patientId,
  });

  Future<void> deleteTreatmentPlan({
    required int planId,
  });

  Future<DoctorPatientTreatmentPlanModel> updateTreatmentPlan({
    required int planId,
    required String name,
    required String date,
    required int patientId, // Add patientId parameter
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

  @override
  Future<void> deleteTreatmentPlan({
    required int planId,
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
      debugPrint('Deleting treatment plan with ID: $planId');
      final bearerToken = 'Bearer $token';
      await apiService.deleteTreatmentPlan(bearerToken, planId);
      debugPrint('Treatment plan deleted successfully');
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

  @override
  Future<DoctorPatientTreatmentPlanModel> updateTreatmentPlan({
    required int planId,
    required String name,
    required String date,
    required int patientId, // Add patientId parameter
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
          'Updating treatment plan with ID: $planId for patientId: $patientId');
      final bearerToken = 'Bearer $token';
      final request = EditTreatmentRequest(name: name, date: date);
      await apiService.updateTreatmentPlan(bearerToken, planId, request);
      debugPrint('Treatment plan updated successfully');
      // Fetch and return the updated treatment plan using patientId
      final updatedPlan = await apiService.getDoctorPatientTreatmentPlans(
          bearerToken, patientId);
      return updatedPlan;
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
