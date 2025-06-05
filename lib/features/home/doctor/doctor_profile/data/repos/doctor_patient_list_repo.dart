// doctor_patient_list_repo.dart
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:x_dent_project/core/networking/api_error_model.dart';
import 'package:x_dent_project/core/networking/api_service.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/data/models/doctor_patient_list_model.dart';

abstract class DoctorPatientListRepository {
  Future<DoctorPatientListModel> getDoctorPatientList({
    required String token,
  });
}

class DoctorPatientListRepositoryImpl implements DoctorPatientListRepository {
  final ApiService apiService;

  DoctorPatientListRepositoryImpl(this.apiService);

  @override
  Future<DoctorPatientListModel> getDoctorPatientList({
    required String token,
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
      debugPrint('Fetching patient list with token: $token');
      final bearerToken = 'Bearer $token';
      final response = await apiService.getPatientList(bearerToken);
      debugPrint('Patient list fetched successfully');
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
