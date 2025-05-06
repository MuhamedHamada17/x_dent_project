import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_dent_project/core/networking/api_error_model.dart';
import 'package:x_dent_project/features/home/patient/patient_profile_screen/data/models/change_password_patient_response.dart';

part 'change_password_patient_state.freezed.dart';

@freezed
class ChangePasswordPatientState with _$ChangePasswordPatientState {
  const factory ChangePasswordPatientState.initial() = _Initial;
  const factory ChangePasswordPatientState.loading() = _Loading;
  const factory ChangePasswordPatientState.success(
      ChangePasswordPatientResponse data) = _Success;
  const factory ChangePasswordPatientState.error({
    required ApiErrorModel error,
  }) = _Error;
}