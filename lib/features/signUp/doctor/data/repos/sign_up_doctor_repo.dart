import 'package:x_dent_project/features/signUp/doctor/data/models/Sign_up_request_doctor_model.dart';
import 'package:x_dent_project/features/signUp/doctor/data/models/Sign_up_response_doctor_model.dart';
import '../../../../../core/networking/api_error_handler.dart';
import '../../../../../core/networking/api_result.dart';
import '../../../../../core/networking/api_service.dart';
import 'package:dio/dio.dart';

class SignUpDoctorRepo {
  final ApiService _apiService;

  SignUpDoctorRepo(this._apiService);

  Future<ApiResult<SignUpResponseDoctorModel>> signDoctor(
    SignUpRequestDoctorModel SignUpRequestDoctorModel,
  ) async {
    try {
      final response = await _apiService.signUpDoctor(SignUpRequestDoctorModel);
      print('API Success Response: ${response.toJson()}');
      return ApiResult.success(response);
    } catch (error) {
      print('Sign-up failed: $error');
      if (error is DioException) {
        print('DioException: ${error.message}');
        print('Response Data: ${error.response?.data}');
        print('Status Code: ${error.response?.statusCode}');
        print('Request Data: ${error.requestOptions.data}');
      }
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
