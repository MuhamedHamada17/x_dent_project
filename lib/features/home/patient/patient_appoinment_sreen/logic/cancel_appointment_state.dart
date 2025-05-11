import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_dent_project/features/home/patient/patient_appoinment_sreen/data/models/cancel_appointment_model.dart';

part 'cancel_appointment_state.freezed.dart';

@freezed
class CancelAppointmentState with _$CancelAppointmentState {
  const factory CancelAppointmentState.initial() = _Initial;
  const factory CancelAppointmentState.loading() = _Loading;
  const factory CancelAppointmentState.success(CancelAppointmentModel response) = _Success;
  const factory CancelAppointmentState.error(String error) = _Error;
}