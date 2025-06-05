// doctors_reservation_appointments_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_dent_project/features/home/doctor/doctor_appointment/data/repos/doctor_reservation_repository.dart';
import 'doctors_reservation_appointments_state.dart';

class DoctorsReservationAppointmentsCubit
    extends Cubit<DoctorsReservationAppointmentsState> {
  final DoctorsReservationAppointmentsRepository repository;

  DoctorsReservationAppointmentsCubit(this.repository)
      : super(const DoctorsReservationAppointmentsState.initial());

  Future<void> getReservationAppointment(
      String token, int appointmentId) async {
    emit(const DoctorsReservationAppointmentsState.loading());
    try {
      final data =
          await repository.fetchReservationAppointment(token, appointmentId);
      emit(DoctorsReservationAppointmentsState.loaded(data));
    } catch (e) {
      emit(DoctorsReservationAppointmentsState.error(e.toString()));
    }
  }
}
