import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:x_dent_project/core/networking/api_error_handler.dart';
import 'package:x_dent_project/core/networking/api_result.dart';
import 'package:x_dent_project/core/networking/api_service.dart';
import 'package:x_dent_project/features/home/patient/patient_home_page/data/models/time_slots_model.dart';
import '../../../../../../core/helpers/shared_pref_helper.dart';

class TimeSlotsRepo {
  final ApiService _apiService;

  TimeSlotsRepo(this._apiService);

  Future<ApiResult<TimeSlotsResponse>> getAvailableSlots({
    required int doctorId,
    required String date,
  }) async {
    try {
      if (doctorId <= 0) {
        debugPrint('TimeSlotsRepo: Invalid doctorId: $doctorId');
        return ApiResult.failure(ErrorHandler.handle(Exception('Invalid doctor ID')));
      }
      if (date.isEmpty || !RegExp(r'^\d{4}-\d{2}-\d{2}$').hasMatch(date)) {
        debugPrint('TimeSlotsRepo: Invalid date format: $date');
        return ApiResult.failure(ErrorHandler.handle(Exception('Invalid date format')));
      }

      final token = await SharedPrefHelper.getSecuredString('access_token');
      debugPrint('TimeSlotsRepo: Token: $token');
      debugPrint('TimeSlotsRepo: Fetching available slots for doctorId: $doctorId, date: $date');

      if (token.isEmpty) {
        debugPrint('TimeSlotsRepo: No token found');
        return ApiResult.failure(ErrorHandler.handle(Exception('No token found')));
      }

      final response = await _apiService.getAvailableSlots(
        'Bearer $token',
        doctorId,
        date,
      );
      debugPrint('TimeSlotsRepo: Available Slots API Response: ${response.toJson()}');
      return ApiResult.success(response);
    } catch (error) {
      debugPrint('TimeSlotsRepo: Error: $error');
      if (error is DioException && error.response != null) {
        final statusCode = error.response!.statusCode;
        final responseData = error.response!.data;

        if (statusCode == 404 && responseData is Map<String, dynamic>) {
          final message = responseData['message'] ?? 'No available slots found';
          debugPrint('TimeSlotsRepo: 404 Error - $message for doctorId: $doctorId, date: $date');
          // Mock data مؤقتة للاختبار
          debugPrint('TimeSlotsRepo: Mocking slots for testing');
          return ApiResult.success(TimeSlotsResponse(
            status: 'success',
            slots: ['09:00 AM', '10:00 AM', '11:00 AM'],
          ));
        }
        if (statusCode == 401) {
          await SharedPrefHelper.clearAllSecuredData();
          debugPrint('TimeSlotsRepo: Cleared invalid token');
          return ApiResult.failure(ErrorHandler.handle(Exception('Unauthorized: Invalid token')));
        }
      }
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}