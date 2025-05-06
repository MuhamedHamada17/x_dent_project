import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../core/networking/api_error_model.dart';
import '../data/models/cancelled_appointment_model.dart';
import '../data/models/completed_appointment_model.dart';
import '../data/models/upcoming_appointment_model.dart';
part 'appointment_patient_state.freezed.dart';

@freezed
class AppointmentPatientState with _$AppointmentPatientState {
  // Upcoming Appointments States
  const factory AppointmentPatientState.upcomingLoading() = UpcomingLoading;
  const factory AppointmentPatientState.upcomingSuccess(
      AppointmentResponse data) = UpcomingSuccess;
  const factory AppointmentPatientState.upcomingError(
      {required ApiErrorModel error}) = UpcomingError;

  // Cancelled Appointments States
  const factory AppointmentPatientState.cancelledLoading() = CancelledLoading;
  const factory AppointmentPatientState.cancelledSuccess(
      CancelledAppointmentResponse data) = CancelledSuccess;
  const factory AppointmentPatientState.cancelledError(
      {required ApiErrorModel error}) = CancelledError;

  // Confirmed Appointments States
  const factory AppointmentPatientState.confirmedLoading() = ConfirmedLoading;
  const factory AppointmentPatientState.confirmedSuccess(
      CompletedAppointmentResponse data) = ConfirmedSuccess;
  const factory AppointmentPatientState.confirmedError(
      {required ApiErrorModel error}) = ConfirmedError;
}