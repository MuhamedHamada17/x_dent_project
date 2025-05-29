import 'package:x_dent_project/core/networking/api_error_handler.dart';
import 'package:x_dent_project/core/networking/api_result.dart';
import 'package:x_dent_project/core/networking/api_service.dart';
import 'package:x_dent_project/features/home/patient/patient_home_page/data/models/specialization_doctors_model.dart';
import '../../../../../../core/helpers/shared_pref_helper.dart';

class SpecializationDoctorsRepo {
  final ApiService _apiService;

  SpecializationDoctorsRepo(this._apiService);

  String _mapSpecialization(String specialization) {
    final specializationMap = {
      'Cavities': 'cavity',
      'Dental Hygiene': 'dental_hygiene',
      'Orthopedics': 'orthopedics',
      'Implants': 'implants',
      'Dentures': 'dentures',
      'Surgery': 'surgery',
      'Periodontology': 'periodontology',
      'Veneers': 'veneers',
      'Cosmetics': 'cosmetics',
      'Extraction': 'extraction',
      'Radiology': 'radiology',
    };
    return specializationMap[specialization] ?? specialization.toLowerCase();
  }

  Future<ApiResult<SpecializationDoctorsResponse>> filterDoctorsBySpecialization({
    required String specialization,
    int? reviewRating,
    int? minPrice,
    int? maxPrice,
  }) async {
    try {
      final token = await SharedPrefHelper.getSecuredString('access_token');
      if (token.isEmpty) {
        print('No token found in SharedPreferences');
        return ApiResult.failure(ErrorHandler.handle(Exception('No token found')));
      }

      final cleanedSpecialization = _mapSpecialization(specialization.trim());
      if (cleanedSpecialization.isEmpty) {
        print('Error: Specialization is empty');
        return ApiResult.failure(ErrorHandler.handle(Exception('Specialization cannot be empty')));
      }

      final adjustedMinPrice = minPrice != null && minPrice > 0 ? minPrice : null;
      final adjustedMaxPrice = maxPrice != null && maxPrice > 0 ? maxPrice : null;
      final adjustedReviewRating = reviewRating != null && reviewRating > 0 ? reviewRating : null;

      print('Sending API request with: '
          'specialization=$cleanedSpecialization, '
          'reviewRating=$adjustedReviewRating, '
          'minPrice=$adjustedMinPrice, '
          'maxPrice=$adjustedMaxPrice, '
          'token=Bearer $token');

      final response = await _apiService.filterDoctors(
        'Bearer $token',
        cleanedSpecialization,
        adjustedReviewRating,
        adjustedMinPrice,
        adjustedMaxPrice,
      );

      print('Filter response received: ${response.toJson()}');

      if (response.data.isEmpty) {
        print('No doctors found for specialization: $cleanedSpecialization with provided filters');
        return ApiResult.success(response);
      }

      print('Found ${response.data.length} doctors');
      return ApiResult.success(response);
    } catch (error) {
      print('Error in filterDoctorsBySpecialization: $error');
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}