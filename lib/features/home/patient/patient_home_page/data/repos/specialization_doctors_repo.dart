import 'package:x_dent_project/core/networking/api_error_handler.dart';
import 'package:x_dent_project/core/networking/api_result.dart';
import 'package:x_dent_project/core/networking/api_service.dart';
import 'package:x_dent_project/features/home/patient/patient_home_page/data/models/specialization_doctors_model.dart';
import '../../../../../../core/helpers/shared_pref_helper.dart';

class SpecializationDoctorsRepo {
  final ApiService _apiService;

  SpecializationDoctorsRepo(this._apiService);

  Future<ApiResult<SpecializationDoctorsResponse>> filterDoctorsBySpecialization({
    required String specialization,
  }) async {
    try {
      final token = await SharedPrefHelper.getSecuredString('access_token');
      print('Token: $token');
      print('Specialization sent: $specialization');
      if (token.isEmpty) {
        print('No token found');
        return ApiResult.failure(ErrorHandler.handle(Exception('No token found')));
      }
      final response = await _apiService.filterDoctors(
        'Bearer $token',
        specialization, // إرسال التخصص كـ string بدل array
      );
      print('Full API Response: ${response.toJson()}');
      return ApiResult.success(response);
    } catch (error) {
      print('Error in Repo: $error');
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}