import 'package:x_dent_project/core/networking/api_result.dart';
import 'package:x_dent_project/core/networking/api_error_handler.dart';
import 'package:x_dent_project/core/networking/api_service.dart';
import 'package:x_dent_project/features/home/patient/patient_profile_screen/data/models/edit_profile_patient_request_model.dart';
import 'package:x_dent_project/features/home/patient/patient_profile_screen/data/models/edit_profile_patient_response_model.dart';

class EditProfilePatientRepo {
  final ApiService _apiService;

  EditProfilePatientRepo(this._apiService);

  Future<ApiResult<EditProfilePatientResponse>> editProfile(
      String token,
      EditProfilePatientRequest request,
      ) async {
    try {
      final response = await _apiService.editProfilePatient(
        'Bearer $token',
        request,
      );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}