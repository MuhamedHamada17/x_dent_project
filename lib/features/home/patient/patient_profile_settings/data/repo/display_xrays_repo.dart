import 'package:dio/dio.dart';
import '../../../../../../core/networking/api_error_handler.dart';
import '../../../../../../core/networking/api_service.dart';
import '../models/display_xrays_model.dart';

abstract class DisplayXraysRepo {
  Future<DisplayXraysResponse> getXrays(String token);
}

class DisplayXraysRepoImpl implements DisplayXraysRepo {
  final ApiService apiService;

  DisplayXraysRepoImpl(this.apiService);

  @override
  Future<DisplayXraysResponse> getXrays(String token) async {
    print('DisplayXraysRepo: Attempting to fetch X-rays with token: $token');
    try {
      if (token.isEmpty || token == 'Bearer ') {
        throw Exception('التوكن غير موجود');
      }
      final response = await apiService.displayXrays(token);
      print('DisplayXraysRepo: Successfully fetched X-rays: ${response.xrays.length} items');

      // فحص إضافي للاستجابة
      if (response.status == null) {
        throw Exception('حالة الاستجابة غير موجودة');
      }
      for (var xray in response.xrays) {
        if (xray.imageUrl == null || xray.uploadedAt == null) {
          print('DisplayXraysRepo: Warning: X-ray with ID ${xray.id} has null imageUrl or uploadedAt');
        }
      }

      return response;
    } on DioException catch (e) {
      if (e.response?.statusCode == ResponseCode.UNAUTHORIZED) {
        print('DisplayXraysRepo: Unauthorized error (401)');
        throw Exception('انتهت صلاحية الجلسة، يرجى تسجيل الدخول مرة أخرى');
      }
      final error = ErrorHandler.handle(e).apiErrorModel;
      print('DisplayXraysRepo: DioException: ${error.message}');
      throw Exception(error.message);
    } catch (e) {
      print('DisplayXraysRepo: Unexpected error: $e');
      throw Exception('حدث خطأ غير متوقع: $e');
    }
  }
}