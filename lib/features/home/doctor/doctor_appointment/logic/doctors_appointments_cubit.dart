import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_dent_project/features/home/doctor/doctor_appointment/data/repos/doctors_appointments_repository.dart';
import 'doctors_appointments_state.dart';

class DoctorsAppointmentsCubit extends Cubit<DoctorsAppointmentsState> {
  final DoctorsAppointmentsRepository repository;

  DoctorsAppointmentsCubit(this.repository)
      : super(const DoctorsAppointmentsState.initial());

  Future<void> getAppointments() async {
    // إصدار حالة التحميل فقط إذا لم يكن الـ Cubit مغلقًا
    if (!isClosed) {
      emit(const DoctorsAppointmentsState.loading());
    }
    try {
      final data = await repository.fetchAllAppointments();
      // إصدار حالة النجاح فقط إذا لم يكن الـ Cubit مغلقًا
      if (!isClosed) {
        emit(DoctorsAppointmentsState.loaded(data));
      }
    } catch (e) {
      // إصدار حالة الخطأ فقط إذا لم يكن الـ Cubit مغلقًا
      if (!isClosed) {
        emit(DoctorsAppointmentsState.error(e.toString()));
      }
    }
  }
}
