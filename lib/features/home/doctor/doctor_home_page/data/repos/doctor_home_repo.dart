import 'package:dio/dio.dart';
import 'package:x_dent_project/core/networking/api_constants.dart';
import 'package:x_dent_project/core/networking/api_error_model.dart';
import 'package:x_dent_project/core/networking/api_service.dart';
import 'package:x_dent_project/features/home/doctor/doctor_home_page/data/models/doctor_home_response_model.dart';

class DoctorHomeRepository {
  final ApiService _apiService;

  DoctorHomeRepository(this._apiService);

  Future<DoctorHomeResponseModel> getDoctorHomeData(String token) async {
    try {
      // إضافة كلمة Bearer للتوكن
      final bearerToken = 'Bearer $token';
      final response = await _apiService.getDoctorHome(bearerToken);
      return response;
    } on DioException catch (e) {
      throw ApiErrorModel(
        message:
            e.response?.data['message'] ?? 'An unexpected error occurred: $e',
        statusCode: e.response?.statusCode ?? 400,
      );
    }
  }
}
