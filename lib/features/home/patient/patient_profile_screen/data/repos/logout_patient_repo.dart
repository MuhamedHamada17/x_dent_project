import 'package:x_dent_project/core/networking/api_error_handler.dart';
import 'package:x_dent_project/core/networking/api_result.dart';
import 'package:x_dent_project/core/networking/api_service.dart';
import 'package:x_dent_project/features/home/patient/patient_profile_screen/data/models/logout_patient_request_model.dart';
import 'package:x_dent_project/features/home/patient/patient_profile_screen/data/models/logout_patient_response_model.dart';

class LogoutPatientRepo {
  final ApiService _apiService;

  LogoutPatientRepo(this._apiService);

  Future<ApiResult<LogoutPatientResponse>> logout(
      String token, LogoutPatientRequest logoutRequest) async {
    try {
      final response = await _apiService.logout(
        'Bearer $token', // إضافة Bearer للتوكن
        logoutRequest,
      );
      return ApiResult.success(response);
    } catch (error) {
      print('Logout failed: $error');
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}