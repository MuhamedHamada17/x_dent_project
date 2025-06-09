import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_dent_project/features/home/doctor/doctor_appointment/data/repos/doctor_reservation_repository.dart';
import 'package:x_dent_project/features/home/doctor/doctor_appointment/logic/doctors_reservation_appointments_state.dart';

class DoctorReservationCubit extends Cubit<DoctorReservationState> {
  final DoctorReservationRepository repository;

  DoctorReservationCubit(this.repository)
      : super(const DoctorReservationState.initial());

  Future<void> fetchDoctorReservationAppointment(int id) async {
    emit(const DoctorReservationState.loading());
    try {
      final response = await repository.getDoctorReservationAppointment(id);
      emit(DoctorReservationState.success(response));
    } catch (e) {
      emit(DoctorReservationState.error(e.toString()));
    }
  }
}
