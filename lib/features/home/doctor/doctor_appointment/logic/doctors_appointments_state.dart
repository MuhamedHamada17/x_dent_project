import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_dent_project/features/home/doctor/doctor_appointment/data/models/doctors_all_appointments_model.dart';

part 'doctors_appointments_state.freezed.dart';

@freezed
class DoctorsAppointmentsState with _$DoctorsAppointmentsState {
  const factory DoctorsAppointmentsState.initial() = _Initial;
  const factory DoctorsAppointmentsState.loading() = _Loading;
  const factory DoctorsAppointmentsState.loaded(
      DoctorsAllAppointmentsModel data) = _Loaded;
  const factory DoctorsAppointmentsState.error(String message) = _Error;
}
