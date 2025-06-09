import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_dent_project/features/home/doctor/doctor_appointment/data/models/doctors_payment_appointments_model.dart';

part 'doctors_payment_appointments_state.freezed.dart';

@freezed
class DoctorPaymentState with _$DoctorPaymentState {
  const factory DoctorPaymentState.initial() = _Initial;
  const factory DoctorPaymentState.loading() = _Loading;
  const factory DoctorPaymentState.success(
      DoctorsPaymentAppointmentsModel data) = _Success;
  const factory DoctorPaymentState.error(String message) = _Error;
}
