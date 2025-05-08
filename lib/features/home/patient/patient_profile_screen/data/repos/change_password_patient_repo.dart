import 'package:x_dent_project/core/networking/api_error_handler.dart';
import 'package:x_dent_project/core/networking/api_result.dart';
import 'package:x_dent_project/core/networking/api_service.dart';
import 'package:x_dent_project/core/helpers/shared_pref_helper.dart';
import 'package:x_dent_project/features/home/patient/patient_profile_screen/data/models/change_paasword_patient_request.dart';
import 'package:x_dent_project/features/home/patient/patient_profile_screen/data/models/change_password_patient_response.dart';

class ChangePasswordPatientRepo {
  final ApiService _apiService;

  ChangePasswordPatientRepo(this._apiService);

  Future<ApiResult<ChangePasswordPatientResponse>> changePassword(
      ChangePasswordPatientRequest requestBody) async {
    try {
      // Retrieve token from SharedPreferences
      final token = await SharedPrefHelper.getSecuredString('access_token');
      if (token == null) {
        return ApiResult.failure(
          ErrorHandler.handle(
            Exception('No token found'),
          ),
        );
      }

      final response = await _apiService.changePassword(
        'Bearer $token',
        requestBody,
      );
      return ApiResult.success(response);
    } catch (error) {
      print('Change password failed: $error');
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}