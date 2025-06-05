import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:x_dent_project/core/networking/api_error_model.dart';
import 'package:x_dent_project/core/networking/api_service.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/data/models/patient_details_response_model.dart';

abstract class PatientDetailsRepository {
  Future<PatientDetailsResponse> getPatientDetails({
    required String token,
    required int patientId,
  });
}

class PatientDetailsRepositoryImpl implements PatientDetailsRepository {
  final ApiService apiService;

  PatientDetailsRepositoryImpl(this.apiService);

  @override
  Future<PatientDetailsResponse> getPatientDetails({
    required String token,
    required int patientId,
  }) async {
    try {
      if (token.isEmpty) {
        debugPrint('Error: Token is empty');
        throw ApiErrorModel(
          success: false,
          message: 'Token is empty',
          statusCode: 400,
        );
      }
      debugPrint(
          'Fetching patient details with token: $token, patientId: $patientId');
      final bearerToken = 'Bearer $token';
      final response =
          await apiService.getPatientDetails(bearerToken, patientId);
      debugPrint('Patient details fetched successfully');
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
