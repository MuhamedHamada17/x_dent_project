import 'package:flutter/material.dart';
import 'package:x_dent_project/core/networking/api_error_model.dart';
import 'package:x_dent_project/core/networking/api_service.dart';
import 'package:x_dent_project/core/helpers/shared_pref_helper.dart';
import 'package:x_dent_project/core/networking/api_error_handler.dart';
import '../models/get_all_doctors_model.dart';

class GetAllDoctorsRepo {
  final ApiService _apiService;

  GetAllDoctorsRepo(this._apiService);

  Future<(GetAllDoctorsResponse?, ApiErrorModel?)> getAllDoctors() async {
    try {
      final token = await SharedPrefHelper.getSecuredString('access_token');
      debugPrint('GetAllDoctorsRepo: Retrieved token: $token');

      if (token.isEmpty) {
        debugPrint('GetAllDoctorsRepo: No token found in FlutterSecureStorage');
        return (null, ApiErrorModel(message: 'No token found', statusCode: ResponseCode.UNAUTHORIZED));
      }

      final response = await _apiService.getAllDoctors('Bearer $token');
      debugPrint('GetAllDoctorsRepo: API response received: ${response.toJson()}');

      // Save each doctor's name using SharedPrefHelper
      for (var allDoctor in response.data) {
        await SharedPrefHelper.saveDoctorName(allDoctor.id, allDoctor.name);
        debugPrint('GetAllDoctorsRepo: Saved name for doctor ID ${allDoctor.id}: ${allDoctor.name}');
      }

      return (response, null);
    } catch (e) {
      debugPrint('GetAllDoctorsRepo: Error fetching doctors: $e');
      return (null, ApiErrorModel(message: e.toString(), statusCode: ResponseCode.DEFAULT));
    }
  }
}