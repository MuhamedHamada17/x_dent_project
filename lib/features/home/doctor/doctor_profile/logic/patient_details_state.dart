import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_dent_project/core/networking/api_error_model.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/data/models/patient_details_response_model.dart';

part 'patient_details_state.freezed.dart';

@freezed
class PatientDetailsState with _$PatientDetailsState {
  const factory PatientDetailsState.initial() = _Initial;
  const factory PatientDetailsState.loading() = _Loading;
  const factory PatientDetailsState.success(PatientDetailsResponse data) =
      _Success;
  const factory PatientDetailsState.error({required ApiErrorModel error}) =
      _Error;
}
