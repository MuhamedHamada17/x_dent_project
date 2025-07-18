import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_dent_project/core/helpers/shared_pref_helper.dart';
import '../data/repos/appointment_patient_repo.dart';
import 'appointment_patient_state.dart';

class AppointmentPatientCubit extends Cubit<AppointmentPatientState> {
  final AppointmentPatientRepo _appointmentRepo;

  AppointmentPatientCubit(this._appointmentRepo)
      : super(const AppointmentPatientState.upcomingLoading());

  Future<void> fetchUpcomingAppointments() async {
    emit(const AppointmentPatientState.upcomingLoading());
    final response = await _appointmentRepo.getUpcomingAppointments();
    print('Upcoming Response: $response');
    response.when(
      success: (data) {
        print('Upcoming Success: ${data.pendingAppointments}');
        // Save the first appointment ID if the list is not empty
        if (data.pendingAppointments.isNotEmpty) {
          SharedPrefHelper.saveAppointmentId(data.pendingAppointments.first.id);
        }
        emit(AppointmentPatientState.upcomingSuccess(data));
      },
      failure: (error) {
        print('Upcoming Error: ${error.apiErrorModel.message}');
        emit(AppointmentPatientState.upcomingError(error: error.apiErrorModel));
      },
    );
  }

  Future<void> fetchCancelledAppointments() async {
    emit(const AppointmentPatientState.cancelledLoading());
    final response = await _appointmentRepo.getCancelledAppointments();
    print('Cancelled Response: $response');
    response.when(
      success: (data) {
        print('Cancelled Success: ${data.cancelledAppointments}');
        emit(AppointmentPatientState.cancelledSuccess(data));
      },
      failure: (error) {
        print('Cancelled Error: ${error.apiErrorModel.message}');
        emit(AppointmentPatientState.cancelledError(error: error.apiErrorModel));
      },
    );
  }

  Future<void> fetchConfirmedAppointments() async {
    emit(const AppointmentPatientState.confirmedLoading());
    final response = await _appointmentRepo.getConfirmedAppointments();
    print('Confirmed Response: $response');
    response.when(
      success: (data) {
        print('Confirmed Success: ${data.completedAppointments}');
        if (data.completedAppointments.isEmpty) {
          print('Confirmed Success: Emitting success state with empty list');
        }
        emit(AppointmentPatientState.confirmedSuccess(data));
      },
      failure: (error) {
        print('Confirmed Error: ${error.apiErrorModel.message}');
        emit(AppointmentPatientState.confirmedError(error: error.apiErrorModel));
      },
    );
  }
}