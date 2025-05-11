import 'package:flutter/material.dart';
import 'package:x_dent_project/core/networking/api_result.dart';
import 'package:x_dent_project/core/networking/api_service.dart';
import 'package:x_dent_project/core/networking/api_error_handler.dart';
import 'package:x_dent_project/features/home/patient/patient_appoinment_sreen/data/models/cancel_appointment_model.dart';

class CancelAppointmentRepo {
  final ApiService _apiService;

  CancelAppointmentRepo(this._apiService);

  Future<ApiResult<CancelAppointmentModel>> cancelAppointment(
      String token, int appointmentId) async {
    try {
      debugPrint('CancelAppointmentRepo: Sending cancel appointment request for ID: $appointmentId');
      final response = await _apiService.cancelAppointment(token, appointmentId);
      debugPrint('CancelAppointmentRepo: Response received: $response');
      return ApiResult.success(response);
    } catch (error) {
      debugPrint('CancelAppointmentRepo: Error: $error');
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}