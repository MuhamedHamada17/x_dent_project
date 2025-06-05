import 'package:dio/dio.dart';
import '../../../../../../core/networking/api_error_handler.dart';
import '../../../../../../core/networking/api_service.dart';
import '../models/show_patient_xray_model.dart';

abstract class ShowPatientXrayRepo {
  Future<ShowPatientXrayResponse> getXray(String token, int patientId);
}

class ShowPatientXrayRepoImpl implements ShowPatientXrayRepo {
  final ApiService apiService;

  ShowPatientXrayRepoImpl(this.apiService);

  @override
  Future<ShowPatientXrayResponse> getXray(String token, int patientId) async {
    print(
        'ShowPatientXrayRepo: Attempting to fetch X-rays for patient ID: $patientId and token: $token');
    try {
      if (token.isEmpty || token == 'Bearer ') {
        throw Exception('التوكن غير موجود');
      }
      final response = await apiService.showPatientXray(token, patientId);
      print(
          'ShowPatientXrayRepo: Successfully fetched X-ray list with status: ${response.status}');

      // فحص إضافي للاستجابة
      if (response.status == null) {
        throw Exception('حالة الاستجابة غير موجودة');
      }
      if (response.data.isEmpty) {
        print('ShowPatientXrayRepo: Warning: X-ray list is empty');
      } else {
        for (var xray in response.data) {
          if (xray.image_url == null || xray.uploaded_at == null) {
            print(
                'ShowPatientXrayRepo: Warning: X-ray with ID ${xray.id} has null image_url or uploaded_at');
          }
        }
      }

      return response;
    } on DioException catch (e) {
      if (e.response?.statusCode == ResponseCode.UNAUTHORIZED) {
        print('ShowPatientXrayRepo: Unauthorized error (401)');
        throw Exception('انتهت صلاحية الجلسة، يرجى تسجيل الدخول مرة أخرى');
      }
      final error = ErrorHandler.handle(e).apiErrorModel;
      print('ShowPatientXrayRepo: DioException: ${error.message}');
      throw Exception(error.message);
    } catch (e) {
      print('ShowPatientXrayRepo: Unexpected error: $e');
      throw Exception('حدث خطأ غير متوقع: $e');
    }
  }
}
