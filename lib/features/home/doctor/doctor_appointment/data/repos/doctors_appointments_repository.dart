import 'package:dio/dio.dart';
import 'package:x_dent_project/core/networking/api_constants.dart';
import 'package:x_dent_project/features/home/doctor/doctor_appointment/data/models/doctors_all_appointments_model.dart';

class DoctorsAppointmentsRepository {
  final Dio dio;

  DoctorsAppointmentsRepository(this.dio);

  Future<DoctorsAllAppointmentsModel> fetchAllAppointments() async {
    final response = await dio.get(ApiConstants.DoctorsAllAppointments);
    return DoctorsAllAppointmentsModel.fromJson(response.data);
  }
}
