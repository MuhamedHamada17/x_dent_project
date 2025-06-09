import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_dent_project/features/home/doctor/doctor_appointment/data/repos/doctor_payment_repository.dart';
import 'package:x_dent_project/features/home/doctor/doctor_appointment/logic/doctors_payment_appointments_state.dart';

class DoctorPaymentCubit extends Cubit<DoctorPaymentState> {
  final DoctorPaymentRepository repository;

  DoctorPaymentCubit(this.repository)
      : super(const DoctorPaymentState.initial());

  Future<void> fetchDoctorPaymentAppointment(int id) async {
    if (isClosed) {
      debugPrint('DoctorPaymentCubit: Cannot fetch, cubit is closed');
      return;
    }
    emit(const DoctorPaymentState.loading());
    try {
      final response = await repository.getDoctorPaymentAppointment(id);
      if (!isClosed) {
        emit(DoctorPaymentState.success(response));
      }
    } catch (e) {
      if (!isClosed) {
        emit(DoctorPaymentState.error(e.toString()));
      }
    }
  }

  void reset() {
    if (!isClosed) {
      emit(const DoctorPaymentState.initial());
    } else {
      debugPrint('DoctorPaymentCubit: Cannot reset, cubit is closed');
    }
  }

  @override
  Future<void> close() {
    debugPrint('DoctorPaymentCubit: Closing cubit');
    return super.close();
  }
}
