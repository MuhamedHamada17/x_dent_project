import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_dent_project/core/networking/api_error_model.dart';
import 'package:x_dent_project/features/home/patient/patient_profile_screen/data/models/logout_patient_response_model.dart';

part 'logout_patient_state.freezed.dart';

@freezed
class LogoutPatientState with _$LogoutPatientState {
  const factory LogoutPatientState.initial() = _Initial;
  const factory LogoutPatientState.loading() = Loading;
  const factory LogoutPatientState.success(LogoutPatientResponse data) = Success;
  const factory LogoutPatientState.error({required String error}) = Error;
}