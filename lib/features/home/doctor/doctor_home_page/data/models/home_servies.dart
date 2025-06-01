import 'package:dio/dio.dart';
import 'package:x_dent_project/core/networking/api_constants.dart';
import 'package:x_dent_project/features/home/doctor/doctor_home_page/data/models/doctor_home_model.dart';

class HomeService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.apiBaseUrl,
      headers: {
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbGFyYXZlbHByb2plY3QtcHJvZHVjdGlvbi1kMjc5LnVwLnJhaWx3YXkuYXBwL2FwaS9hdXRoL2xvZ2luIiwiaWF0IjoxNzQ4NjE0MTMzLCJleHAiOjE3NDg2Mjg1MzMsIm5iZiI6MTc0ODYxNDEzMywianRpIjoiSDY2MWpiSmJ6UDVrQ2VBayIsInN1YiI6IjkiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.5TTihKP3ESEPg71ffM4wBPm4j0l4B_IzXLvHNSgHCl4',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );

  Future<HomeModel> getDoctorHome() async {
    try {
      print(
        '🔥 Making request to: ${ApiConstants.apiBaseUrl}${ApiConstants.doctorHome}',
      );

      final response = await _dio.get(ApiConstants.doctorHome);

      print('📡 Response status: ${response.statusCode}');
      print('📦 Response data: ${response.data}');

      if (response.statusCode == 200) {
        return HomeModel.fromJson(response.data);
      } else {
        throw Exception(
          'Failed to load home data. Status: ${response.statusCode}',
        );
      }
    } on DioException catch (dioError) {
      if (dioError.response != null) {
        print('❌ Dio Error - Status: ${dioError.response?.statusCode}');
        print('❌ Dio Error - Data: ${dioError.response?.data}');
        throw Exception(
          'API Error: ${dioError.response?.statusCode} - ${dioError.response?.data}',
        );
      } else {
        print('❌ Dio Error - Message: ${dioError.message}');
        throw Exception('Network Error: ${dioError.message}');
      }
    } catch (e) {
      print('❌ General Error: $e');
      throw Exception('Error fetching doctor home data: $e');
    }
  }
}
