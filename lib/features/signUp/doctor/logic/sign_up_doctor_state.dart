import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_dent_project/core/networking/api_error_model.dart';

part 'sign_up_doctor_state.freezed.dart';

@freezed
class SignUpDoctorState<T> {
  const factory SignUpDoctorState.initial() = _Initial;
  const factory SignUpDoctorState.loading() = Loading;
  const factory SignUpDoctorState.success(T data) = Success<T>;
  const factory SignUpDoctorState.error({required ApiErrorModel error}) = Error;
}
