import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_dent_project/features/home/doctor/doctor_appointment/data/models/doctors_reservation_appointments_model.dart';

part 'doctors_reservation_appointments_state.freezed.dart';

@freezed
class DoctorReservationState with _$DoctorReservationState {
  const factory DoctorReservationState.initial() = _Initial;
  const factory DoctorReservationState.loading() = _Loading;
  const factory DoctorReservationState.success(
      DoctorsReservationAppointmentsModel data) = _Success;
  const factory DoctorReservationState.error(String message) = _Error;
}
