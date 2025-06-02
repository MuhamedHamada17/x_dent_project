import 'package:flutter/cupertino.dart';
import 'package:x_dent_project/core/helpers/shared_pref_helper.dart';
import 'package:x_dent_project/core/networking/api_error_handler.dart';
import 'package:x_dent_project/core/networking/api_result.dart';
import 'package:x_dent_project/core/networking/api_service.dart';
import '../models/treatment_plan_model.dart';

class TreatmentPlanPatientRepo {
  final ApiService _apiService;

  TreatmentPlanPatientRepo(this._apiService);

  Future<ApiResult<TreatmentPlanResponse>> getTreatmentPlans() async {
    try {
      // جلب الـ access_token من SharedPrefHelper
      debugPrint('Treatment Plans Fetch Attempt: Getting token');
      final token = await SharedPrefHelper.getSecuredString('access_token');
      debugPrint('Treatment Plans Token: $token');
      if (token.isEmpty) {
        debugPrint('Treatment Plans failed: No token found');
        return ApiResult.failure(
          ErrorHandler.handle(Exception('No token found')),
        );
      }

      // استدعاء الـ API
      debugPrint('Treatment Plans: Calling API with Bearer $token');
      final response = await _apiService.getTreatmentPlans('Bearer $token');
      debugPrint('Treatment Plans API Response: $response');
      return ApiResult.success(response);
    } catch (error) {
      debugPrint('Treatment Plans failed: $error');
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}