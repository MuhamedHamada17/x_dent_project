import '../../../../../core/networking/api_error_handler.dart';
import '../../../../../core/networking/api_result.dart';
import '../../../../../core/networking/api_service.dart';
import '../models/sign_patient_request_body.dart';
import '../models/sign_patient_response_body.dart';

class SignPatientRepo {
  final ApiService _apiService;

  SignPatientRepo(this._apiService);

  Future<ApiResult<SignPatientResponseBody>> signPatient(
      SignPatientRequestBody signPatientRequestBody) async {
    try {
      final response = await _apiService.signUpPatient(signPatientRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      print('Sign-up failed: $error');
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}