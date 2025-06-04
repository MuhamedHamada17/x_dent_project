import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_dent_project/core/helpers/shared_pref_helper.dart';
import 'package:x_dent_project/features/home/patient/patient_appoinment_sreen/data/repos/cancel_appointment_repo.dart';
import 'cancel_appointment_state.dart';

class CancelAppointmentCubit extends Cubit<CancelAppointmentState> {
  final CancelAppointmentRepo _cancelAppointmentRepo;

  CancelAppointmentCubit(this._cancelAppointmentRepo) : super(const CancelAppointmentState.initial());

  Future<void> cancelAppointment() async {
    emit(const CancelAppointmentState.loading());
    try {
      // Get token and appointment ID from SharedPreferences
      final token = await SharedPrefHelper.getSecuredString('access_token');
      final appointmentId = await SharedPrefHelper.getAppointmentId();

      if (token.isEmpty) {
        emit(const CancelAppointmentState.error('No token found'));
        return;
      }
      if (appointmentId == 0) {
        emit(const CancelAppointmentState.error('No appointment ID found'));
        return;
      }

      final result = await _cancelAppointmentRepo.cancelAppointment('Bearer $token', appointmentId);
      result.when(
        success: (response) {
          emit(CancelAppointmentState.success(response));
        },
        failure: (error) {
          emit(CancelAppointmentState.error(error.apiErrorModel.message ?? 'Error cancelling appointment'));
        },
      );
    } catch (e) {
      emit(CancelAppointmentState.error(e.toString()));
    }
  }
}