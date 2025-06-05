// doctors_reservation_appointments_repository.dart
import 'package:dio/dio.dart';
import 'package:x_dent_project/core/networking/api_constants.dart';
import 'package:x_dent_project/features/home/doctor/doctor_appointment/data/models/doctors_reservation_appointments_model.dart';

class DoctorsReservationAppointmentsRepository {
  final Dio dio;

  DoctorsReservationAppointmentsRepository(this.dio);

  Future<DoctorsReservationAppointmentsModel> fetchReservationAppointment(
      String token, int appointmentId) async {
    try {
      final response = await dio.get(
        ApiConstants.DoctorsReservationAppointments.replaceFirst(
            '{id}', '$appointmentId'),
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      return DoctorsReservationAppointmentsModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to fetch reservation appointment: $e');
    }
  }
}
