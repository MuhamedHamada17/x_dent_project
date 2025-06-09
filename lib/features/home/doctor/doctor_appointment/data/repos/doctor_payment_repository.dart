import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:x_dent_project/core/helpers/shared_pref_helper.dart';
import 'package:x_dent_project/core/networking/api_constants.dart';
import 'package:x_dent_project/core/networking/api_service.dart';
import 'package:x_dent_project/features/home/doctor/doctor_appointment/data/models/doctors_payment_appointments_model.dart';

class DoctorPaymentRepository {
  final ApiService apiService;

  DoctorPaymentRepository(this.apiService);

  Future<DoctorsPaymentAppointmentsModel> getDoctorPaymentAppointment(
      int id) async {
    try {
      if (id <= 0) {
        debugPrint('DoctorPaymentRepository: Invalid appointment ID: $id');
        throw Exception('Invalid appointment ID');
      }

      final token = await SharedPrefHelper.getSecuredString('access_token');
      debugPrint('DoctorPaymentRepository: Retrieved token: $token');
      if (token.isEmpty) {
        debugPrint('DoctorPaymentRepository: No token found');
        throw Exception('No token found');
      }

      debugPrint(
          'DoctorPaymentRepository: Fetching payment with ID: $id from ${ApiConstants.DoctorsPaymentAppointments}');
      final response =
          await apiService.getDoctorPaymentAppointment('Bearer $token', id);
      debugPrint('DoctorPaymentRepository: Raw response: ${response.toJson()}');
      debugPrint(
          'DoctorPaymentRepository: Successfully fetched payment: ${response.appointments.toJson()}');
      return response;
    } on DioException catch (e) {
      debugPrint(
          'DoctorPaymentRepository: DioException: ${e.message}, StatusCode: ${e.response?.statusCode}, Response: ${e.response?.data}');
      if (e.response?.statusCode == 404) {
        throw Exception(ApiErrors.notFoundError);
      } else if (e.response?.statusCode == 401) {
        throw Exception(ApiErrors.unauthorizedError);
      } else if (e.response?.statusCode == 403) {
        throw Exception(ApiErrors.forbiddenError);
      } else {
        throw Exception(ApiErrors.defaultError);
      }
    } catch (e) {
      debugPrint('DoctorPaymentRepository: Error: $e');
      throw Exception(ApiErrors.defaultError);
    }
  }
}
