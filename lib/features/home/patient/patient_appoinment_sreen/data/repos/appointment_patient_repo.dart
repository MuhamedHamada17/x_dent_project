import '../../../../../../core/helpers/shared_pref_helper.dart';
import '../../../../../../core/networking/api_error_handler.dart';
import '../../../../../../core/networking/api_result.dart';
import '../../../../../../core/networking/api_service.dart';
import '../models/upcoming_appointment_model.dart';
import '../models/cancelled_appointment_model.dart';
import '../models/completed_appointment_model.dart';

class AppointmentPatientRepo {
  final ApiService _apiService;

  AppointmentPatientRepo(this._apiService);

  Future<ApiResult<AppointmentResponse>> getUpcomingAppointments() async {
    try {
      final token = await SharedPrefHelper.getSecuredString('access_token');
      print('Upcoming Token: $token');
      if (token.isEmpty) {
        return ApiResult.failure(ErrorHandler.handle(Exception('No token found')));
      }
      final response = await _apiService.getUpcomingAppointments('Bearer $token');
      print('Upcoming API Response: ${response.toJson()}');
      return ApiResult.success(response);
    } catch (error) {
      print('Upcoming API Error: $error');
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<CancelledAppointmentResponse>> getCancelledAppointments() async {
    try {
      final token = await SharedPrefHelper.getSecuredString('access_token');
      print('Cancelled Token: $token');
      if (token.isEmpty) {
        return ApiResult.failure(ErrorHandler.handle(Exception('No token found')));
      }
      final response = await _apiService.getCancelledAppointments('Bearer $token');
      print('Cancelled API Response: ${response.toJson()}');
      return ApiResult.success(response);
    } catch (error) {
      print('Cancelled API Error: $error');
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<CompletedAppointmentResponse>> getConfirmedAppointments() async {
    try {
      final token = await SharedPrefHelper.getSecuredString('access_token');
      print('Confirmed Token: $token');
      if (token.isEmpty) {
        print('Confirmed Error: No token found');
        return ApiResult.failure(ErrorHandler.handle(Exception('No token found')));
      }
      final response = await _apiService.getConfirmedAppointments('Bearer $token');
      print('Confirmed API Response: ${response.toJson()}');
      if (response.completedAppointments.isEmpty) {
        print('Confirmed API Response: Empty completed_appointments list');
      }
      return ApiResult.success(response);
    } catch (error) {
      print('Confirmed API Error: $error');
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}