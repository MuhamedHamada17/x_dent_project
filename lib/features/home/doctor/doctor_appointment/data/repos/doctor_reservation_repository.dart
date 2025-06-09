import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:x_dent_project/core/helpers/shared_pref_helper.dart';
import 'package:x_dent_project/core/networking/api_constants.dart';
import 'package:x_dent_project/core/networking/api_service.dart';
import 'package:x_dent_project/features/home/doctor/doctor_appointment/data/models/doctors_reservation_appointments_model.dart';

class DoctorReservationRepository {
  final ApiService apiService;

  DoctorReservationRepository(this.apiService);

  Future<DoctorsReservationAppointmentsModel> getDoctorReservationAppointment(
      int id) async {
    try {
      if (id <= 0) {
        debugPrint('DoctorReservationRepository: Invalid appointment ID: $id');
        throw Exception('Invalid appointment ID');
      }

      final token = await SharedPrefHelper.getSecuredString('access_token');
      if (token.isEmpty) {
        debugPrint('DoctorReservationRepository: No token found');
        throw Exception('No token found');
      }

      debugPrint(
          'DoctorReservationRepository: Fetching appointment with ID: $id');
      final response =
          await apiService.getDoctorReservationAppointment('Bearer $token', id);
      debugPrint(
          'DoctorReservationRepository: Successfully fetched appointment');
      return response;
    } on DioException catch (e) {
      debugPrint('DoctorReservationRepository: DioException: ${e.message}');
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
      debugPrint('DoctorReservationRepository: Error: $e');
      throw Exception(ApiErrors.defaultError);
    }
  }
}
