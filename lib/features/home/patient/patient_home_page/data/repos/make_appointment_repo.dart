import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:x_dent_project/core/networking/api_error_handler.dart';
import 'package:x_dent_project/core/networking/api_result.dart';
import 'package:x_dent_project/core/networking/api_service.dart';
import 'package:x_dent_project/features/home/patient/patient_home_page/data/models/make_appointment_request_model.dart';
import 'package:x_dent_project/features/home/patient/patient_home_page/data/models/make_appointment_response_model.dart';
import 'package:x_dent_project/core/helpers/shared_pref_helper.dart';

class MakeAppointmentRepo {
  final ApiService _apiService;

  MakeAppointmentRepo(this._apiService);

  Future<ApiResult<MakeAppointmentResponse>> makeAppointment({
    required String token,
    required int doctorId,
    required MakeAppointmentRequest request,
  }) async {
    try {
      if (doctorId <= 0) {
        debugPrint('MakeAppointmentRepo: معرف الدكتور غير صالح: $doctorId');
        return ApiResult.failure(
          ErrorHandler.handle(Exception('معرف الدكتور غير صالح')),
        );
      }

      debugPrint(
          'MakeAppointmentRepo: جاري حجز موعد للدكتور: $doctorId, اليوم: ${request.day}, الوقت: ${request.time}, توكن: $token');

      final response = await _apiService.makeAppointment(
        token,
        doctorId,
        request,
      );

      debugPrint('MakeAppointmentRepo: استجابة API: ${response.toJson()}');
      return ApiResult.success(response);
    } catch (error) {
      debugPrint('MakeAppointmentRepo: خطأ: $error');
      if (error is DioException && error.response != null) {
        final statusCode = error.response!.statusCode;
        if (statusCode == ResponseCode.UNAUTHORIZED) {
          await SharedPrefHelper.clearAllSecuredData();
          debugPrint('MakeAppointmentRepo: تم مسح التوكن غير الصالح');
          return ApiResult.failure(
            ErrorHandler.handle(Exception('غير مصرح: التوكن غير صالح، يرجى تسجيل الدخول مرة أخرى')),
          );
        }
        if (statusCode == ResponseCode.BAD_REQUEST) {
          final responseData = error.response!.data;
          final message = responseData['message'] ?? 'بيانات الموعد غير صالحة';
          return ApiResult.failure(
            ErrorHandler.handle(Exception(message)),
          );
        }
      }
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}