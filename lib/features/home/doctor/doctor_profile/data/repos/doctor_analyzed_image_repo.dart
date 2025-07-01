import 'package:dio/dio.dart';
import '../../../../../../core/networking/api_error_handler.dart';
import '../../../../../../core/networking/api_service.dart';
import '../models/doctor_analyzed_image_model.dart';
import 'package:x_dent_project/core/networking/api_constants.dart';

abstract class DoctorAnalyzedImageRepo {
  Future<DoctorAnalyzedImageResponse> getAnalyzedImage(
      String token, int patientId);
}

class DoctorAnalyzedImageRepoImpl implements DoctorAnalyzedImageRepo {
  final ApiService apiService;

  DoctorAnalyzedImageRepoImpl(this.apiService);

  @override
  Future<DoctorAnalyzedImageResponse> getAnalyzedImage(
      String token, int patientId) async {
    print(
        'DoctorAnalyzedImageRepo: Attempting to fetch analyzed images for patient ID: $patientId and token: $token');
    try {
      if (token.isEmpty || token == 'Bearer ') {
        throw Exception('التوكن غير موجود');
      }
      // التأكد من إضافة "Bearer " إلى التوكن
      final formattedToken =
          token.startsWith('Bearer ') ? token : 'Bearer $token';
      print(
          'DoctorAnalyzedImageRepo: Sending request to ${ApiConstants.patientXray.replaceFirst('{id}', patientId.toString())} with token: $formattedToken');
      final response =
          await apiService.getDoctorAnalyzedImage(formattedToken, patientId);
      print(
          'DoctorAnalyzedImageRepo: Successfully fetched analyzed image list with status: ${response.status}');

      if (response.data.isEmpty) {
        print('DoctorAnalyzedImageRepo: Warning: Analyzed image list is empty');
      } else {
        for (var image in response.data) {
          if (image.image_url == null) {
            print(
                'DoctorAnalyzedImageRepo: Warning: Analyzed image with ID ${image.id} has null image_url');
          }
        }
      }

      return response;
    } on DioException catch (e) {
      if (e.response?.statusCode == ResponseCode.UNAUTHORIZED) {
        print('DoctorAnalyzedImageRepo: Unauthorized error (401)');
        throw Exception('انتهت صلاحية الجلسة، يرجى تسجيل الدخول مرة أخرى');
      }
      final error = ErrorHandler.handle(e).apiErrorModel;
      print('DoctorAnalyzedImageRepo: DioException: ${error.message}');
      throw Exception(error.message);
    } catch (e) {
      print('DoctorAnalyzedImageRepo: Unexpected error: $e');
      throw Exception('حدث خطأ غير متوقع: $e');
    }
  }
}
