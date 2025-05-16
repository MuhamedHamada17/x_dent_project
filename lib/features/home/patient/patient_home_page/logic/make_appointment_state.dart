import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_dent_project/core/networking/api_error_model.dart';
import 'package:x_dent_project/features/home/patient/patient_home_page/data/models/make_appointment_response_model.dart';

part 'make_appointment_state.freezed.dart';

@freezed
class MakeAppointmentState with _$MakeAppointmentState {
  const factory MakeAppointmentState.initial() = _Initial;
  const factory MakeAppointmentState.loading() = Loading;
  const factory MakeAppointmentState.success(MakeAppointmentResponse data) = Success;
  const factory MakeAppointmentState.error({required ApiErrorModel error}) = Error;
}