import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_dent_project/core/networking/api_error_model.dart';
import 'package:x_dent_project/features/home/patient/patient_profile_screen/data/models/edit_profile_patient_response_model.dart';

part 'edit_profile_patient_state.freezed.dart';

@freezed
class EditProfilePatientState with _$EditProfilePatientState {
  const factory EditProfilePatientState.initial() = _Initial;
  const factory EditProfilePatientState.loading() = _Loading;
  const factory EditProfilePatientState.success(EditProfilePatientResponse response) = _Success;
  const factory EditProfilePatientState.error({required ApiErrorModel error}) = _Error;
}