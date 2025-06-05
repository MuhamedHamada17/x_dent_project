// doctor_patient_list_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_dent_project/core/networking/api_error_model.dart';

part 'doctor_patient_list_state.freezed.dart';

@freezed
class DoctorPatientListState<T> with _$DoctorPatientListState<T> {
  const factory DoctorPatientListState.initial() = _Initial;
  const factory DoctorPatientListState.loading() = _Loading;
  const factory DoctorPatientListState.success(T data) = _Success<T>;
  const factory DoctorPatientListState.error({required ApiErrorModel error}) =
      _Error;
}
