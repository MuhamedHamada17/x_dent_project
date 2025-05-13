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
        specialization,
      );
      print('Full API Response: ${response.toJson()}');
      // Check if any doctor has invalid ID
      for (var doctor in response.data) {
        if (doctor.id == 0 || doctor.id == null) {
          print('Warning: Doctor with invalid ID found: ${doctor.toJson()}');
        }
      }
      return ApiResult.success(response);
    } catch (error) {
      print('Error in Repo: $error');
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}