// doctors_reservation_appointments_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_dent_project/features/home/doctor/doctor_appointment/data/models/doctors_reservation_appointments_model.dart';

part 'doctors_reservation_appointments_state.freezed.dart';

@freezed
class DoctorsReservationAppointmentsState
    with _$DoctorsReservationAppointmentsState {
  const factory DoctorsReservationAppointmentsState.initial() = _Initial;
  const factory DoctorsReservationAppointmentsState.loading() = _Loading;
  const factory DoctorsReservationAppointmentsState.loaded(
      DoctorsReservationAppointmentsModel data) = _Loaded;
  const factory DoctorsReservationAppointmentsState.error(String message) =
      _Error;
}
